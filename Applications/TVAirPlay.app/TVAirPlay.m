id sub_100004020()
{
  if (qword_10003F6D8 != -1) {
    dispatch_once(&qword_10003F6D8, &stru_100030960);
  }
  return (id)qword_10003F6D0;
}

void sub_100004060(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.application", "");
  v2 = (void *)qword_10003F6D0;
  qword_10003F6D0 = (uint64_t)v1;
}

id sub_100004090()
{
  if (qword_10003F6E8 != -1) {
    dispatch_once(&qword_10003F6E8, &stru_100030980);
  }
  return (id)qword_10003F6E0;
}

void sub_1000040D0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.communication", "");
  v2 = (void *)qword_10003F6E0;
  qword_10003F6E0 = (uint64_t)v1;
}

id sub_100004100()
{
  if (qword_10003F6F8 != -1) {
    dispatch_once(&qword_10003F6F8, &stru_1000309A0);
  }
  return (id)qword_10003F6F0;
}

void sub_100004140(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.mediaItem", "");
  v2 = (void *)qword_10003F6F0;
  qword_10003F6F0 = (uint64_t)v1;
}

id sub_100004170()
{
  if (qword_10003F708 != -1) {
    dispatch_once(&qword_10003F708, &stru_1000309C0);
  }
  return (id)qword_10003F700;
}

void sub_1000041B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.metadata", "");
  v2 = (void *)qword_10003F700;
  qword_10003F700 = (uint64_t)v1;
}

id sub_1000041E0()
{
  if (qword_10003F718 != -1) {
    dispatch_once(&qword_10003F718, &stru_1000309E0);
  }
  return (id)qword_10003F710;
}

void sub_100004220(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.player", "");
  v2 = (void *)qword_10003F710;
  qword_10003F710 = (uint64_t)v1;
}

id sub_100004250()
{
  if (qword_10003F728 != -1) {
    dispatch_once(&qword_10003F728, &stru_100030A00);
  }
  return (id)qword_10003F720;
}

void sub_100004290(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.service", "");
  v2 = (void *)qword_10003F720;
  qword_10003F720 = (uint64_t)v1;
}

id sub_1000042C0()
{
  if (qword_10003F738 != -1) {
    dispatch_once(&qword_10003F738, &stru_100030A20);
  }
  return (id)qword_10003F730;
}

void sub_100004300(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.session", "");
  v2 = (void *)qword_10003F730;
  qword_10003F730 = (uint64_t)v1;
}

id sub_100004330()
{
  if (qword_10003F748 != -1) {
    dispatch_once(&qword_10003F748, &stru_100030A40);
  }
  return (id)qword_10003F740;
}

void sub_100004370(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.session", "APRK");
  v2 = (void *)qword_10003F740;
  qword_10003F740 = (uint64_t)v1;
}

id sub_1000043A0()
{
  if (qword_10003F758 != -1) {
    dispatch_once(&qword_10003F758, &stru_100030A60);
  }
  return (id)qword_10003F750;
}

void sub_1000043E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.session", "URL");
  v2 = (void *)qword_10003F750;
  qword_10003F750 = (uint64_t)v1;
}

id sub_100004410()
{
  if (qword_10003F768 != -1) {
    dispatch_once(&qword_10003F768, &stru_100030A80);
  }
  return (id)qword_10003F760;
}

void sub_100004450(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.session", "manager");
  v2 = (void *)qword_10003F760;
  qword_10003F760 = (uint64_t)v1;
}

id sub_100004480()
{
  if (qword_10003F778 != -1) {
    dispatch_once(&qword_10003F778, &stru_100030AA0);
  }
  return (id)qword_10003F770;
}

void sub_1000044C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVAirPlay.session", "APRKManager");
  v2 = (void *)qword_10003F770;
  qword_10003F770 = (uint64_t)v1;
}

LABEL_16:
  [v6 setValue:v17 forProperty:TVCKDataPropertyMediaType];
  v22 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"mightSupportStorePastisKeyRequests"]);
  if (v22) {
    v23 = (void *)v22;
  }
  else {
    v23 = &__kCFBooleanFalse;
  }
  [v6 setValue:v23 forProperty:TVCKDataPropertyAllowedToUseHLS];
  [v6 commitUpdateTransactionWithOptions:0];

  return v6;
}
}

void sub_100005B6C(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AVSystemController sharedAVSystemController]( &OBJC_CLASS___AVSystemController,  "sharedAVSystemController"));
  [v5 setAttribute:v4 forKey:AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute error:0];

  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"rate"]);
  v7 = (void *)v6;
  v8 = &off_100033438;
  if (v6) {
    v8 = (_UNKNOWN **)v6;
  }
  v9 = v8;

  [v9 doubleValue];
  double v11 = v10;

  if (v11 == 0.0)
  {
    [*(id *)(*(void *)(a1 + 40) + 32) pause];
  }

  else
  {
    v12 = *(void **)(*(void *)(a1 + 40) + 32LL);
    if (v11 >= 1.0 && v11 <= 2.0)
    {
      [v12 setRateUsedForPlayback:v11];
      uint64_t v14 = *(void *)(a1 + 40);
      if (*(_BYTE *)(v14 + 10)) {
        [*(id *)(v14 + 32) play];
      }
    }

    else
    {
      [v12 scanWithRate:v11];
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

LABEL_21:
  return v12;
}

LABEL_14:
        if (!v14)
        {
LABEL_25:
          id v15 = 1;
          goto LABEL_26;
        }

        goto LABEL_15;
      }

      v22 = objc_alloc(&OBJC_CLASS___NSError);
      v23 = NSOSStatusErrorDomain;
      v24 = -6756LL;
LABEL_13:
      uint64_t v14 = -[NSError initWithDomain:code:userInfo:](v22, "initWithDomain:code:userInfo:", v23, v24, 0LL);
      goto LABEL_14;
    }

    if ([v10 isEqualToString:@"selectedMediaArray"])
    {
      -[TVPPlayer setSelectedMediaArray:](self->_player, "setSelectedMediaArray:", v12);
      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"muted"])
    {
      -[TVPPlayer setMuted:](self->_player, "setMuted:", [v12 BOOLValue]);
      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"volume"])
    {
      v35 = self->_player;
      [v12 floatValue];
      -[TVPPlayer setVolume:](v35, "setVolume:");
      goto LABEL_24;
    }

    if ([v10 isEqualToString:@"actionAtItemEnd"])
    {
      if (v12)
      {
        v36 = [v12 integerValue];
        if (v36)
        {
          if (v36 == (id)1)
          {
            v62 = self->_player;
            id v15 = 1;
            -[TVPPlayer setMediaItemEndAction:](v62, "setMediaItemEndAction:", 1LL);
            uint64_t v14 = 0LL;
            goto LABEL_26;
          }

          if (v36 != (id)2) {
            goto LABEL_24;
          }
          v37 = self->_player;
          v38 = 2LL;
        }

        else
        {
          v37 = self->_player;
          v38 = 0LL;
        }

        -[TVPPlayer setMediaItemEndAction:](v37, "setMediaItemEndAction:", v38);
LABEL_24:
        uint64_t v14 = 0LL;
        goto LABEL_25;
      }

      v22 = objc_alloc(&OBJC_CLASS___NSError);
      v23 = NSOSStatusErrorDomain;
      v24 = -6705LL;
      goto LABEL_13;
    }

    if ([v10 isEqualToString:@"metaData"])
    {
      v39 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v12, v39) & 1) != 0) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL);
      }
      v44 = [v12 mutableCopy];
      -[TVPPlayer elapsedTime](self->_player, "elapsedTime");
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v44 setObject:v45 forKeyedSubscript:@"elapsedTime"];

      -[TVPPlayer rate](self->_player, "rate");
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v44 setObject:v46 forKeyedSubscript:@"rate"];

      +[TVAirPlayMetadataMonitor updateWithParameters:]( &OBJC_CLASS___TVAirPlayMetadataMonitor,  "updateWithParameters:",  v44);
      goto LABEL_14;
    }

    if ([v10 isEqualToString:@"textMarkupArray"])
    {
      v40 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v12, v40) & 1) == 0)
      {
        uint64_t v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL);
        if (v14) {
          goto LABEL_15;
        }
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
      v42 = v41;
      v43 = &TVPMediaItemMetadataWebVTTStyles;
