@interface WiFiAvailabilityEngine
- (NSSet)availableNetworks;
- (NSSet)providers;
- (NSSet)sources;
- (OS_dispatch_queue)queue;
- (WiFiAvailabilityEngine)initWithProviders:(id)a3 sources:(id)a4;
- (WiFiLexicon)wifiLexicon;
- (WiFiLocationProvider)locationProvider;
- (WiFiScanProvider)scanProvider;
- (double)availabilityMatchMaximumAge;
- (id)_createAvailabilityMatchForCandidate:(id)a3 scannedNetwork:(id)a4;
- (id)_findExistingAvailabilityMatchForScannedNetwork:(id)a3;
- (id)_findRelevantNetworkMatchForScannedNetwork:(id)a3;
- (id)availabilityChangedCallback;
- (id)findRecommendationForScannedNetwork:(id)a3;
- (id)findRecommendationsForScannedNetwork:(id)a3;
- (void)_findAvailabilityMatchesInSourcesForBSSIDS:(id)a3;
- (void)_handle3BarsRelevancyAdded:(id)a3 removed:(id)a4;
- (void)_handleCandidateMatches:(id)a3;
- (void)_handleScanResultCallback:(id)a3 error:(id)a4;
- (void)_handleWalletRelevancyAdded:(id)a3 removed:(id)a4;
- (void)_removeStaleMatches;
- (void)_setupProviderCallbacks:(id)a3;
- (void)_setupSourceCallbacks:(id)a3;
- (void)setAvailabilityChangedCallback:(id)a3;
- (void)setAvailabilityMatchMaximumAge:(double)a3;
- (void)setAvailableNetworks:(id)a3;
- (void)setLocationProvider:(id)a3;
- (void)setProviders:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScanProvider:(id)a3;
- (void)setSources:(id)a3;
- (void)setWifiLexicon:(id)a3;
@end

@implementation WiFiAvailabilityEngine

- (WiFiAvailabilityEngine)initWithProviders:(id)a3 sources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0LL;
  if (v6 && v7)
  {
    if ([v6 count]
      && [v8 count]
      && (v24.receiver = self,
          v24.super_class = (Class)&OBJC_CLASS___WiFiAvailabilityEngine,
          (self = -[WiFiAvailabilityEngine init](&v24, sel_init)) != 0LL))
    {
      v10 = (NSSet *)[v6 copy];
      providers = self->_providers;
      self->_providers = v10;

      v12 = (NSSet *)[v8 copy];
      sources = self->_sources;
      self->_sources = v12;

      [MEMORY[0x189604010] set];
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      availableNetworks = self->_availableNetworks;
      self->_availableNetworks = v14;

      dispatch_get_global_queue(0LL, 0LL);
      v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke;
      block[3] = &unk_18A16C770;
      v17 = self;
      v23 = v17;
      dispatch_async(v16, block);

      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.WiFiPolicy.availability-engine", v18);
      queue = v17->_queue;
      v17->_queue = (OS_dispatch_queue *)v19;

      v17->_availabilityMatchMaximumAge = 600.0;
      -[WiFiAvailabilityEngine _setupProviderCallbacks:](v17, "_setupProviderCallbacks:", self->_providers);
      -[WiFiAvailabilityEngine _setupSourceCallbacks:](v17, "_setupSourceCallbacks:", self->_sources);
      self = v17;

      v9 = self;
    }

    else
    {
      v9 = 0LL;
    }
  }

  return v9;
}

void __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___WiFiLexicon);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;
}

