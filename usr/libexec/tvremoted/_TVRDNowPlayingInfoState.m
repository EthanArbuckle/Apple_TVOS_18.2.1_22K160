@interface _TVRDNowPlayingInfoState
- (BOOL)_isPaused;
- (BOOL)_shouldUpdate;
- (BOOL)captionsEnabled;
- (BOOL)hasEffectiveCanonicalID;
- (BOOL)hasUpdatedImageData;
- (BOOL)hasValidCaptionOptions;
- (BOOL)imageDataIsPlaceholder;
- (BOOL)isPlaying;
- (MRContentItem)contentItem;
- (MRLanguageOption)currentCaptionTrack;
- (MRLanguageOption)preferredCaptionTrack;
- (MRLanguageOption)preferredOnlyForcedCaptionTrack;
- (NSData)imageData;
- (NSNumber)playbackRate;
- (NSNumber)playbackState;
- (NSString)bundleID;
- (NSString)canonicalID;
- (NSString)identifier;
- (NSString)playerIdentifier;
- (NSXPCConnection)connection;
- (TVRCNowPlayingInfo)nowPlayingInfoForCurrentState;
- (TVRCNowPlayingMetadata)metadata;
- (TVRCTimedMetadata)timedMetadata;
- (WLKConnectionServerProtocol)proxy;
- (_TVRDNowPlayingInfoState)initWithHandler:(id)a3;
- (id)_currentLegibleTrackFromOptions:(id)a3;
- (id)_preferredLanguageCodeFromLanguageCodes:(id)a3 preferredLanguageCode:(id)a4 systemLanguageCode:(id)a5;
- (id)_preferredLegibleTrackFromGroups:(id)a3 containsOnlyForcedCharacteristic:(BOOL)a4;
- (id)updateHandler;
- (void)__performUpdateForCaptionMetadata;
- (void)_invokeUpdateHandlerIfNeeded;
- (void)_invokeUpdateHandlerWithNowPlayingInfo:(id)a3;
- (void)_requestImageData;
- (void)_reset;
- (void)requestCanonicalIDForIdentifier:(id)a3;
- (void)requestCanonicalIDForIdentifier:(id)a3 shouldExpectPlaybackSummaries:(BOOL)a4;
- (void)setBundleID:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setCurrentCaptionTrack:(id)a3;
- (void)setHasUpdatedImageData:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageDataIsPlaceholder:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setPlaybackRate:(id)a3;
- (void)setPlaybackState:(id)a3;
- (void)setPlayerIdentifier:(id)a3;
- (void)setPreferredCaptionTrack:(id)a3;
- (void)setPreferredOnlyForcedCaptionTrack:(id)a3;
- (void)setTimedMetadata:(id)a3;
- (void)triggerUpdateForCaptionMetadata;
- (void)updateCanonicalIdentifier:(id)a3 bundleID:(id)a4;
- (void)updateCaptionOptionsWithCurrentLanguageOptions:(id)a3 availableLanguageGroups:(id)a4;
- (void)updateContentItem:(id)a3;
- (void)updateImageData:(id)a3 isPlaceholder:(BOOL)a4;
- (void)updateMetadata:(id)a3;
- (void)updatePlaybackRate:(id)a3;
- (void)updatePlaybackState:(unint64_t)a3;
- (void)updatePlaybackStateWithPreviousMRPlaybackState:(unsigned int)a3 to:(unsigned int)a4;
- (void)updatePlayerIdentifier:(id)a3;
- (void)updateTimedMetadata:(id)a3;
@end

@implementation _TVRDNowPlayingInfoState

- (_TVRDNowPlayingInfoState)initWithHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____TVRDNowPlayingInfoState;
  v5 = -[_TVRDNowPlayingInfoState init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id updateHandler = v5->_updateHandler;
    v5->_id updateHandler = v6;

    playbackState = v5->_playbackState;
    v5->_playbackState = (NSNumber *)&off_1000217A8;
  }

  return v5;
}

