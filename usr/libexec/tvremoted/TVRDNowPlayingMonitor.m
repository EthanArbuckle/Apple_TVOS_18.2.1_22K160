@interface TVRDNowPlayingMonitor
@end

@implementation TVRDNowPlayingMonitor

id __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginLoadingUpdates];
}

void __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _invokeUpdateHandlerWithNowPlayingInfo:v3];
}

void __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_3(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_4;
  block[3] = &unk_100020BF0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void __52__TVRDNowPlayingMonitor_tvOS_initWithUpdateHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained state]);
    if ([v3 isPlaying])
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
      unsigned __int8 v5 = [v4 hasEffectiveCanonicalID];

      if ((v5 & 1) == 0)
      {
        id v6 = _TVRDNPLog();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
          v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
          int v14 = 138412290;
          v15 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "WLKDidReportPlaybackDistributedNotification fired: requesting canonicalID for %@",  (uint8_t *)&v14,  0xCu);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v2 state]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        [v10 requestCanonicalIDForIdentifier:v12 shouldExpectPlaybackSummaries:1];

LABEL_10:
        goto LABEL_11;
      }
    }

    else
    {
    }

    id v13 = _TVRDNPLog();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_INFO,  "WLKDidReportPlaybackDistributedNotification fired: we already have an effective canonicalID so doing nothing",  (uint8_t *)&v14,  2u);
    }

    goto LABEL_10;
  }

void __50__TVRDNowPlayingMonitor_tvOS_updateTimedMetadata___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  [v2 updateTimedMetadata:*(void *)(a1 + 40)];
}

void __57__TVRDNowPlayingMonitor_tvOS_controller_didLoadResponse___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  [v2 updateContentItem:*(void *)(a1 + 40)];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentLanguageOptions]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) availableLanguageOptions]);
  [v5 updateCaptionOptionsWithCurrentLanguageOptions:v3 availableLanguageGroups:v4];
}

void __70__TVRDNowPlayingMonitor_tvOS_controller_playbackRateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2));
  [v4 updatePlaybackRate:v3];
}

void __61__TVRDNowPlayingMonitor_tvOS_controller_playerPathDidChange___block_invoke(uint64_t a1)
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 playerIdentifier]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) player]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  id v6 = _TVRDNPLog();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    v12 = v3;
    __int16 v13 = 2114;
    int v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "controllerPlayerPathChanged: %{public}@ ->  %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  [v8 updatePlayerIdentifier:v5];

  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
    [v9 updatePlaybackRate:&off_100021790];

    v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
    [v10 updatePlaybackState:3];
  }
}

void __59__TVRDNowPlayingMonitor_tvOS_controller_didUpdateResponse___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    double v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) state]);
    [v2 updateContentItem:*(void *)(a1 + 32)];
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) state]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentLanguageOptions]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) availableLanguageOptions]);
  [v5 updateCaptionOptionsWithCurrentLanguageOptions:v3 availableLanguageGroups:v4];
}

void __71__TVRDNowPlayingMonitor_tvOS_controller_playbackStateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) state]);
  [v2 updatePlaybackStateWithPreviousMRPlaybackState:*(unsigned int *)(a1 + 40) to:*(unsigned int *)(a1 + 44)];
}

void __85__TVRDNowPlayingMonitor_tvOS_controller_contentItemsDidUpdateWithContentItemChanges___block_invoke( uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) availableLanguageOptions]);
  if (v4)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) state]);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentLanguageOptions]);
    [v2 updateCaptionOptionsWithCurrentLanguageOptions:v3 availableLanguageGroups:v4];
  }
}

@end