- (void)_setupProviderCallbacks:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_initWeak(&location, self);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WiFiAvailabilityEngine _setupProviderCallbacks:]";
          __int16 v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_187EBF000, v8, OS_LOG_TYPE_DEFAULT, "%s: provider %@", buf, 0x16u);
        }

        if ([v10 conformsToProtocol:&unk_18C72DD68])
        {
          id v11 = objc_storeWeak((id *)&self->_scanProvider, v10);
          v12[0] = MEMORY[0x1895F87A8];
          v12[1] = 3221225472LL;
          v12[2] = __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke;
          v12[3] = &unk_18A16CEF8;
          objc_copyWeak(&v13, &location);
          [v10 addScanResultsCallback:v12];

          objc_destroyWeak(&v13);
        }

        else if ([v10 conformsToProtocol:&unk_18C72DDC8])
        {
          objc_storeWeak((id *)&self->_locationProvider, v10);
        }
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }

    while (v6);
  }

  objc_destroyWeak(&location);
}

void __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleScanResultCallback:v6 error:v5];
}

- (void)_setupSourceCallbacks:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          *(_DWORD *)buf = 136315394;
          __int128 v15 = "-[WiFiAvailabilityEngine _setupSourceCallbacks:]";
          __int16 v16 = 2112;
          uint64_t v17 = v9;
          _os_log_impl(&dword_187EBF000, v7, OS_LOG_TYPE_DEFAULT, "%s: source %@", buf, 0x16u);
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v18 count:16];
    }

    while (v5);
  }
}

- (void)setAvailabilityMatchMaximumAge:(double)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  self->_double availabilityMatchMaximumAge = a3;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    double availabilityMatchMaximumAge = self->_availabilityMatchMaximumAge;
    int v5 = 136315394;
    uint64_t v6 = "-[WiFiAvailabilityEngine setAvailabilityMatchMaximumAge:]";
    __int16 v7 = 2048;
    double v8 = availabilityMatchMaximumAge;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: setting new max age %f",  (uint8_t *)&v5,  0x16u);
  }

- (void)_handleCandidateMatches:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  context = (void *)MEMORY[0x1895BA820]();
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy__10;
  v38 = __Block_byref_object_dispose__10;
  id v39 = 0LL;
  v28 = v4;
  [MEMORY[0x189603FE0] setWithSet:v4];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = (os_log_s *)MEMORY[0x1895F8DA0];
    v26 = "%s: no candidates";
    goto LABEL_16;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        __int128 v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v11 matchedAt];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 timeIntervalSinceDate:v12];
        double v14 = v13;
        -[WiFiAvailabilityEngine availabilityMatchMaximumAge](self, "availabilityMatchMaximumAge");
        BOOL v16 = v14 < v15;

        if (v16) {
          [v5 addObject:v11];
        }
      }

      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }

    while (v8);
  }

  uint64_t v17 = [v5 mutableCopy];
  v18 = (void *)v35[5];
  v35[5] = v17;

  uint64_t v19 = (void *)v35[5];
  v20 = -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  [v19 minusSet:v20];

  [MEMORY[0x189604010] setWithSet:v5];
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAvailabilityEngine setAvailableNetworks:](self, "setAvailableNetworks:", v21);
  v22 = -[WiFiAvailabilityEngine availabilityChangedCallback](self, "availabilityChangedCallback");
  BOOL v23 = v22 == 0LL;

  if (v23)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = (os_log_s *)MEMORY[0x1895F8DA0];
    v26 = "%s: no availability callback provided";
    goto LABEL_16;
  }

  if (![(id)v35[5] count])
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = (os_log_s *)MEMORY[0x1895F8DA0];
    v26 = "%s: no change to available networks";
LABEL_16:
    _os_log_impl(&dword_187EBF000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
    goto LABEL_17;
  }

  -[WiFiAvailabilityEngine queue](self, "queue");
  uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke;
  block[3] = &unk_18A16E2A0;
  void block[4] = self;
  block[5] = &v34;
  dispatch_async(v24, block);

LABEL_17:
  _Block_object_dispose(&v34, 8);

  objc_autoreleasePoolPop(context);
}

void __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke(uint64_t a1)
{
  v2 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;
}