- (void)updatePlaybackRate:(id)a3
{
  id v4 = a3;
  -[_TVRDNowPlayingInfoState setPlaybackRate:](self, "setPlaybackRate:", v4);
  v5 = objc_alloc_init(&OBJC_CLASS___TVRCNowPlayingInfo);
  -[TVRCNowPlayingInfo setPlaybackRate:](v5, "setPlaybackRate:", v4);

  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerWithNowPlayingInfo:]( self,  "_invokeUpdateHandlerWithNowPlayingInfo:",  v5);
}

- (void)updateCaptionOptionsWithCurrentLanguageOptions:(id)a3 availableLanguageGroups:(id)a4
{
  id v6 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState _currentLegibleTrackFromOptions:](self, "_currentLegibleTrackFromOptions:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[_TVRDNowPlayingInfoState _preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:]( self,  "_preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:",  v6,  0LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[_TVRDNowPlayingInfoState _preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:]( self,  "_preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:",  v6,  1LL));

  -[_TVRDNowPlayingInfoState setCurrentCaptionTrack:](self, "setCurrentCaptionTrack:", v9);
  -[_TVRDNowPlayingInfoState setPreferredCaptionTrack:](self, "setPreferredCaptionTrack:", v7);
  -[_TVRDNowPlayingInfoState setPreferredOnlyForcedCaptionTrack:](self, "setPreferredOnlyForcedCaptionTrack:", v8);
  -[_TVRDNowPlayingInfoState triggerUpdateForCaptionMetadata](self, "triggerUpdateForCaptionMetadata");
}

- (BOOL)captionsEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState currentCaptionTrack](self, "currentCaptionTrack"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)hasValidCaptionOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState preferredCaptionTrack](self, "preferredCaptionTrack"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)isPlaying
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackRate](self, "playbackRate"));
  [v3 floatValue];
  float v5 = v4;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackState](self, "playbackState"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackState](self, "playbackState"));
    BOOL v8 = [v7 integerValue] == (id)1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v5 != 0.0 || v8;
}

- (BOOL)hasEffectiveCanonicalID
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState canonicalID](self, "canonicalID"));
  id v4 = [v3 length];

  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState canonicalID](self, "canonicalID"));
  unsigned __int8 v6 = [v5 isEqualToString:TVRCUnknownCanonicalIDValue];

  if (v4) {
    return v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)updatePlaybackStateWithPreviousMRPlaybackState:(unsigned int)a3 to:(unsigned int)a4
{
  if (a3 || a4 != 2)
  {
    if (a4 - 1 > 4) {
      uint64_t v4 = 0LL;
    }
    else {
      uint64_t v4 = qword_100019830[a4 - 1];
    }
  }

  else
  {
    uint64_t v4 = 3LL;
  }

  -[_TVRDNowPlayingInfoState updatePlaybackState:](self, "updatePlaybackState:", v4);
}

- (void)updatePlaybackState:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[_TVRDNowPlayingInfoState setPlaybackState:](self, "setPlaybackState:", v4);

  unsigned __int8 v6 = objc_alloc_init(&OBJC_CLASS___TVRCNowPlayingInfo);
  float v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackState](self, "playbackState"));
  -[TVRCNowPlayingInfo setPlaybackState:](v6, "setPlaybackState:", v5);

  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerWithNowPlayingInfo:]( self,  "_invokeUpdateHandlerWithNowPlayingInfo:",  v6);
}

- (void)updatePlayerIdentifier:(id)a3
{
  if (!a3) {
    a3 = (id)TVRCNowPlayingInfoNullPlayerIdentifier;
  }
  -[_TVRDNowPlayingInfoState setPlayerIdentifier:](self, "setPlayerIdentifier:", a3);
  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
}

