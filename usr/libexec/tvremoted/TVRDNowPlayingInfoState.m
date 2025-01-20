@interface TVRDNowPlayingInfoState
@end

@implementation TVRDNowPlayingInfoState

BOOL __60___TVRDNowPlayingInfoState__currentLegibleTrackFromOptions___block_invoke(id a1, MRLanguageOption *a2)
{
  v2 = a2;
  if (-[MRLanguageOption type](v2, "type") == 1
    && (-[MRLanguageOption isAutomaticLanguageOptionWithType:]( v2,  "isAutomaticLanguageOptionWithType:",  1LL) & 1) == 0)
  {
    unsigned int v3 = !-[MRLanguageOption containsOnlyForcedSubtitles](v2, "containsOnlyForcedSubtitles");
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

uint64_t __94___TVRDNowPlayingInfoState__preferredLegibleTrackFromGroups_containsOnlyForcedCharacteristic___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  BOOL v4 = *(_BYTE *)(a1 + 40) == 0;
  unsigned int v5 = [v3 containsOnlyForcedSubtitles] ^ v4;
  if (*(_BYTE *)(a1 + 41)) {
    unsigned int v6 = [v3 isAuxiliaryContent] ^ 1;
  }
  else {
    unsigned int v6 = 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 languageTag]);
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void __67___TVRDNowPlayingInfoState__invokeUpdateHandlerWithNowPlayingInfo___block_invoke(uint64_t a1)
{
  id v2 = _TVRDNPLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Invoking NowPlayingUpdateHandler for %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  unsigned int v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateHandler]);
  v5[2](v5, *(void *)(a1 + 32));
}

void __45___TVRDNowPlayingInfoState__requestImageData__block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a2 imageData]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateImageData:v4 isPlaceholder:0];
}

void __90___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier_shouldExpectPlaybackSummaries___block_invoke( uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) canonicalID]);
  id v3 = [v2 length];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) canonicalID]);
  unsigned int v5 = [v4 isEqualToString:TVRCUnknownCanonicalIDValue];

  int v6 = *(void **)(a1 + 40);
  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  if (objc_msgSend(v6, "isEqualToString:"))
  {
    if (v3) {
      int v7 = v5;
    }
    else {
      int v7 = 1;
    }

    if (v7 == 1)
    {
      id v8 = _TVRDNPLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for canonicalID to arrive for %{public}@ ... requesting now with the expectation we will get the Unknown sentinel",  buf,  0xCu);
      }

      [*(id *)(a1 + 32) requestCanonicalIDForIdentifier:*(void *)(a1 + 40)];
    }
  }

  else
  {
  }

void __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
          id v12 = [v11 playbackState];

          if (v12 == (id)1)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v10 canonicalID]);
            v14 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleID]);

            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke_2;
            v21[3] = &unk_100020D48;
            v21[4] = WeakRetained;
            id v22 = v13;
            id v23 = v15;
            id v16 = v15;
            id v17 = v13;
            dispatch_async(&_dispatch_main_q, v21);

            goto LABEL_12;
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke_3;
    block[3] = &unk_100020C40;
    id v19 = *(id *)(a1 + 32);
    id v20 = WeakRetained;
    dispatch_async(&_dispatch_main_q, block);
    unsigned int v5 = v19;
LABEL_12:
  }
}

id __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCanonicalIdentifier:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48)];
}

id __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke_3(uint64_t a1)
{
  id v2 = _TVRDNPLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "No canonical ID found and expecting playback summary - using sentinel unknown value for %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(a1 + 40) updateCanonicalIdentifier:TVRCUnknownCanonicalIDValue bundleID:0];
}

void __38___TVRDNowPlayingInfoState_connection__block_invoke(id a1)
{
  id v1 = _TVRDXPCLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38___TVRDNowPlayingInfoState_connection__block_invoke_cold_1(v2);
  }
}

void __38___TVRDNowPlayingInfoState_connection__block_invoke_159(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __33___TVRDNowPlayingInfoState_proxy__block_invoke(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = _TVRDXPCLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __33___TVRDNowPlayingInfoState_proxy__block_invoke_cold_1((uint64_t)v2, v4);
  }
}

void __38___TVRDNowPlayingInfoState_connection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "WLK XPC connection encountered an interruption.",  v1,  2u);
}

void __33___TVRDNowPlayingInfoState_proxy__block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Proxy creation error (WLKConnectionServerProtocol): %{public}@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

@end