LABEL_64:
      [v41 setMediaItemMetadata:v12 forProperty:*v43];
      goto LABEL_65;
    }

    if ([v10 isEqualToString:@"isInterestedInDateRange"])
    {
      v47 = [v12 BOOLValue];
      self->_wantsDateRangeCollection = v47;
      if (!v47) {
        goto LABEL_24;
      }
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 AVQueuePlayer]);
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 items]);

      obj = v50;
      v51 = [v50 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v51)
      {
        v52 = v51;
        v53 = *(void *)v75;
        do
        {
          for (i = 0LL; i != v52; i = (char *)i + 1)
          {
            if (*(void *)v75 != v53) {
              objc_enumerationMutation(obj);
            }
            v55 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
            v56 = -[AVPlayerItemMetadataCollector initWithIdentifiers:classifyingLabels:]( objc_alloc(&OBJC_CLASS___AVPlayerItemMetadataCollector),  "initWithIdentifiers:classifyingLabels:",  0LL,  0LL);
            -[AVPlayerItemMetadataCollector setDelegate:queue:](v56, "setDelegate:queue:", self, &_dispatch_main_q);
            [v55 addMediaDataCollector:v56];
          }

          v52 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
        }

        while (v52);
      }

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playlist](self->_player, "playlist"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v57 trackList]);

      v58 = [v19 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v58)
      {
        v59 = v58;
        v60 = *(void *)v71;
        do
        {
          for (j = 0LL; j != v59; j = (char *)j + 1)
          {
            if (*(void *)v71 != v60) {
              objc_enumerationMutation(v19);
            }
            -[TVAirPlayURLSession addDateRangeCollectorToItem:]( self,  "addDateRangeCollectorToItem:",  *(void *)(*((void *)&v70 + 1) + 8LL * (void)j));
          }

          v59 = [v19 countByEnumeratingWithState:&v70 objects:v79 count:16];
        }

        while (v59);
      }

      goto LABEL_23;
    }

    if ([v10 isEqualToString:@"sharedAudioSessionID"])
    {
      v63 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v12, v63) & 1) == 0)
      {
        uint64_t v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL);
        if (v14) {
          goto LABEL_15;
        }
      }

      -[TVAirPlayURLSession setAudioSessionID:](self, "setAudioSessionID:", v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
      objc_msgSend(v42, "setAudioSessionID:", objc_msgSend(v12, "unsignedIntValue"));
    }

    else
    {
      if ([v10 isEqualToString:kFigEndpointPlaybackSessionKey_InterstitialEvents])
      {
        v64 = objc_opt_class(&OBJC_CLASS___NSArray);
        if ((objc_opt_isKindOfClass(v12, v64) & 1) != 0
          || (uint64_t v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL)) == 0LL)
        {
          -[TVAirPlayURLSession setInterstitialEvents:](self, "setInterstitialEvents:", v12);
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v65 AVQueuePlayer]);

          v66 = (void *)objc_claimAutoreleasedReturnValue([v19 currentItem]);
          [v19 _noteRemoteInterstitialEvents:v12 forItem:v66];

          goto LABEL_23;
        }

LABEL_15:
        v25 = sub_1000043A0();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 138543618;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
          LOWORD(buf.flags) = 2114;
          *(void *)((char *)&buf.flags + 2) = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Error setting property:  %{public}@, error: %{public}@",  (uint8_t *)&buf,  0x16u);
        }

        if (a6)
        {
          uint64_t v14 = v14;
          id v15 = 0;
          *a6 = v14;
        }

        else
        {
          id v15 = 0;
        }

        goto LABEL_26;
      }

      if (![v10 isEqualToString:kFigEndpointPlaybackSessionKey_CurrentInterstitialEvent])
      {
        if ([v10 isEqualToString:kFigEndpointPlaybackSessionKey_TimeToPauseBuffering])
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
          v42 = v41;
          v43 = &TVPMediaItemMetadataTimeToPauseBuffering;
        }

        else
        {
          if (![v10 isEqualToString:kFigEndpointPlaybackSessionKey_TimeToPausePlayback])
          {
            v22 = objc_alloc(&OBJC_CLASS___NSError);
            v23 = NSOSStatusErrorDomain;
            v24 = -6735LL;
            goto LABEL_13;
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self->_player, "currentMediaItem"));
          v42 = v41;
          v43 = &TVPMediaItemMetadataTimeToPausePlayback;
        }

        goto LABEL_64;
      }

      v67 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v12, v67) & 1) == 0)
      {
        uint64_t v14 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6705LL,  0LL);
        if (v14) {
          goto LABEL_15;
        }
      }

      -[TVAirPlayURLSession setCurrentInterstitialEventID:](self, "setCurrentInterstitialEventID:", v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession player](self, "player"));
      v68 = (void *)objc_claimAutoreleasedReturnValue([v42 AVQueuePlayer]);
      [v68 _noteCurrentRemoteInterstitialEvent:v12];
    }

    -[TVAirPlayAPRKManager _stopAndClearActiveRenderer](self, "_stopAndClearActiveRenderer");
    -[TVAirPlayAPRKManager _deregisterActiveVideoSessionIfRequired](self, "_deregisterActiveVideoSessionIfRequired");
    -[TVAirPlayAPRKManager _updateNowPlayingForRenderer:](self, "_updateNowPlayingForRenderer:", v4);
    -[TVAirPlayAPRKManager setActiveRenderer:](self, "setActiveRenderer:", v4);
    -[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]( self,  "_registerActiveVideoSessionIfRequiredForRenderer:",  v4);
    goto LABEL_16;
  }

  v8 = sub_100004480();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10001BC28(v9, v10, v11, v12, v13, v14, v15, v16);
  }

LABEL_16:
}

LABEL_65:
    goto LABEL_24;
  }

  id v15 = 0;
LABEL_27:

  return v15;
}

LABEL_20:
        v13 = v15 == 0LL;
        goto LABEL_21;
      }

      v36 = 0LL;
      -[TVAirPlayURLSession _handleFailedURLResponseWithOptions:error:]( self,  "_handleFailedURLResponseWithOptions:error:",  v11,  &v36);
      v16 = (NSError *)v36;
    }

    else
    {
      v16 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6745LL,  0LL);
    }

    id v15 = v16;
    if (a6) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
  v13 = [v12 performAction:v10 withOptions:v11 outInfo:a5 error:a6];

LABEL_21:
  return v13;
}
}

void sub_100007424( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id *sub_100007444(id *result, double a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained(result + 4);
    [WeakRetained rate];
    float v7 = v6;

    id v8 = sub_1000043A0();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134349056;
      double v12 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Scanning: Setting Elapsed time to %{public}f",  (uint8_t *)&v11,  0xCu);
    }

    *(float *)&double v10 = v7;
    return (id *)+[TVAirPlayMetadataMonitor updateWithElapsedTime:playbackRate:]( &OBJC_CLASS___TVAirPlayMetadataMonitor,  "updateWithElapsedTime:playbackRate:",  a2,  v10);
  }

  return result;
}