- (void)updateContentItem:(id)a3
{
  id v4 = a3;
  float v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if ([v6 length])
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
      unsigned __int8 v8 = [v7 isEqualToString:v6];

      if ((v8 & 1) != 0)
      {
        -[_TVRDNowPlayingInfoState setContentItem:](self, "setContentItem:", v5);
        -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
      }

      else
      {
        id v9 = _TVRDNPLog();
        objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
          int v13 = 138543618;
          v14 = v11;
          __int16 v15 = 2114;
          v16 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Content item identifier change detected %{public}@ -> %{public}@ - will request imageData and canonicalID ",  (uint8_t *)&v13,  0x16u);
        }

        -[_TVRDNowPlayingInfoState _reset](self, "_reset");
        -[_TVRDNowPlayingInfoState setContentItem:](self, "setContentItem:", v5);
        -[_TVRDNowPlayingInfoState setIdentifier:](self, "setIdentifier:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVRCNowPlayingMetadata metadataFromContentItem:]( &OBJC_CLASS___TVRCNowPlayingMetadata,  "metadataFromContentItem:",  v5));
        -[_TVRDNowPlayingInfoState updateMetadata:](self, "updateMetadata:", v12);
        -[_TVRDNowPlayingInfoState _requestImageData](self, "_requestImageData");
      }
    }
  }
}

- (void)updateMetadata:(id)a3
{
  id v8 = a3;
  -[_TVRDNowPlayingInfoState setMetadata:](self, "setMetadata:", v8);
  id v4 = v8;
  if (v8)
  {
    float v5 = (void *)objc_claimAutoreleasedReturnValue([v8 canonicalID]);
    id v6 = [v5 length];

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
      -[_TVRDNowPlayingInfoState requestCanonicalIDForIdentifier:shouldExpectPlaybackSummaries:]( self,  "requestCanonicalIDForIdentifier:shouldExpectPlaybackSummaries:",  v7,  0LL);
    }

    -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
    id v4 = v8;
  }
}

- (void)updateTimedMetadata:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDNPLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 rawData]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 length]));
    int v16 = 138543618;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received timedMetadata for ID %{public}@, length=%@",  (uint8_t *)&v16,  0x16u);
  }

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
    objc_msgSend(v14, "tvrd_removeForRestoration");
  }

  -[_TVRDNowPlayingInfoState setTimedMetadata:](self, "setTimedMetadata:", v4);
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
  objc_msgSend(v15, "tvrd_saveForRestoration");

  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
}

- (void)updateImageData:(id)a3 isPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = _TVRDNPLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received image data for %{public}@ isPlaceholder=%@",  (uint8_t *)&v11,  0x16u);
  }

  -[_TVRDNowPlayingInfoState setHasUpdatedImageData:](self, "setHasUpdatedImageData:", 1LL);
  -[_TVRDNowPlayingInfoState setImageData:](self, "setImageData:", v6);

  -[_TVRDNowPlayingInfoState setImageDataIsPlaceholder:](self, "setImageDataIsPlaceholder:", v4);
  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
}

- (void)updateCanonicalIdentifier:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDNPLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    int v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received canonical ID %@, bundleID %@ for %@",  (uint8_t *)&v11,  0x20u);
  }

  -[_TVRDNowPlayingInfoState setCanonicalID:](self, "setCanonicalID:", v6);
  -[_TVRDNowPlayingInfoState setBundleID:](self, "setBundleID:", v7);
  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerIfNeeded](self, "_invokeUpdateHandlerIfNeeded");
}

- (void)triggerUpdateForCaptionMetadata
{
}

- (id)_currentLegibleTrackFromOptions:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "msv_firstWhere:", &__block_literal_global));
  }
  else {
    return 0LL;
  }
}

