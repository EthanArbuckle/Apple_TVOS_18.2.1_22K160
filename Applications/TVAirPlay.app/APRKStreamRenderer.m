@interface APRKStreamRenderer
- (BOOL)tvap_requiresVideoSession;
- (BOOL)tvap_shouldTriggerUserActivity;
- (id)tvap_videoSessionView;
- (id)tvap_videoSessionViewController;
@end

@implementation APRKStreamRenderer

- (BOOL)tvap_shouldTriggerUserActivity
{
  return -[APRKStreamRenderer streamRendererMode](self, "streamRendererMode") == (id)1;
}

- (BOOL)tvap_requiresVideoSession
{
  id v3 = -[APRKStreamRenderer streamRendererMode](self, "streamRendererMode");
  if (v3 != (id)4) {
    return v3 == (id)1;
  }
  if (-[APRKStreamRenderer currentVideoPlaybackVersion](self, "currentVideoPlaybackVersion") == (id)2)
  {
    int IntWithDefault = APSSettingsGetIntWithDefault(@"translateV1ToV2", 0LL);
    id v6 = sub_100004330();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = @"true";
      if (!IntWithDefault) {
        v8 = @"false";
      }
      int v11 = 134218242;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%p] Current playback version is V2, using APRK player (v1v2TranslationLayer = %@)",  (uint8_t *)&v11,  0x16u);
    }

    return 1;
  }

  else
  {
    id v9 = sub_100004330();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%p] Current playback version is V1, using TVAirPlay player",  (uint8_t *)&v11,  0xCu);
    }

    return 0;
  }

- (id)tvap_videoSessionView
{
  if (-[APRKStreamRenderer streamRendererMode](self, "streamRendererMode") == (id)1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APRKStreamRenderer mirroringLayer](self, "mirroringLayer"));
    if (v3)
    {
      v4 = objc_alloc(&OBJC_CLASS___TVAirPlayAPRKMirroringView);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APRKStreamRenderer HUDLayer](self, "HUDLayer"));
      id v6 = -[TVAirPlayAPRKMirroringView initWithMirroringLayer:HUDLayer:]( v4,  "initWithMirroringLayer:HUDLayer:",  v3,  v5);
    }

    else
    {
      id v7 = sub_100004330();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10001C270(self);
      }

      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)tvap_videoSessionViewController
{
  if (-[APRKStreamRenderer streamRendererMode](self, "streamRendererMode") == (id)4)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APRKStreamRenderer player](self, "player"));
    if (v3)
    {
      v4 = objc_alloc_init(&OBJC_CLASS___AVPlayerViewController);
      -[AVPlayerViewController setPlayer:](v4, "setPlayer:", v3);
    }

    else
    {
      id v5 = sub_100004330();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001C2FC(self);
      }

      v4 = 0LL;
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

  ;
}

@end