LABEL_10:
}
}
}

void sub_10000807C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_1000043A0();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10001BA04(v3);
    }

    [WeakRetained sendEventToDelegate:@"ended" withInfo:0];
  }
}

id sub_100008350(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);
  v4 = v3;
  if (v3 && *(void *)(a1 + 32)) {
    id v5 = objc_msgSend(v3, "isEqualToString:");
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

LABEL_25:
          goto LABEL_26;
        }

        double v6 = 0LL;
LABEL_15:
        v34 = v13;
        if ((unint64_t)(v12 - 301) > 4 || v12 == (char *)304)
        {
          if (v10)
          {
            v28 = v10;
            v29 = v15;
            v30 = objc_alloc(&OBJC_CLASS___NSHTTPURLResponse);
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13));
            v32 = v30;
            id v15 = v29;
            double v10 = v28;
            v20 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( v32,  "initWithURL:statusCode:HTTPVersion:headerFields:",  v31,  v12,  @"HTTP/1.1",  v14);

            [v6 finishLoadingWithResponse:v20 data:v10 renewalDate:v15 redirect:0];
          }

          else
          {
            v20 = (NSHTTPURLResponse *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  v12,  0LL));
            [v6 finishLoadingWithError:v20];
          }
        }

        else
        {
          v20 = (NSHTTPURLResponse *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tvs_stringForKey:", @"Location"));
          if (v20)
          {
            v33 = v10;
            v21 = v15;
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](&OBJC_CLASS___NSURLRequest, "requestWithURL:", v22));

            v24 = objc_alloc(&OBJC_CLASS___NSHTTPURLResponse);
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v34));
            v26 = -[NSHTTPURLResponse initWithURL:statusCode:HTTPVersion:headerFields:]( v24,  "initWithURL:statusCode:HTTPVersion:headerFields:",  v25,  v12,  @"HTTP/1.1",  v14);

            id v15 = v21;
            double v10 = v33;
            [v6 finishLoadingWithResponse:v26 data:0 renewalDate:0 redirect:v23];
          }

          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  v12,  0LL));
            [v6 finishLoadingWithError:v23];
          }
        }

        if (v9) {
          -[NSMutableDictionary removeObjectForKey:](self->_resourceLoadingRequests, "removeObjectForKey:", v9);
        }
        float v7 = 0LL;
        id v8 = 1;
        v13 = v34;
        goto LABEL_25;
      }

      double v6 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_resourceLoadingRequests,  "objectForKeyedSubscript:",  v9));
      if (v6) {
        goto LABEL_15;
      }
      v17 = objc_alloc(&OBJC_CLASS___NSError);
      v18 = NSOSStatusErrorDomain;
      v19 = -6727LL;
    }

    else
    {
      v17 = objc_alloc(&OBJC_CLASS___NSError);
      v18 = NSOSStatusErrorDomain;
      v19 = -6708LL;
    }

    v16 = -[NSError initWithDomain:code:userInfo:](v17, "initWithDomain:code:userInfo:", v18, v19, 0LL);
    goto LABEL_11;
  }

  float v7 = (NSError *)objc_claimAutoreleasedReturnValue(-[TVAirPlayURLSession interstitialSession](self, "interstitialSession"));
  id v8 = -[NSError _handleFailedURLResponseWithOptions:error:]( v7,  "_handleFailedURLResponseWithOptions:error:",  v6,  a4);
LABEL_26:

  return v8;
}

void sub_100009BC4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"allowP2P"]);
  [*(id *)(a1 + 40) setMediaItemMetadata:v2 forProperty:TVPMediaItemMetadataAllowAppleWirelessDirectLink];
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"purchaseBundle"]);
  [*(id *)(a1 + 40) setMediaItemMetadata:v3 forProperty:TVPMediaItemMetadataAcquisitionDictionary];
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"outOfBandAlternateTracks"]);
  [*(id *)(a1 + 40) setMediaItemMetadata:v4 forProperty:TVPMediaItemMetadataOutOfBandAlternateTracks];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"textMarkupArray"]);
  [*(id *)(a1 + 40) setMediaItemMetadata:v5 forProperty:TVPMediaItemMetadataWebVTTStyles];
  v45 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"uuid"]);
  objc_msgSend(*(id *)(a1 + 40), "setMediaItemMetadata:forProperty:");
  double v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"forwardEndTime"]);
  float v7 = v6;
  if (v6)
  {
    CMTimeMakeFromDictionary(&v49, v6);
    if ((v49.flags & 0x1D) == 1)
    {
      CMTime time = v49;
      id v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&time));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      [*(id *)(a1 + 40) setMediaItemMetadata:v9 forProperty:TVPMediaItemMetadataForwardPlaybackEndTime];
    }
  }

  double v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"reverseEndTime"]);
  int v11 = v10;
  if (v10)
  {
    CMTimeMakeFromDictionary(&v49, v10);
    if ((v49.flags & 0x1D) == 1)
    {
      CMTime time = v49;
      double v12 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&time));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      [*(id *)(a1 + 40) setMediaItemMetadata:v13 forProperty:TVPMediaItemMetadataReversePlaybackEndTime];
    }
  }

  v43 = v11;
  uint64_t v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:kFigEndpointPlaybackSessionProxiedProperty_TimeToPauseBuffering]);
  id v15 = v14;
  if (v14)
  {
    CMTimeMakeFromDictionary(&v47, v14);
    if ((v47.flags & 0x1D) == 1) {
      [*(id *)(a1 + 40) setMediaItemMetadata:v15 forProperty:TVPMediaItemMetadataTimeToPauseBuffering];
    }
  }

  v44 = v7;
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKeyedSubscript:kFigEndpointPlaybackSessionProxiedProperty_TimeToPausePlayback]);
  v17 = v16;
  if (v16)
  {
    CMTimeMakeFromDictionary(&v46, v16);
    if ((v46.flags & 0x1D) == 1) {
      [*(id *)(a1 + 40) setMediaItemMetadata:v17 forProperty:TVPMediaItemMetadataTimeToPausePlayback];
    }
  }

  id v18 = TVPMediaTypeVideo;
  v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"audioOnly"]);
  unsigned int v20 = [v19 BOOLValue];

  if (v20)
  {
    v21 = v18;
    id v18 = TVPMediaTypeMusic;
  }

  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"purchasedMediaKind"]);
    [v21 isEqualToString:@"music"];
  }

  [*(id *)(a1 + 40) setMediaItemMetadata:v18 forProperty:TVPMediaItemMetadataMediaType];
  v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"senderAltConfig"]);
  if ([v22 count])
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"iTunesServiceMonitoringKey"]);
    if ([v23 BOOLValue])
    {
      [*(id *)(a1 + 40) setMediaItemMetadata:v22 forProperty:TVPMediaItemMetadataAVURLAssetAlternativeConfigurationOptions];
      [*(id *)(a1 + 40) removeMediaItemMetadataForProperty:TVPMediaItemMetadataServiceIdentifier];
    }
  }

  if (!*(_BYTE *)(a1 + 48))
  {
    v33 = v15;
    v35 = v5;
    v37 = v4;
    v39 = v3;
    v41 = v2;
    v24 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"Play-Info"]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"fpSessionID"]);
    v27 = (void *)v26;
    if (v25 && v26)
    {
      if ([v25 length]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v25,  AVContentAuthorizationInfoPlayInfoKey);
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  v27,  AVContentAuthorizationInfoSessionIDKey,  v33,  v5,  v4,  v39,  v41);
      id v28 = sub_1000043A0();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        sub_10001BA44((uint64_t)v24, v29);
      }

      [*(id *)(a1 + 40) setMediaItemMetadata:v24 forProperty:TVPMediaItemMetadataAirPlayAuthorizationInfo];
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "objectForKeyedSubscript:",  @"tlsPSKClientIdentity",  v33,  v35,  v37,  v39,  v41));
    v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"tlsPSK"]);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayMediaItem sslPropertiesForIdentity:psk:]( &OBJC_CLASS___TVAirPlayMediaItem,  "sslPropertiesForIdentity:psk:",  v30,  v31));
    [*(id *)(a1 + 40) setMediaItemMetadata:v32 forProperty:TVPMediaItemMetadataSSLProperties];

    v3 = v40;
    id v2 = v42;
    id v5 = v36;
    v4 = v38;
    id v15 = v34;
  }
}