- (id)_preferredLegibleTrackFromGroups:(id)a3 containsOnlyForcedCharacteristic:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v6)
  {
    v52 = self;
    id v54 = v6;
    BOOL v50 = v4;
    id v9 = v8;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id obj = v6;
    id v60 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
    char v10 = 0;
    id v11 = 0LL;
    if (v60)
    {
      uint64_t v58 = *(void *)v78;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v78 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v62 = v12;
          __int16 v13 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v75 = 0u;
          __int128 v76 = 0u;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 languageOptions]);
          id v15 = [v14 countByEnumeratingWithState:&v73 objects:v92 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v74;
            do
            {
              __int16 v18 = 0LL;
              do
              {
                if (*(void *)v74 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue([v19 languageTag]);
                v21 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
                if ([v19 type] == 1
                  && ([v19 isAutomaticLanguageOptionWithType:1] & 1) == 0)
                {
                  if (v20)
                  {
                    [v9 addObject:v19];
                    [v64 addObject:v20];
                  }

                  else if (!v11 && v21)
                  {
                    else {
                      id v11 = 0LL;
                    }
                  }
                }

                __int16 v18 = (char *)v18 + 1;
              }

              while (v16 != v18);
              id v22 = [v14 countByEnumeratingWithState:&v73 objects:v92 count:16];
              id v16 = v22;
            }

            while (v22);
          }

          uint64_t v12 = v62 + 1;
        }

        while ((id)(v62 + 1) != v60);
        id v60 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
      }

      while (v60);
    }

    id v8 = v9;
    if ([v9 count])
    {
      char v63 = v10;
      self = v52;
      id v6 = v54;
      BOOL v4 = v50;
      id v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      goto LABEL_32;
    }

    id v6 = v54;
    if (v11)
    {
      id v11 = v11;
      v27 = v11;
      goto LABEL_62;
    }
  }

  else if ([v8 count])
  {
    id v11 = 0LL;
    char v63 = 0;
LABEL_32:
    CFArrayRef v23 = MACaptionAppearanceCopySelectedLanguages(kMACaptionAppearanceDomainUser);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFArray firstObject](v23, "firstObject"));
    v25 = v24;
    if (v24) {
      id v26 = v24;
    }
    else {
      id v26 = (id)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
    }
    v28 = v26;

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVSInternationalization systemLanguage](&OBJC_CLASS___TVSInternationalization, "systemLanguage"));
    id v30 = (id)objc_claimAutoreleasedReturnValue( -[_TVRDNowPlayingInfoState _preferredLanguageCodeFromLanguageCodes:preferredLanguageCode:systemLanguageCode:]( self,  "_preferredLanguageCodeFromLanguageCodes:preferredLanguageCode:systemLanguageCode:",  v64,  v28,  v29));
    if (!v30)
    {
      v59 = v29;
      v61 = v28;
      v53 = self;
      id v55 = v6;
      BOOL v51 = v4;
      id obja = v8;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v7[157] array]);
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      __int128 v72 = 0u;
      id v32 = v64;
      id v33 = [v32 countByEnumeratingWithState:&v69 objects:v91 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v70;
        do
        {
          for (i = 0LL; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v70 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
            v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  v37));
            v39 = (void *)objc_claimAutoreleasedReturnValue([v38 languageCode]);

            if (v39) {
              v40 = v39;
            }
            else {
              v40 = v37;
            }
            [v31 addObject:v40];
          }

          id v34 = [v32 countByEnumeratingWithState:&v69 objects:v91 count:16];
        }

        while (v34);
      }

      id v41 = [v32 count];
      if (v41 != [v31 count]) {
        -[_TVRDNowPlayingInfoState _preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:].cold.1();
      }
      v29 = v59;
      v28 = v61;
      uint64_t v42 = objc_claimAutoreleasedReturnValue( -[_TVRDNowPlayingInfoState _preferredLanguageCodeFromLanguageCodes:preferredLanguageCode:systemLanguageCode:]( v53,  "_preferredLanguageCodeFromLanguageCodes:preferredLanguageCode:systemLanguageCode:",  v31,  v61,  v59));
      id v6 = v55;
      id v8 = obja;
      if (!v42)
      {

        id v30 = 0LL;
        BOOL v4 = v51;
        goto LABEL_58;
      }

      v43 = (void *)v42;
      id v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndex:", objc_msgSend(v31, "indexOfObject:", v42)));

      BOOL v4 = v51;
      if (!v30) {
        goto LABEL_58;
      }
    }

    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = __94___TVRDNowPlayingInfoState__preferredLegibleTrackFromGroups_containsOnlyForcedCharacteristic___block_invoke;
    v65[3] = &unk_100020CF8;
    BOOL v67 = v4;
    char v68 = v63;
    id v30 = v30;
    id v66 = v30;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "msv_firstWhere:", v65));

    if (v27)
    {
LABEL_61:

      goto LABEL_62;
    }