- (void)_removeStaleMatches
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895BA820](self, a2);
  [MEMORY[0x189603FE0] set];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v11 matchedAt];
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 timeIntervalSinceDate:v12];
        double v14 = v13;
        -[WiFiAvailabilityEngine availabilityMatchMaximumAge](self, "availabilityMatchMaximumAge");
        double v16 = v15;

        if (v14 > v16)
        {
          [v3 addObject:v11];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[WiFiAvailabilityEngine _removeStaleMatches]";
            __int16 v26 = 2112;
            v27 = v11;
            _os_log_impl(&dword_187EBF000, v9, OS_LOG_TYPE_DEFAULT, "%s: expired match %@", buf, 0x16u);
          }
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v7);
  }

  if ([v3 count])
  {
    -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)[v17 mutableCopy];

    [v18 minusSet:v3];
    -[WiFiAvailabilityEngine setAvailableNetworks:](self, "setAvailableNetworks:", v18);
  }

  objc_autoreleasePoolPop(context);
}

- (void)_handleScanResultCallback:(id)a3 error:(id)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v26 = a4;
  [MEMORY[0x189603FE0] set];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  obuint64_t j = v6;
  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v31)
  {
    uint64_t v9 = *(void *)v37;
    v27 = v7;
    v28 = self;
    uint64_t v29 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v31; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        __int128 v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        __int128 v12 = (void *)MEMORY[0x1895BA820]();
        uint64_t v13 = [v11 SSID];
        if (v13)
        {
          double v14 = (void *)v13;
          [v11 SSID];
          double v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 length];

          if (v16)
          {
            -[WiFiAvailabilityEngine _findExistingAvailabilityMatchForScannedNetwork:]( self,  "_findExistingAvailabilityMatchForScannedNetwork:",  v11);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              [MEMORY[0x189603F50] date];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v17 setMatchedAt:v18];

              [v7 addObject:v17];
            }

            -[WiFiAvailabilityEngine _findRelevantNetworkMatchForScannedNetwork:]( self,  "_findRelevantNetworkMatchForScannedNetwork:",  v11);
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v42 = "-[WiFiAvailabilityEngine _handleScanResultCallback:error:]";
                __int16 v43 = 2112;
                v44 = v19;
                __int16 v45 = 2112;
                v46 = v11;
                _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: found relevant network match (%@) for scanned network %@",  buf,  0x20u);
              }

              uint64_t v20 = -[WiFiAvailabilityEngine _createAvailabilityMatchForCandidate:scannedNetwork:]( self,  "_createAvailabilityMatchForCandidate:scannedNetwork:",  v19,  v11);

              [v7 addObject:v20];
              uint64_t v17 = (void *)v20;
            }

            else if (v17)
            {
              [v7 addObject:v17];
            }

            else
            {
              [v11 BSSID];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17) {
                [v8 setObject:v11 forKey:v17];
              }
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v32 = 0u;
              __int128 v33 = 0u;
              [v11 essMembers];
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v33;
                do
                {
                  for (uint64_t j = 0LL; j != v23; ++j)
                  {
                    if (*(void *)v33 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    [v8 setObject:v11 forKey:*(void *)(*((void *)&v32 + 1) + 8 * j)];
                  }

                  uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
                }

                while (v23);
              }

              uint64_t v7 = v27;
              self = v28;
            }

            uint64_t v9 = v29;
          }
        }

        objc_autoreleasePoolPop(v12);
      }

      uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }

    while (v31);
  }

  if ([v8 count]) {
    -[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]( self,  "_findAvailabilityMatchesInSourcesForBSSIDS:",  v8);
  }
  if ([v7 count]) {
    -[WiFiAvailabilityEngine _handleCandidateMatches:](self, "_handleCandidateMatches:", v7);
  }
  -[WiFiAvailabilityEngine _removeStaleMatches](self, "_removeStaleMatches");
}