void sub_10000A1A4(id a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 URLsForDirectory:5 inDomains:1]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"FPSSecureStop"]);
  v4 = (void *)qword_10003F780;
  qword_10003F780 = v3;
}

void sub_10000A4C0(id a1)
{
  v3[0] = @"album";
  v3[1] = @"artist";
  v4[0] = kMRMediaRemoteNowPlayingInfoAlbum;
  v4[1] = kMRMediaRemoteNowPlayingInfoArtist;
  v3[2] = @"artworkData";
  v3[3] = @"artworkMIMEType";
  v4[2] = kMRMediaRemoteNowPlayingInfoArtworkData;
  v4[3] = kMRMediaRemoteNowPlayingInfoArtworkMIMEType;
  v3[4] = @"duration";
  v3[5] = @"elapsedTime";
  v4[4] = kMRMediaRemoteNowPlayingInfoDuration;
  v4[5] = kMRMediaRemoteNowPlayingInfoElapsedTime;
  v3[6] = @"rate";
  v3[7] = @"title";
  v4[6] = kMRMediaRemoteNowPlayingInfoPlaybackRate;
  v4[7] = kMRMediaRemoteNowPlayingInfoTitle;
  v3[8] = @"totalTracks";
  v3[9] = @"trackNumber";
  v4[8] = kMRMediaRemoteNowPlayingInfoTotalTrackCount;
  v4[9] = kMRMediaRemoteNowPlayingInfoTrackNumber;
  v3[10] = @"uniqueID";
  v4[10] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  11LL));
  id v2 = (void *)qword_10003F790;
  qword_10003F790 = v1;
}

void sub_10000A87C(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:a2]);
  if (v5)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    unsigned __int8 v7 = [v8 isEqual:v6];

    if ((v7 & 1) == 0) {
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
    }
  }
}

void sub_10000AD18(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10003F7A0;
  qword_10003F7A0 = (uint64_t)v1;
}

void sub_10000B1E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_100004410();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Timed out, manually deregistering session: %{public}@",  (uint8_t *)&v4,  0xCu);
    }

    [WeakRetained stopWithOptions:0 error:0];
  }
}

void sub_10000B2A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_100004410();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = WeakRetained;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Timed out, manually deregistering session: %{public}@",  (uint8_t *)&v5,  0xCu);
    }

    int v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    [v4 deregisterSession:WeakRetained options:0];
  }
}

id sub_10000B9D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBackgroundSessionUpdate];
}

id sub_10000B9DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:@"View Controller"]);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  return [*(id *)(a1 + 32) _handleForegroundUpdate];
}

id sub_10000BA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:@"Error"]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _cleanupWithError:v6]);

  return v7;
}

id sub_10000BA70(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleForegroundUpdate];
}

id sub_10000BA78(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  return [*(id *)(a1 + 32) _handleBackgroundSessionUpdate];
}

id sub_10000BBF8(uint64_t a1)
{
  id v2 = sub_100004410();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waking device for visual playback type", v6, 2u);
  }

  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v4 wakeSystemForReason:PBSWakeReasonAirPlay];

  return [*(id *)(a1 + 32) _requestMediaViewController];
}

void sub_10000C11C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004410();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10001BAB8((uint64_t)v3, v5);
  }

  if (v3)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24LL);
    v9 = @"Error";
    id v10 = v3;
    id v7 = v3;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    [v6 postEvent:@"Error" withContext:0 userInfo:v8];
  }
}

uint64_t sub_10000C214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000C2E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sessionType];
  id v5 = *(id *)(a1 + 40);
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___TVAirPlayLegacySession])
  {
    id v6 = v3;
    id v7 = v6;
    if (*(void *)(a1 + 32))
    {
      unsigned int v8 = [v6 sessionID];
      BOOL v9 = v8 == [*(id *)(a1 + 32) unsignedIntValue];
    }

    else
    {
      BOOL v9 = 1;
    }

    if (*(_BYTE *)(a1 + 48)) {
      unsigned int v10 = [v7 deactivated] ^ 1;
    }
    else {
      unsigned int v10 = 1;
    }
  }

  else
  {
    unsigned int v10 = 1;
    BOOL v9 = 1;
  }

  if (v4 == v5) {
    uint64_t v11 = v9 & v10;
  }
  else {
    uint64_t v11 = 0LL;
  }

  return v11;
}

void sub_10000D4A0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentMediaSelection]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 selectedMediaOptionInMediaSelectionGroup:v10]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 propertyList]);
    if (v8)
    {
      id v9 = *(id *)(a1 + 40);
      objc_sync_enter(v9);
      [*(id *)(a1 + 40) addObject:v8];
      objc_sync_exit(v9);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000D564(_Unwind_Exception *a1)
{
}

void sub_10000E1E0(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 activeRenderer]);
  objc_msgSend( v3, "postVideoV1EventWithType:params:", objc_msgSend(*(id *)(a1 + 32), "cStringUsingEncoding:", 4), *(void *)(a1 + 40));
}

void sub_10000E7AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 APRKPinSession]);
  if (v6)
  {
    id v7 = sub_100004480();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001BDBC(a1, (uint64_t)v6, v8);
    }

    objc_msgSend(v5, "_onMainQueue_deregisterSession:", v6);
  }

  id v9 = -[TVAirPlayAPRKPinSession initWithPasscode:clientName:]( objc_alloc(&OBJC_CLASS___TVAirPlayAPRKPinSession),  "initWithPasscode:clientName:",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
  -[TVAirPlayAPRKPinSession setDelegate:](v9, "setDelegate:", v5);
  id v10 = sub_100004480();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 136315650;
    uint64_t v14 = "-[TVAirPlayAPRKManager shouldShowGlobalPasscodeWithString:withClientName:]_block_invoke";
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Registering global pin session {clientName=%{public}@} {session=%{public}@}",  (uint8_t *)&v13,  0x20u);
  }

  objc_msgSend(v5, "_onMainQueue_registerGlobalPinSession:clientName:", v9, *(void *)(a1 + 32));
}

void sub_10000E9CC(id a1, TVAirPlayAPRKManager *a2, TVAirPlaySessionManager *a3)
{
}

void sub_10000EBAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained managerDelegate]);
  [v2 managerDidUpdateRenderer:*(void *)(a1 + 32)];
}

void sub_10000ED48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained managerDelegate]);
  [v2 managerDidUpdateRenderer:*(void *)(a1 + 32)];
}