- (id)_preferredLanguageCodeFromLanguageCodes:(id)a3 preferredLanguageCode:(id)a4 systemLanguageCode:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsSeparatedByString:@"-"]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsSeparatedByString:@"-"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  v39[0] = v8;
  v39[1] = v9;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v7,  v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"-"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale canonicalLanguageIdentifierFromString:]( &OBJC_CLASS___NSLocale,  "canonicalLanguageIdentifierFromString:",  v8));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSLocaleLanguageCode]);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale canonicalLanguageIdentifierFromString:]( &OBJC_CLASS___NSLocale,  "canonicalLanguageIdentifierFromString:",  v14));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale componentsFromLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "componentsFromLocaleIdentifier:",  v20));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:NSLocaleLanguageCode]);

  if (v14
    && (([v28 isEqualToString:v16] & 1) != 0
     || ([v27 isEqualToString:v16] & 1) != 0
     || [v22 isEqualToString:v19]))
  {
    id v23 = v14;
  }

  else
  {
    id v24 = _TVRDNPLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      id v30 = v7;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2114;
      id v34 = v9;
      __int16 v35 = 2114;
      v36 = v20;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Unable to determine best language code with from languageCodes: %{public}@, preferredLanguageCode: %{public}@, s ystemLanguageCode: %{public}@, canonicalChosenResult: %{public}@, bestLanguageCode: %{public}@",  buf,  0x34u);
    }

    id v23 = 0LL;
  }

  return v23;
}

- (void)_reset
{
}

- (BOOL)_shouldUpdate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState metadata](self, "metadata"));
  unsigned int v5 = -[_TVRDNowPlayingInfoState hasUpdatedImageData](self, "hasUpdatedImageData");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState canonicalID](self, "canonicalID"));
  id v7 = [v6 length];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState canonicalID](self, "canonicalID"));
  unsigned __int8 v9 = [v8 isEqualToString:TVRCUnknownCanonicalIDValue];

  unsigned __int8 v10 = -[_TVRDNowPlayingInfoState _isPaused](self, "_isPaused");
  BOOL result = 0;
  if (v3 && v4 && v5)
  {
    char v12 = v10 & v9 ^ 1;
    if (v7) {
      return v12;
    }
    else {
      return 0;
    }
  }

  return result;
}

- (void)_invokeUpdateHandlerIfNeeded
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState updateHandler](self, "updateHandler"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState nowPlayingInfoForCurrentState](self, "nowPlayingInfoForCurrentState"));
    if (v4)
    {
      unsigned int v5 = v4;
      -[_TVRDNowPlayingInfoState _invokeUpdateHandlerWithNowPlayingInfo:]( self,  "_invokeUpdateHandlerWithNowPlayingInfo:",  v4);
      BOOL v4 = v5;
    }
  }

- (void)_invokeUpdateHandlerWithNowPlayingInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState updateHandler](self, "updateHandler"));

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = __67___TVRDNowPlayingInfoState__invokeUpdateHandlerWithNowPlayingInfo___block_invoke;
    v6[3] = &unk_100020C40;
    id v7 = v4;
    id v8 = self;
    dispatch_async(&_dispatch_main_q, v6);
  }
}

- (BOOL)_isPaused
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackRate](self, "playbackRate"));
  [v3 doubleValue];
  double v5 = fabs(v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackState](self, "playbackState"));
  id v7 = [v6 integerValue];

  return v5 <= 2.22044605e-16 || v7 != (id)1;
}