- (id)_findExistingAvailabilityMatchForScannedNetwork:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks", 0LL);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 isEqualToScannedNetwork:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_findRelevantNetworkMatchForScannedNetwork:(id)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  -[WiFiAvailabilityEngine sources](self, "sources");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v31)
  {
    id v32 = 0LL;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v31; ++i)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        [v6 relevantNetworks];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0LL; j != v9; ++j)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v7);
              }
              __int128 v12 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              [v12 SSID];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              [v4 SSID];
              __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
              char v15 = [v13 isEqualToString:v14];

              if ((v15 & 1) != 0) {
                goto LABEL_19;
              }
              [v4 BSSID];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                uint64_t v17 = (void *)MEMORY[0x189604010];
                [v4 BSSID];
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setWithObjects:", v18, 0);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                char v20 = [v12 containsAccessPointMatchingBSSIDs:v19];

                if ((v20 & 1) != 0) {
                  goto LABEL_19;
                }
              }

              [v4 essMembers];
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                uint64_t v22 = (void *)MEMORY[0x189604010];
                [v4 essMembers];
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                [v22 setWithArray:v23];
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                int v25 = [v12 containsAccessPointMatchingBSSIDs:v24];

                if (v25)
                {
LABEL_19:
                  id v26 = v12;

                  v27 = (os_log_s *)MEMORY[0x1895F8DA0];
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v42 = "-[WiFiAvailabilityEngine _findRelevantNetworkMatchForScannedNetwork:]";
                    __int16 v43 = 2112;
                    id v44 = v26;
                    __int16 v45 = 2112;
                    id v46 = v4;
                    _os_log_impl( &dword_187EBF000,  v27,  OS_LOG_TYPE_DEFAULT,  "%s: relevant network %@ matched with scanned network %@",  buf,  0x20u);
                  }

                  id v32 = v26;
                  goto LABEL_22;
                }
              }
            }

            uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v47 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

- (void)_findAvailabilityMatchesInSourcesForBSSIDS:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  char v15 = self;
  -[WiFiAvailabilityEngine sources](self, "sources");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          __int128 v11 = (void *)MEMORY[0x1895BA820]();
          __int128 v12 = (void *)MEMORY[0x189604010];
          [v4 allKeys];
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 setWithArray:v13];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

          v16[0] = MEMORY[0x1895F87A8];
          v16[1] = 3221225472LL;
          v16[2] = __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke;
          v16[3] = &unk_18A16EA68;
          id v17 = v4;
          v18 = v15;
          [v10 fetchCandidateNetworksMatchingBSSIDs:v14 completionHandler:v16];

          objc_autoreleasePoolPop(v11);
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v7);
  }
}

void __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v21 = v6;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int128 v33 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v5;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: fetched matches %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x189603FE0], "set", v21);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v23 = v5;
    id v7 = v5;
    uint64_t v27 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v27)
    {
      uint64_t v8 = *(void *)v29;
      uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v24 = a1;
      id v25 = v7;
      do
      {
        for (uint64_t i = 0LL; i != v27; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v7);
          }
          __int128 v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          __int128 v12 = (void *)MEMORY[0x1895BA820]();
          [v7 objectForKey:v11];
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 32) objectForKey:v11];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[WiFiAvailabilityMatch matchWithNetwork:scannedNetwork:]( &OBJC_CLASS___WiFiAvailabilityMatch,  "matchWithNetwork:scannedNetwork:",  v13,  v14);
            char v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              [*(id *)(a1 + 40) wifiLexicon];
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                [*(id *)(a1 + 40) wifiLexicon];
                uint64_t v17 = v8;
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                [v15 SSID];
                __int128 v19 = v9;
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setUnwantedNetworkName:", objc_msgSend(v18, "stringContainsUnwantedWords:", v20));

                uint64_t v9 = v19;
                uint64_t v8 = v17;
                a1 = v24;
                id v7 = v25;
              }

              else
              {
                [v15 setUnwantedNetworkName:0];
              }

              [v26 addObject:v15];
            }

            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315651;
              __int128 v33 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
              __int16 v34 = 2113;
              uint64_t v35 = (uint64_t)v13;
              __int16 v36 = 2113;
              __int128 v37 = v14;
              _os_log_impl( &dword_187EBF000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: failed to create match for candidate %{private}@, scanned %{private}@",  buf,  0x20u);
            }
          }

          else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315907;
            __int128 v33 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
            __int16 v34 = 2160;
            uint64_t v35 = 1752392040LL;
            __int16 v36 = 2112;
            __int128 v37 = v11;
            __int16 v38 = 2113;
            __int128 v39 = v13;
            _os_log_impl( &dword_187EBF000,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: missing scan match for bssid %{mask.hash}@, candidate %{private}@",  buf,  0x2Au);
          }

          objc_autoreleasePoolPop(v12);
        }

        uint64_t v27 = [v7 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }

      while (v27);
    }

    [*(id *)(a1 + 40) _handleCandidateMatches:v26];
    id v6 = v22;
    id v5 = v23;
  }
}