void sub_10000EE44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sessionManager]);
    (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);

    id WeakRetained = v5;
  }
}

void sub_10000EF6C(_Unwind_Exception *a1)
{
}

void sub_10000EF80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id WeakRetained = v3;
  }
}

void sub_10000F340(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000F3D4;
  v5[3] = &unk_100030E50;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  objc_msgSend(a2, "_onMainQueue_registerSession:withCompletionHandler:", v4, v5);
}

void sub_10000F3D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100004480();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001BF34(a1, (uint64_t)v3, v6);
    }

    [*(id *)(a1 + 32) stop];
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedClientName]);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 136316162;
      uint64_t v11 = "-[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]_block_invoke_2";
      __int16 v12 = 2048;
      int v13 = v7;
      __int16 v14 = 2114;
      __int16 v15 = v7;
      __int16 v16 = 2114;
      __int16 v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Video session has been successfull registered. {renderer_ptr=%p} {renderer=%{public}@} {clientName=%{public} @} {session=%{public}@}",  (uint8_t *)&v10,  0x34u);
    }
  }
}

void sub_10000F51C(id a1, TVAirPlayAPRKManager *a2, TVAirPlaySessionManager *a3)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAirPlaySessionManager APRKVideoSessionSession](a3, "APRKVideoSessionSession"));
  if (v5)
  {
    id v6 = sub_100004480();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[TVAirPlayAPRKManager _deregisterActiveVideoSessionIfRequired]_block_invoke";
      __int16 v10 = 2114;
      uint64_t v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Deregistering active video session: %{public}@",  (uint8_t *)&v8,  0x16u);
    }

    -[TVAirPlayAPRKManager _onMainQueue_deregisterSession:](v4, "_onMainQueue_deregisterSession:", v5);
  }
}

void sub_10000F77C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000F7A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = sub_100004480();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001C024(a1, (uint64_t)v3, v7);
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 136315650;
      uint64_t v11 = "-[TVAirPlayAPRKManager _onMainQueue_registerGlobalPinSession:clientName:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: PIN session has been successfull registered. {clientName=%{public}@} {session=%{public}@}",  (uint8_t *)&v10,  0x20u);
    }
  }
}

void sub_10000FB5C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000FB74( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_10000FD3C(uint64_t a1)
{
  return AirPlayReceiverXPCClient_PostEvent( [*(id *)(a1 + 32) cStringUsingEncoding:4], *(void *)(a1 + 40));
}

uint64_t sub_10000FF68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000105A4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t sub_100011470(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2);
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVAirPlayApplication);
  id v6 = NSStringFromClass(v5);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (objc_class *)objc_opt_class(&OBJC_CLASS___TVAirPlayAppDelegate);
  uint64_t v9 = NSStringFromClass(v8);
  int v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_1000119D4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 playbackActive])
  {
    id v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v3, "stringForKey:", @"persistentGroupUUID"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 APRKManager]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeRenderer]);
    id v7 = [v6 streamRendererMode];

    if (v4) {
      BOOL v8 = v7 == (id)2;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v26 = sub_100004020();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(AssertionID[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Ignoring DeviceWillSleepCallback while streaming audio in Odeon config",  (uint8_t *)AssertionID,  2u);
      }
    }

    else
    {
      v39 = v4;
      v40 = v3;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
      int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activeSessions]);

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      uint64_t v11 = v10;
      id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v46;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v46 != v14) {
              objc_enumerationMutation(v11);
            }
            __int16 v16 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
            if ([v16 conformsToProtocol:&OBJC_PROTOCOL___TVAirPlayLegacySession])
            {
              v51[0] = @"sessionID";
              id v17 = v16;
              __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v17 sessionID]));
              v51[1] = @"userExit";
              v52[0] = v18;
              v52[1] = &__kCFBooleanTrue;
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));

              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v17 delegate]);
              [v20 session:v17 didPerformEvent:@"stopAudio" withInfo:v19];
            }

            [v16 userStop];
          }

          id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v45,  v53,  16LL);
        }

        while (v13);
      }

      notify_post("com.apple.airplay.dacp.stop");
      v49[0] = @"AssertType";
      v49[1] = @"AssertLevel";
      v50[0] = @"PreventUserIdleSystemSleep";
      v50[1] = &off_100033408;
      v49[2] = @"AssertName";
      v50[2] = @"com.apple.tvairplay.airplay-prevent-playback";
      v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  3LL));
      AssertionID[0] = 0;
      IOReturn v22 = IOPMAssertionCreateWithProperties(v21, AssertionID);
      if (v22)
      {
        int v23 = v22;
        id v24 = sub_100004020();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10001C0F4(v23, v25);
        }

        id v3 = v40;
        id v4 = v39;
      }

      else
      {
        uint32_t v27 = notify_post("com.apple.airplay.playbackPrevent");
        id v28 = sub_100004020();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        v30 = v29;
        if (v27)
        {
          id v4 = v39;
          id v3 = v40;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10001C0C4(v30, v31, v32, v33, v34, v35, v36, v37);
          }
        }

        else
        {
          id v4 = v39;
          id v3 = v40;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Unset airplay-prevent-playback assertion.",  buf,  2u);
          }

          dispatch_time_t v38 = dispatch_time(0LL, 15000000000LL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100012DCC;
          block[3] = &unk_100030FA8;
          IOPMAssertionID v42 = AssertionID[0];
          dispatch_after(v38, &_dispatch_main_q, block);
        }
      }
    }
  }
}

void sub_100012348( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100012360(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100012370(uint64_t a1)
{
}

void sub_100012378(uint64_t a1, void *a2)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      if (v6 == (id)++v8)
      {
        id v6 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        id v5 = v3;
        goto LABEL_13;
      }
    }

    id v5 = v3;
    if ([v9 routeDeviceType] != (id)3) {
      goto LABEL_13;
    }
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 routeIdentifier]);

    if (v5)
    {
      [*(id *)(a1 + 32) setPreviousAudioRouteUID:v5];
      int v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultRoute]);
      [v10 selectRoute:v11 withPassword:0];

      goto LABEL_13;
    }
  }

  else
  {
LABEL_13:
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0LL;
}

void sub_1000125F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100012608(uint64_t a1, void *a2)
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeIdentifier", (void)v15));
      unsigned int v10 = [v9 isEqual:*(void *)(a1 + 32)];

      if (v10) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) previousAudioRouteUID]);
    LODWORD(v11) = [v11 isEqual:v12];

    if ((_DWORD)v11)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) selectRoute:v8 withPassword:0];
      goto LABEL_12;
    }
  }

  else
  {
LABEL_12:

    [*(id *)(a1 + 40) setPreviousAudioRouteUID:0];
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
  __int128 v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0LL;
}

uint64_t sub_100012DCC(uint64_t a1)
{
  id v2 = sub_100004020();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Set airplay-prevent-playback assertion.",  v14,  2u);
  }

  if (notify_post("com.apple.airplay.playbackAllow"))
  {
    id v4 = sub_100004020();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001C194(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  uint64_t result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result) {
    return IOPMAssertionRelease(result);
  }
  return result;
}

void sub_100012E78( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100013664(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100013674(uint64_t a1)
{
}

void sub_10001367C(void *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlSessionWithID:0]);

  if (v3)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    id v17 = 0LL;
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 getProperty:v4 qualifier:v5 error:&v17]);
    id v7 = v17;
    uint64_t v8 = *(void *)(a1[7] + 8LL);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;

    id v10 = sub_100004090();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = a1[4];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Could not get property: %{public}@ error: %{public}@",  buf,  0x16u);
      }

      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v7 code];
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10001C1C4((uint64_t)(a1 + 7), v12);
      }
    }
  }

  else
  {
    id v14 = sub_100004090();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No active session, could not get property: %{public}@",  buf,  0xCu);
    }

    *(_DWORD *)(*(void *)(a1[6] + 8LL) + 24LL) = -6718;
  }
}