- (TVRCNowPlayingInfo)nowPlayingInfoForCurrentState
{
  if (-[_TVRDNowPlayingInfoState _shouldUpdate](self, "_shouldUpdate"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState metadata](self, "metadata"));
    id v4 = [v3 copy];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState canonicalID](self, "canonicalID"));
    [v4 setCanonicalID:v5];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState bundleID](self, "bundleID"));
    [v4 setBundleID:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState contentItem](self, "contentItem"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);

    if (v8)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState contentItem](self, "contentItem"));
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
      [v10 elapsedTimeTimestamp];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v4 setTimestamp:v11];

      char v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState contentItem](self, "contentItem"));
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
      [v13 elapsedTime];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v4 setTimeOffset:v14];
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___TVRCNowPlayingInfo);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
    -[TVRCNowPlayingInfo setIdentifier:](v15, "setIdentifier:", v16);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackRate](self, "playbackRate"));
    -[TVRCNowPlayingInfo setPlaybackRate:](v15, "setPlaybackRate:", v17);

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playbackState](self, "playbackState"));
    -[TVRCNowPlayingInfo setPlaybackState:](v15, "setPlaybackState:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState playerIdentifier](self, "playerIdentifier"));
    -[TVRCNowPlayingInfo setPlayerIdentifier:](v15, "setPlayerIdentifier:", v19);

    -[TVRCNowPlayingInfo setMetadata:](v15, "setMetadata:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVRDNowPlayingInfoState captionsEnabled](self, "captionsEnabled")));
    -[TVRCNowPlayingInfo setCaptionsEnabled:](v15, "setCaptionsEnabled:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVRDNowPlayingInfoState hasValidCaptionOptions](self, "hasValidCaptionOptions")));
    -[TVRCNowPlayingInfo setHasValidCaptionOptions:](v15, "setHasValidCaptionOptions:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 programID]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));

    if (!v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVRCTimedMetadata tvrd_restoredTimedMetadataForIdentifier:]( &OBJC_CLASS___TVRCTimedMetadata,  "tvrd_restoredTimedMetadataForIdentifier:",  v22));
      -[_TVRDNowPlayingInfoState setTimedMetadata:](self, "setTimedMetadata:", v24);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 identifier]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 programID]);
    if ([v26 isEqualToString:v27])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 rawData]);
      -[TVRCNowPlayingInfo setRawTimedMetadata:](v15, "setRawTimedMetadata:", v29);
    }

    else
    {
      -[TVRCNowPlayingInfo setRawTimedMetadata:](v15, "setRawTimedMetadata:", 0LL);
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
    if ([v30 hasExpectsTimedMetadata])
    {
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState timedMetadata](self, "timedMetadata"));
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v31 expectsTimedMetadata]));
      -[TVRCNowPlayingInfo setExpectsTimedMetadata:](v15, "setExpectsTimedMetadata:", v32);
    }

    else
    {
      -[TVRCNowPlayingInfo setExpectsTimedMetadata:](v15, "setExpectsTimedMetadata:", 0LL);
    }

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState imageData](self, "imageData"));
    -[TVRCNowPlayingInfo setImageData:](v15, "setImageData:", v33);

    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[_TVRDNowPlayingInfoState imageDataIsPlaceholder](self, "imageDataIsPlaceholder")));
    -[TVRCNowPlayingInfo setImageDataIsPlaceholder:](v15, "setImageDataIsPlaceholder:", v34);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (void)_requestImageData
{
  id v3 = _TVRDNPLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState identifier](self, "identifier"));
    *(_DWORD *)buf = 138543362;
    __int16 v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Requesting image data for %{public}@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = objc_alloc(&OBJC_CLASS___MRNowPlayingRequest);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDestination localDestination](&OBJC_CLASS___MRDestination, "localDestination"));
  id v8 = [v6 initWithDestination:v7];

  unsigned __int8 v9 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __45___TVRDNowPlayingInfoState__requestImageData__block_invoke;
  v10[3] = &unk_100020D20;
  objc_copyWeak(&v11, (id *)buf);
  [v8 requestNowPlayingItemArtworkOnQueue:&_dispatch_main_q completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)requestCanonicalIDForIdentifier:(id)a3 shouldExpectPlaybackSummaries:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    -[_TVRDNowPlayingInfoState requestCanonicalIDForIdentifier:](self, "requestCanonicalIDForIdentifier:", v6);
  }

  else
  {
    dispatch_time_t v7 = dispatch_time(0LL, 2500000000LL);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __90___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier_shouldExpectPlaybackSummaries___block_invoke;
    v8[3] = &unk_100020C40;
    v8[4] = self;
    id v9 = v6;
    dispatch_after(v7, &_dispatch_main_q, v8);
  }
}