- (id)_createAvailabilityMatchForCandidate:(id)a3 scannedNetwork:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  +[WiFiAvailabilityMatch matchWithNetwork:scannedNetwork:]( &OBJC_CLASS___WiFiAvailabilityMatch,  "matchWithNetwork:scannedNetwork:",  v6,  v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && [v6 source] == 2)
  {
    -[WiFiAvailabilityEngine wifiLexicon](self, "wifiLexicon");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WiFiAvailabilityEngine wifiLexicon](self, "wifiLexicon");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 SSID];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUnwantedNetworkName:", objc_msgSend(v10, "stringContainsUnwantedWords:", v11));
    }

    else
    {
      [v8 setUnwantedNetworkName:0];
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v8 SSID];
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = 136315906;
      char v15 = "-[WiFiAvailabilityEngine _createAvailabilityMatchForCandidate:scannedNetwork:]";
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: unwanted network name %@ for candidate %@ scanned %@",  (uint8_t *)&v14,  0x2Au);
    }
  }

  return v8;
}

- (void)_handleWalletRelevancyAdded:(id)a3 removed:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: wallet networks became relevant: %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v6 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: wallet networks no longer relevant: %@",  (uint8_t *)&v7,  0x16u);
  }
}

- (void)_handle3BarsRelevancyAdded:(id)a3 removed:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: 3bars networks became relevant: %@",  (uint8_t *)&v7,  0x16u);
  }

  if (v6 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: 3bars networks no longer relevant: %@",  (uint8_t *)&v7,  0x16u);
  }
}

- (id)findRecommendationForScannedNetwork:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[WiFiAvailabilityEngine findRecommendationsForScannedNetwork:](self, "findRecommendationsForScannedNetwork:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      __int16 v9 = "-[WiFiAvailabilityEngine findRecommendationForScannedNetwork:]";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: matches %@, for network %@",  (uint8_t *)&v8,  0x20u);
    }

    [v5 anyObject];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)findRecommendationsForScannedNetwork:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [MEMORY[0x189603FE0] set];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v11 isEqualToScannedNetwork:v4])
          {
            [v5 addObject:v11];
            goto LABEL_12;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (double)availabilityMatchMaximumAge
{
  return self->_availabilityMatchMaximumAge;
}

- (NSSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (NSSet)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSSet)availableNetworks
{
  return self->_availableNetworks;
}

- (void)setAvailableNetworks:(id)a3
{
}

- (id)availabilityChangedCallback
{
  return self->_availabilityChangedCallback;
}

- (void)setAvailabilityChangedCallback:(id)a3
{
}

- (WiFiScanProvider)scanProvider
{
  return (WiFiScanProvider *)objc_loadWeakRetained((id *)&self->_scanProvider);
}

- (void)setScanProvider:(id)a3
{
}

- (WiFiLocationProvider)locationProvider
{
  return (WiFiLocationProvider *)objc_loadWeakRetained((id *)&self->_locationProvider);
}

- (void)setLocationProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (WiFiLexicon)wifiLexicon
{
  return self->_wifiLexicon;
}

- (void)setWifiLexicon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end