void sub_100013A00(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 urlSessionWithID:0]);

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v15 = 0LL;
    unsigned __int8 v7 = [v3 setProperty:v4 qualifier:v5 value:v6 error:&v15];
    id v8 = v15;
    if ((v7 & 1) == 0)
    {
      id v9 = sub_100004090();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v11;
        __int16 v18 = 2114;
        id v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Could not set property: %{public}@ error: %{public}@",  buf,  0x16u);
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v8 code];
    }
  }

  else
  {
    id v12 = sub_100004090();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No active session, could not set property: %{public}@",  buf,  0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = -6718;
  }
}

void sub_100013DC8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"showPIN"] & 1) != 0
    || [*(id *)(a1 + 32) isEqualToString:@"incompatibleSender"])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 infoSessionWithID:0]);

    if (v3) {
      [v3 stopWithOptions:*(void *)(a1 + 40) error:0];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v41 = @"TVAirPlayInfoSessionCommand";
    uint64_t v42 = v4;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    id v6 = [v5 mutableCopy];

    if (*(void *)(a1 + 40)) {
      objc_msgSend(v6, "addEntriesFromDictionary:");
    }
    unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___TVAirPlayInfoSession);
    -[TVAirPlayInfoSession setDelegate:](v7, "setDelegate:", *(void *)(a1 + 48));
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000141D4;
    v35[3] = &unk_100031020;
    __int128 v31 = *(_OWORD *)(a1 + 56);
    id v8 = (id)v31;
    __int128 v36 = v31;
    -[TVAirPlayInfoSession startWithOptions:completion:](v7, "startWithOptions:completion:", v6, v35);

LABEL_8:
    goto LABEL_9;
  }

  if ([*(id *)(a1 + 32) isEqualToString:@"hidePIN"])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v9 infoSessionWithID:0]);

    if (v6)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v34 = 0LL;
      [v6 stopWithOptions:v10 error:&v34];
      id v11 = v34;
      id v3 = v11;
      if (v11) {
        LODWORD(v11) = [v11 code];
      }
    }

    else
    {
      id v3 = 0LL;
      LODWORD(v11) = 0;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = (_DWORD)v11;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"sessionID"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v12 urlSessionWithID:v3]);

    if (v6)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v16 = *(void **)(v15 + 40);
      id v32 = 0LL;
      id obj = v16;
      unsigned __int8 v17 = [v6 performAction:v13 withOptions:v14 outInfo:&obj error:&v32];
      objc_storeStrong((id *)(v15 + 40), obj);
      unsigned __int8 v7 = (TVAirPlayInfoSession *)v32;
      if ((v17 & 1) == 0)
      {
        id v18 = sub_100004090();
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v20;
          __int16 v39 = 2114;
          v40 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Could not perform action: %{public}@ error: %{public}@",  buf,  0x16u);
        }

        uint64_t v21 = objc_claimAutoreleasedReturnValue(+[TVAirPlayUtilities errorToDictionary:](&OBJC_CLASS___TVAirPlayUtilities, "errorToDictionary:", v7));
        uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8LL);
        int v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = -[TVAirPlayInfoSession code]( v7,  "code");
      }

      goto LABEL_8;
    }

    id v24 = sub_100004090();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No active session, could handleAction: %{public}@",  buf,  0xCu);
    }

    uint32_t v27 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6718LL,  0LL);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[TVAirPlayUtilities errorToDictionary:](&OBJC_CLASS___TVAirPlayUtilities, "errorToDictionary:", v27));
    uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8LL);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = -6718;
  }

LABEL_9:
}

void sub_1000141D4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    unsigned int v4 = [a3 code];
  }
  else {
    unsigned int v4 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100014478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1000144A8(uint64_t a1)
{
  id v2 = (void *)objc_opt_class(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v12 = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _allowInterruption:&v12];
  objc_storeStrong((id *)(v3 + 40), v12);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v4;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    id v5 = sub_100004090();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Interruption not allowed", buf, 2u);
    }
  }

  else
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___TVAirPlayPresentationSession);
    -[os_log_s setDelegate:](v6, "setDelegate:", *(void *)(a1 + 32));
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000145E4;
    v8[3] = &unk_100031070;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    -[os_log_s startWithOptions:completion:](v6, "startWithOptions:completion:", v7, v8);
  }
}

void sub_1000145E4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if (v7)
  {
    id v8 = sub_100004090();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to start with err: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVAirPlayUtilities errorToDictionary:](&OBJC_CLASS___TVAirPlayUtilities, "errorToDictionary:", v7));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 code];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001485C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"sessionID"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 presentationSessionWithID:v3]);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v15 = 0LL;
    unsigned __int8 v6 = [v4 stopWithOptions:v5 error:&v15];
    id v7 = v15;
    if ((v6 & 1) == 0)
    {
      id v8 = sub_100004090();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to stop with err: %{public}@",  buf,  0xCu);
      }

      if (v7) {
        unsigned int v10 = [v7 code];
      }
      else {
        unsigned int v10 = -6700;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
    }
  }

  else
  {
    id v11 = sub_100004090();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No active session for %{public}@", buf, 0xCu);
    }

    id v7 = 0LL;
  }
}

void sub_100014AE0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 presentationSessionWithID:0]);

  id v9 = 0LL;
  unsigned __int8 v4 = [v3 performAction:off_10003F258 withOptions:0 outInfo:0 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = sub_100004090();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to show progress with err: %{public}@",  buf,  0xCu);
    }

    if (v5) {
      unsigned int v8 = [v5 code];
    }
    else {
      unsigned int v8 = -6700;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
  }
}

void sub_100014CE4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 presentationSessionWithID:0]);

  id v9 = 0LL;
  unsigned __int8 v4 = [v3 performAction:off_10003F260 withOptions:0 outInfo:0 error:&v9];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    id v6 = sub_100004090();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to hide progress with err: %{public}@",  buf,  0xCu);
    }

    if (v5) {
      unsigned int v8 = [v5 code];
    }
    else {
      unsigned int v8 = -6700;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
  }
}

void sub_100014FF8(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___TVAirPlayStreamingAudioSession);
  -[TVAirPlayStreamingAudioSession setDelegate:](v2, "setDelegate:", *(void *)(a1 + 32));
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000150A0;
  v4[3] = &unk_100031070;
  __int128 v6 = *(_OWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  -[TVAirPlayStreamingAudioSession startWithOptions:completion:](v2, "startWithOptions:completion:", v3, v4);
}

void sub_1000150A0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if (v7)
  {
    id v8 = sub_100004090();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to start with err: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVAirPlayUtilities errorToDictionary:](&OBJC_CLASS___TVAirPlayUtilities, "errorToDictionary:", v7));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 code];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100015318(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"sessionID"]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 streamingSessionWithID:v3]);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v15 = 0LL;
    unsigned __int8 v6 = [v4 stopWithOptions:v5 error:&v15];
    id v7 = v15;
    if ((v6 & 1) == 0)
    {
      id v8 = sub_100004090();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to stop with err: %{public}@",  buf,  0xCu);
      }

      if (v7) {
        unsigned int v10 = [v7 code];
      }
      else {
        unsigned int v10 = -6700;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
    }
  }

  else
  {
    id v11 = sub_100004090();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No active session for %{public}@", buf, 0xCu);
    }

    id v7 = 0LL;
  }
}