- (void)requestCanonicalIDForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDNPLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting canonical ID for %{public}@",  buf,  0xCu);
  }

  objc_initWeak((id *)buf, self);
  dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState proxy](self, "proxy"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __60___TVRDNowPlayingInfoState_requestCanonicalIDForIdentifier___block_invoke;
  v9[3] = &unk_100020D70;
  objc_copyWeak(&v11, (id *)buf);
  id v8 = v4;
  id v10 = v8;
  [v7 requestDecoratedNowPlayingSummaries:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)__performUpdateForCaptionMetadata
{
  BOOL v3 = -[_TVRDNowPlayingInfoState captionsEnabled](self, "captionsEnabled");
  BOOL v4 = -[_TVRDNowPlayingInfoState hasValidCaptionOptions](self, "hasValidCaptionOptions");
  id v5 = _TVRDNPLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState currentCaptionTrack](self, "currentCaptionTrack"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState preferredCaptionTrack](self, "preferredCaptionTrack"));
    int v12 = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating now playing info based on currentCaptionTrack: %{public}@, preferredCaptionTrack: %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___TVRCNowPlayingInfo);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  -[TVRCNowPlayingInfo setCaptionsEnabled:](v9, "setCaptionsEnabled:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[TVRCNowPlayingInfo setHasValidCaptionOptions:](v9, "setHasValidCaptionOptions:", v11);

  -[_TVRDNowPlayingInfoState _invokeUpdateHandlerWithNowPlayingInfo:]( self,  "_invokeUpdateHandlerWithNowPlayingInfo:",  v9);
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    BOOL v4 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.watchlistd.xpc",  0LL);
    id v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    uint64_t v7 = WLKConnectionClientInterface();
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v8);

    id v9 = -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    id v10 = self->_connection;
    uint64_t v11 = WLKConnectionServerInterface(v9);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v12);

    -[NSXPCConnection setInterruptionHandler:]( self->_connection,  "setInterruptionHandler:",  &__block_literal_global_158);
    objc_initWeak(&location, self);
    id v13 = self->_connection;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    uint64_t v17 = __38___TVRDNowPlayingInfoState_connection__block_invoke_159;
    __int16 v18 = &unk_100020BF0;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v15);
    -[NSXPCConnection resume](self->_connection, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (WLKConnectionServerProtocol)proxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TVRDNowPlayingInfoState connection](self, "connection"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_161]);

  return (WLKConnectionServerProtocol *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(id)a3
{
}

- (NSNumber)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(id)a3
{
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
}

- (MRContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
}

- (MRLanguageOption)currentCaptionTrack
{
  return self->_currentCaptionTrack;
}

- (void)setCurrentCaptionTrack:(id)a3
{
}

- (MRLanguageOption)preferredCaptionTrack
{
  return self->_preferredCaptionTrack;
}

- (void)setPreferredCaptionTrack:(id)a3
{
}

- (MRLanguageOption)preferredOnlyForcedCaptionTrack
{
  return self->_preferredOnlyForcedCaptionTrack;
}

- (void)setPreferredOnlyForcedCaptionTrack:(id)a3
{
}

- (TVRCNowPlayingMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (TVRCTimedMetadata)timedMetadata
{
  return self->_timedMetadata;
}

- (void)setTimedMetadata:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (BOOL)hasUpdatedImageData
{
  return self->_hasUpdatedImageData;
}

- (void)setHasUpdatedImageData:(BOOL)a3
{
  self->_hasUpdatedImageData = a3;
}

- (BOOL)imageDataIsPlaceholder
{
  return self->_imageDataIsPlaceholder;
}

- (void)setImageDataIsPlaceholder:(BOOL)a3
{
  self->_imageDataIsPlaceholder = a3;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
}

- (void)_preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:.cold.1()
{
  __assert_rtn( "-[_TVRDNowPlayingInfoState _preferredLegibleTrackFromGroups:containsOnlyForcedCharacteristic:]",  "TVRDNowPlayingMonitor_tvOS.m",  531,  "languageCodes.count == revisedLanguageCodes.count");
}

@end