void sub_10001558C(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 streamingSessionWithID:0]);

  v15[0] = kMRMediaRemoteNowPlayingInfoDuration;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
  v16[0] = v4;
  v15[1] = kMRMediaRemoteNowPlayingInfoElapsedTime;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  v16[1] = v5;
  v15[2] = kMRMediaRemoteNowPlayingInfoTimestamp;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v16[2] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL));

  id v12 = 0LL;
  LOBYTE(v5) = [v3 setProperty:off_10003F1E8 qualifier:0 value:v7 error:&v12];
  id v8 = v12;
  if ((v5 & 1) == 0)
  {
    id v9 = sub_100004090();
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failed to set progress with err: %{public}@",  buf,  0xCu);
    }

    if (v8) {
      unsigned int v11 = [v8 code];
    }
    else {
      unsigned int v11 = -6700;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v11;
  }
}

void sub_100015954(uint64_t a1)
{
  id v2 = (void *)objc_opt_class(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v18 = *(id *)(v3 + 40);
  unsigned int v4 = [v2 _allowInterruption:&v18];
  objc_storeStrong((id *)(v3 + 40), v18);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v4;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    id v6 = *(id *)(a1 + 40);
    id v7 = objc_alloc_init(&OBJC_CLASS___TVAirPlayURLSession);
    -[TVAirPlayURLSession setDelegate:](v7, "setDelegate:", *(void *)(a1 + 32));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sharedAudioSessionID"]);

    id v9 = *(void **)(a1 + 32);
    if (v8)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"sharedAudioSessionID"]);
      [v9 setAudioSessionID:v10];
    }

    else
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) audioSessionID]);

      if (!v11)
      {
LABEL_9:
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100015B58;
        v14[3] = &unk_100031070;
        int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
        id v15 = *(id *)(a1 + 48);
        -[TVAirPlayURLSession startWithOptions:completion:](v7, "startWithOptions:completion:", v6, v14);

        goto LABEL_10;
      }

      id v10 = [v6 mutableCopy];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) audioSessionID]);
      [v10 setObject:v12 forKeyedSubscript:@"sharedAudioSessionID"];

      id v13 = [v10 copy];
      id v6 = v13;
    }

    goto LABEL_9;
  }

  id v5 = sub_100004090();
  id v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Interruption not allowed", buf, 2u);
  }

void sub_100015B58(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if (v7)
  {
    id v8 = sub_100004090();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to start with err: %{public}@",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TVAirPlayUtilities errorToDictionary:](&OBJC_CLASS___TVAirPlayUtilities, "errorToDictionary:", v7));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 code];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100015DD0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVAirPlaySessionManager sharedInstance](&OBJC_CLASS___TVAirPlaySessionManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"sessionID"]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 urlSessionWithID:v3]);

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v15 = 0LL;
    unsigned __int8 v6 = [v4 stopWithOptions:v5 error:&v15];
    id v7 = v15;
    if ((v6 & 1) == 0)
    {
      id v8 = sub_100004090();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to stop with err: %{public}@",  buf,  0xCu);
      }

      if (v7) {
        unsigned int v10 = [v7 code];
      }
      else {
        unsigned int v10 = -6700;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
    }
  }

  else
  {
    id v11 = sub_100004090();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No active session for %{public}@", buf, 0xCu);
    }

    id v7 = 0LL;
  }
}

void sub_100016600( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100017148( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_100017174(id *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100017274;
  v12[3] = &unk_100031170;
  objc_copyWeak(&v16, a1 + 5);
  objc_copyWeak(&v17, a1 + 6);
  id v9 = a1[4];
  char v18 = a4;
  id v13 = v9;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(&_dispatch_main_q, v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
}

void sub_100017274(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([WeakRetained posterImageProxy]);
    id v5 = objc_loadWeakRetained((id *)(a1 + 64));

    if (v4 == v5) {
      [v3 setPosterImageProxy:0];
    }
    unsigned __int8 v6 = *(void **)(a1 + 32);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 avPlayerViewController]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 player]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentItem]);
    LOBYTE(v6) = [v6 isEqual:v9];

    if ((v6 & 1) == 0)
    {
      id v18 = sub_100004250();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Player item changed while downloading poster image",  buf,  2u);
      }

      goto LABEL_15;
    }

    if (*(_BYTE *)(a1 + 72))
    {
      if (*(void *)(a1 + 40))
      {
        id v10 = sub_100004250();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v22 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Downloaded poster for current player item",  v22,  2u);
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) externalMetadata]);
        id v13 = (os_log_s *)[v12 mutableCopy];

        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMetadataItem metadataItem](&OBJC_CLASS___AVMutableMetadataItem, "metadataItem"));
        [v14 setIdentifier:AVMetadataCommonIdentifierArtwork];
        [v14 setDataType:kCMMetadataBaseDataType_PNG];
        [v14 setExtendedLanguageTag:@"und"];
        id v15 = (UIImage *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) uiImage]);
        id v16 = UIImagePNGRepresentation(v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        [v14 setValue:v17];

        -[os_log_s addObject:](v13, "addObject:", v14);
        [*(id *)(a1 + 32) setExternalMetadata:v13];

LABEL_15:
        goto LABEL_16;
      }

      uint64_t v20 = *(void *)(a1 + 48);
      id v19 = (uint64_t *)(a1 + 48);
      if (v20)
      {
        id v21 = sub_100004250();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10001C388(v19, v13);
        }
        goto LABEL_15;
      }
    }
  }

BOOL sub_100017A3C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 avRequestID]);
  id v9 = sub_100004100();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
      int v15 = 138543362;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AirPlay handle ResourceLoadingRequest %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    [v7 mediaItem:v6 didRequestResource:v5];
  }

  else
  {
    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "### AirPlay failed URL request ID missing from %{public}@",  (uint8_t *)&v15,  0xCu);
    }
  }

  return v8 != 0LL;
}

void sub_1000186D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_100018700(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100018710(uint64_t a1)
{
}

void sub_100018718(uint64_t a1)
{
  v5[0] = @"allowP2P";
  v6[0] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[1] = @"appID";
  v6[1] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[2] = @"assetID";
  v6[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[3] = @"buyParams";
  v6[3] = objc_opt_class(&OBJC_CLASS___NSString);
  void v5[4] = @"cookies";
  v6[4] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[5] = @"Content-Location";
  v6[5] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[6] = @"HLS-Content-Location";
  v6[6] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[7] = @"dsid";
  v6[7] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[8] = @"errorInfo";
  v6[8] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[9] = @"host";
  v6[9] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[10] = @"itemID";
  v6[10] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[11] = @"itemType";
  v6[11] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[12] = @"mediaKindOverride";
  v6[12] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[13] = @"outOfBandAlternateTracks";
  v6[13] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[14] = @"path";
  v6[14] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[15] = @"playbackRestrictions";
  v6[15] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[16] = @"purchaseBundle";
  uint8_t v6[16] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[17] = @"purchasedMediaKind";
  v6[17] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[18] = @"remoteContext";
  v6[18] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[19] = @"Start-Position";
  v6[19] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[20] = @"Start-Date";
  v6[20] = objc_opt_class(&OBJC_CLASS___NSDate);
  v5[21] = @"Start-Estimated-Date";
  v6[21] = objc_opt_class(&OBJC_CLASS___NSDate);
  v5[22] = @"streamerGUID";
  v6[22] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[23] = @"rate";
  v6[23] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[24] = @"tlsPSKClientIdentity";
  v6[24] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[25] = @"tlsPSKEnabled";
  v6[25] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[26] = @"tlsPSK";
  v6[26] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[27] = @"X-Transmit-Date";
  v6[27] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[28] = @"value";
  v6[28] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[29] = @"url";
  v6[29] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[30] = @"userAgent";
  v6[30] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[31] = @"uuid";
  v6[31] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[32] = @"videoCacheClear";
  v6[32] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[33] = @"audioOnly";
  v6[33] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[34] = @"actionAtItemEnd";
  v6[34] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[35] = @"date";
  v6[35] = objc_opt_class(&OBJC_CLASS___NSDate);
  v5[36] = @"forwardEndTime";
  v6[36] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[37] = @"reverseEndTime";
  v6[37] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[38] = @"enableTrack";
  v6[38] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[39] = @"metaData";
  v6[39] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[40] = @"muted";
  v6[40] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[41] = @"timedMetadataArray";
  v6[41] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[42] = @"playbackAccessLog";
  v6[42] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[43] = @"playbackErrorLog";
  v6[43] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[44] = @"item";
  v6[44] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[45] = @"selectedMediaArray";
  v6[45] = objc_opt_class(&OBJC_CLASS___NSArray);
  v5[46] = @"serverInfo";
  v6[46] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v5[47] = @"streamType";
  v6[47] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[48] = @"volume";
  v6[48] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[49] = @"isInterestedInDateRange";
  v6[49] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[50] = @"fpSessionID";
  v6[50] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v5[51] = @"mz_at";
  v6[51] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[52] = @"PD-Info";
  v6[52] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[53] = @"PIC-Request";
  v6[53] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[54] = @"PIC-Data";
  v6[54] = objc_opt_class(&OBJC_CLASS___NSData);
  v5[55] = @"Player-GUID";
  v6[55] = objc_opt_class(&OBJC_CLASS___NSString);
  v5[56] = @"Play-Info";
  v6[56] = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  57LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100018D1C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v8 = a3;
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v10];
  if (v9 && (objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

LABEL_13:
    }

    id v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  }

  while (v8);
LABEL_30:
  uint64_t v3 = v33;
LABEL_31:

  id v19 = [v5 copy];
LABEL_32:

  return v19;
}

void sub_100019698( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_1000196B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _stateDump]);

  return v2;
}

id sub_1000199C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) userStop];
}

id sub_100019BF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) userStop];
}

void sub_100019F9C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100004250();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10001C400((uint64_t)v2, v4);
  }
}

id sub_10001A288(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 mediaViewControllerDidDismiss:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) setDelegate:0];
}

void sub_10001A784(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:1.0];
}

id sub_10001A7B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsFocusUpdate];
}

void sub_10001A7C0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

id sub_10001A7F4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  return [*(id *)(a1 + 40) setNeedsFocusUpdate];
}

LABEL_19:
  if (!dialogViewController) {
    goto LABEL_20;
  }
LABEL_15:
  if (!pinViewController) {
    goto LABEL_21;
  }
  return v13;
}

void sub_10001B808(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimeoutTimer];
}

uint64_t sub_10001B9D4()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC9TVAirPlayP33_D80657C3D1899118326532EE605FB87019ResourceBundleClass);
}

void sub_10001BA04(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Play queue empty timeout, stopping playback",  v1,  2u);
}

void sub_10001BA44(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Setting authorization info %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10001BAB8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Complete presentation for media view controller with result (error: %{public}@)",  (uint8_t *)&v2,  0xCu);
}

void sub_10001BB2C(int a1, os_log_s *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[TVAirPlayAPRKManager startReceiverServer]";
  __int16 v4 = 1024;
  int v5 = a1;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to start receiver server. {OSStatus=%d, OSStatus_fmt=%{darwin.errno}d}",  (uint8_t *)&v2,  0x18u);
  sub_10000FB6C();
}

void sub_10001BBB8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BC28( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BC98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BD08(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = 136315650;
  __int16 v6 = "-[TVAirPlayAPRKManager shouldShowGlobalPasscodeWithString:withClientName:]";
  __int16 v7 = 2048;
  id v8 = [a1 length];
  __int16 v9 = 1024;
  BOOL v10 = a2 == 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: passcodeString is empty or clientName is nil. Bailing. {passcodeLength=%lu, clientNameIsNil=%{BOOL}d}",  (uint8_t *)&v5,  0x1Cu);
}

void sub_10001BDBC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  int v5 = "-[TVAirPlayAPRKManager shouldShowGlobalPasscodeWithString:withClientName:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: A PIN session is already active. Will deregister current PIN session. {clientName=%{public}@} (session=%{public}@}",  (uint8_t *)&v4,  0x20u);
}

void sub_10001BE54( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BEC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001BF34(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  __int16 v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managedClientName]);
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = 136316418;
  BOOL v10 = "-[TVAirPlayAPRKManager _registerActiveVideoSessionIfRequiredForRenderer:]_block_invoke";
  __int16 v11 = 2048;
  id v12 = v6;
  __int16 v13 = 2114;
  id v14 = v6;
  __int16 v15 = 2114;
  id v16 = v7;
  __int16 v17 = 2114;
  uint64_t v18 = a2;
  __int16 v19 = 2114;
  uint64_t v20 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s: Failed to register session. {renderer_ptr=%p} {renderer=%{public}@} {clientName=%{public}@} {error=%{public}@} { session=%{public}@}",  (uint8_t *)&v9,  0x3Eu);
}

void sub_10001C024(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 136315906;
  __int16 v6 = "-[TVAirPlayAPRKManager _onMainQueue_registerGlobalPinSession:clientName:]_block_invoke";
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  uint64_t v12 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to register PIN session. {clientName=%{public}@} {error=%{public}@} {session=%{public}@}",  (uint8_t *)&v5,  0x2Au);
}

void sub_10001C0C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C0F4(int a1, os_log_s *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create airplay-prevent-playback assertion: %{public}x",  (uint8_t *)v2,  8u);
  sub_100012E88();
}

void sub_10001C164( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C194( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C1C4(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities dataAbbreviatedDescription:]( &OBJC_CLASS___TVAirPlayUtilities,  "dataAbbreviatedDescription:",  *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL)));
  int v4 = 138543362;
  int v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "airplayUIGetProperty: output %{public}@",  (uint8_t *)&v4,  0xCu);
}

void sub_10001C270(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 managedClientName]);
  sub_1000165E0();
  sub_100016600( (void *)&_mh_execute_header,  v2,  v3,  "%s: Stream renderer in mirroring mode returned a nil mirroring layer. {clientName=%{public}@, streamRenderer=%p}",  v4,  v5,  v6,  v7,  2u);

  sub_100016614();
}

void sub_10001C2FC(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 managedClientName]);
  sub_1000165E0();
  sub_100016600( (void *)&_mh_execute_header,  v2,  v3,  "%s: Stream renderer in V2 video playback mode returned a nil queue player. {clientName=%{public}@, streamRenderer=%p}",  v4,  v5,  v6,  v7,  2u);

  sub_100016614();
}

void sub_10001C388(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to load poster image with error: %@",  (uint8_t *)&v3,  0xCu);
}

void sub_10001C400(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to request scene destruction: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_removePendingExpiredSessionReports_withAppIdentifier_storageDirectoryAtURL_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePendingExpiredSessionReports:withAppIdentifier:storageDirectoryAtURL:");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}