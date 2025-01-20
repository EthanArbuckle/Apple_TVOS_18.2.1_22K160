@interface MRDNowPlayingObserverState
- (MRClient)clientProperties;
- (MRDNowPlayingObserverState)initWithPlayerPath:(id)a3;
- (MRNowPlayingState)state;
- (MRPlaybackQueue)playbackQueue;
- (MRPlayer)playerProperties;
- (MRPlayerPath)playerPath;
- (NSArray)contentItems;
- (NSArray)contentItemsArtwork;
- (NSArray)supportedCommands;
- (NSDate)playbackStateTimestamp;
- (NSNumber)playbackState;
- (id)_coealesceItems:(id)a3;
- (id)description;
- (unint64_t)playbackQueueCapabilities;
- (void)setClientProperties:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setContentItemsArtwork:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(unint64_t)a3;
- (void)setPlaybackState:(id)a3;
- (void)setPlaybackStateTimestamp:(id)a3;
- (void)setPlayerProperties:(id)a3;
- (void)setSupportedCommands:(id)a3;
@end

@implementation MRDNowPlayingObserverState

- (MRDNowPlayingObserverState)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDNowPlayingObserverState;
  v6 = -[MRDNowPlayingObserverState init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playerPath, a3);
  }

  return v7;
}

- (id)description
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  supportedCommands = self->_supportedCommands;
  if (supportedCommands) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  supportedCommands = %lu\n",  -[NSArray count](supportedCommands, "count"));
  }
  playbackQueue = self->_playbackQueue;
  if (playbackQueue)
  {
    uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(playbackQueue);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" playbackQueue = %@\n", v7);
  }

  unint64_t playbackQueueCapabilities = self->_playbackQueueCapabilities;
  if (playbackQueueCapabilities)
  {
    objc_super v9 = (void *)MRPlaybackQueueCapabilitiesCopyDescription(playbackQueueCapabilities);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" unint64_t playbackQueueCapabilities = %@\n", v9);
  }

  contentItems = self->_contentItems;
  if (contentItems)
  {
    uint64_t v11 = MRCreateIndentedDebugDescriptionFromArray(contentItems);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  contentItems = %@\n", v12);
  }

  contentItemsArtwork = self->_contentItemsArtwork;
  if (contentItemsArtwork)
  {
    uint64_t v14 = MRCreateIndentedDebugDescriptionFromArray(contentItemsArtwork);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  contentItemArtworks = %@\n", v15);
  }

  playbackState = self->_playbackState;
  if (playbackState)
  {
    v17 = (void *)MRMediaRemoteCopyPlaybackStateDescription(-[NSNumber intValue](playbackState, "intValue"));
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"  playbackState = %@\n", v17);
  }

  playbackStateTimestamp = self->_playbackStateTimestamp;
  if (playbackStateTimestamp)
  {
    -[NSDate timeIntervalSinceNow](self->_playbackStateTimestamp, "timeIntervalSinceNow");
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  playbackStateTimestamp = %@ (%lf seconds ago)\n",  playbackStateTimestamp,  v19);
  }

  playerProperties = self->_playerProperties;
  if (playerProperties)
  {
    uint64_t v21 = MRCreateIndentedDebugDescriptionFromObject(playerProperties);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    playerProperties = %@\n", v22);
  }

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>");
  return v3;
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  v30 = self;
  id v5 = -[NSArray mutableCopy](self->_contentItems, "mutableCopy");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentItems]);
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ([v5 containsObject:v11])
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
          unsigned int v13 = [v12 verboseNowPlayingStateObserver];

          if (v13)
          {
            uint64_t v15 = _MRLogForCategory(1LL, v14);
            v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              playerPath = v30->_playerPath;
              *(_DWORD *)buf = 138412546;
              id v36 = v11;
              __int16 v37 = 2112;
              v38 = playerPath;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Removing item %@ item from contentItems because playbackQueue contains item for %@",  buf,  0x16u);
            }
          }

          [v5 removeObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }

    while (v8);
  }

  playbackQueue = v30->_playbackQueue;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v20 = [v19 verboseNowPlayingStateObserver];

  if (playbackQueue)
  {
    if (v20)
    {
      uint64_t v22 = _MRLogForCategory(1LL, v21);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v30->_playerPath;
        *(_DWORD *)buf = 138412546;
        id v36 = v4;
        __int16 v37 = 2112;
        v38 = v24;
        v25 = "[MRDNowPlayingStateObserver] Updating playbackQueue %@for %@";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
        goto LABEL_22;
      }

      goto LABEL_22;
    }
  }

  else if (v20)
  {
    uint64_t v26 = _MRLogForCategory(1LL, v21);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v30->_playerPath;
      *(_DWORD *)buf = 138412546;
      id v36 = v4;
      __int16 v37 = 2112;
      v38 = v27;
      v25 = "[MRDNowPlayingStateObserver] Setting playbackQueue %@ for %@";
      goto LABEL_21;
    }

- (void)setContentItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v64 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(NSMutableArray **)(*((void *)&v63 + 1) + 8LL * (void)i);
        playbackQueue = self->_playbackQueue;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray identifier](v9, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlaybackQueue contentItemForIdentifier:](playbackQueue, "contentItemForIdentifier:", v11));

        if (v12)
        {
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
          unsigned int v14 = [v13 verboseNowPlayingStateObserver];

          if (v14)
          {
            uint64_t v16 = _MRLogForCategory(1LL, v15);
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              playerPath = self->_playerPath;
              *(_DWORD *)buf = 138412546;
              v70 = v9;
              __int16 v71 = 2112;
              v72 = playerPath;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Merging item %@ into playbackQueue for %@",  buf,  0x16u);
            }
          }

          [v12 mergeFrom:v9];
        }

        else
        {
          -[NSMutableArray addObject:](v4, "addObject:", v9);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    }

    while (v6);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v49 = -[NSMutableArray copy](v4, "copy");
  id v52 = [v49 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v60;
    do
    {
      uint64_t v19 = 0LL;
      do
      {
        if (*(void *)v60 != v51) {
          objc_enumerationMutation(v49);
        }
        uint64_t v53 = v19;
        unsigned int v20 = *(NSMutableArray **)(*((void *)&v59 + 1) + 8 * v19);
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        uint64_t v21 = self->_contentItems;
        id v22 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v55,  v67,  16LL);
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v56;
          do
          {
            for (j = 0LL; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v56 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray identifier](v20, "identifier"));
              v28 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
              unsigned int v29 = [v27 isEqual:v28];

              if (v29)
              {
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
                unsigned int v31 = [v30 verboseNowPlayingStateObserver];

                if (v31)
                {
                  uint64_t v33 = _MRLogForCategory(1LL, v32);
                  __int128 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = self->_playerPath;
                    *(_DWORD *)buf = 138412546;
                    v70 = v20;
                    __int16 v71 = 2112;
                    v72 = v35;
                    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Merging item %@ into contentItems for %@",  buf,  0x16u);
                  }
                }

                [v26 mergeFrom:v20];
                -[NSMutableArray removeObject:](v4, "removeObject:", v20);
              }
            }

            id v23 = -[NSArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v55,  v67,  16LL);
          }

          while (v23);
        }

        uint64_t v19 = v53 + 1;
      }

      while ((id)(v53 + 1) != v52);
      id v52 = [v49 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }

    while (v52);
  }

  NSUInteger v36 = -[NSArray count](self->_contentItems, "count");
  __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v38 = [v37 verboseNowPlayingStateObserver];

  if (v36)
  {
    if (!v38) {
      goto LABEL_44;
    }
    uint64_t v40 = _MRLogForCategory(1LL, v39);
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    v42 = self->_playerPath;
    *(_DWORD *)buf = 138412546;
    v70 = v4;
    __int16 v71 = 2112;
    v72 = v42;
    v43 = "[MRDNowPlayingStateObserver] Adding contentItems %@ for %@";
    goto LABEL_42;
  }

  if (!v38) {
    goto LABEL_44;
  }
  uint64_t v44 = _MRLogForCategory(1LL, v39);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v45 = self->_playerPath;
    *(_DWORD *)buf = 138412546;
    v70 = v4;
    __int16 v71 = 2112;
    v72 = v45;
    v43 = "[MRDNowPlayingStateObserver] Setting contentItems %@ for %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v43, buf, 0x16u);
  }

- (void)setContentItemsArtwork:(id)a3
{
  id v4 = a3;
  contentItemsArtwork = self->_contentItemsArtwork;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (contentItemsArtwork)
  {
    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v19 = 138412546;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = playerPath;
        v12 = "[MRDNowPlayingStateObserver] Adding items %@ into contentItemArtworkUpdates for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x16u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (v7)
  {
    uint64_t v13 = _MRLogForCategory(1LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = self->_playerPath;
      int v19 = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v14;
      v12 = "[MRDNowPlayingStateObserver] Setting items %@ into contentItemArtworkUpdates for %@";
      goto LABEL_8;
    }

- (void)setSupportedCommands:(id)a3
{
  id v4 = (NSArray *)a3;
  supportedCommands = self->_supportedCommands;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (supportedCommands)
  {
    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v16 = 138412546;
        v17 = v4;
        __int16 v18 = 2112;
        int v19 = playerPath;
        v12 = "[MRDNowPlayingStateObserver] Updating supportedCommands %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (v7)
  {
    uint64_t v13 = _MRLogForCategory(1LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = self->_playerPath;
      int v16 = 138412546;
      v17 = v4;
      __int16 v18 = 2112;
      int v19 = v14;
      v12 = "[MRDNowPlayingStateObserver] Setting supportedCommands %@ for %@";
      goto LABEL_8;
    }

- (void)setPlayerProperties:(id)a3
{
  id v4 = (MRPlayer *)a3;
  playerProperties = self->_playerProperties;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playerProperties)
  {
    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        int v16 = 138412546;
        v17 = v4;
        __int16 v18 = 2112;
        int v19 = playerPath;
        v12 = "[MRDNowPlayingStateObserver] Updating playerProperties %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0x16u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (v7)
  {
    uint64_t v13 = _MRLogForCategory(1LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = self->_playerPath;
      int v16 = 138412546;
      v17 = v4;
      __int16 v18 = 2112;
      int v19 = v14;
      v12 = "[MRDNowPlayingStateObserver] Setting playerProperties %@ for %@";
      goto LABEL_8;
    }

- (void)setPlaybackState:(id)a3
{
  id v4 = (NSNumber *)a3;
  playbackState = self->_playbackState;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playbackState)
  {
    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)MRMediaRemoteCopyPlaybackStateDescription(-[NSNumber intValue](v4, "intValue"));
        playerPath = self->_playerPath;
        int v17 = 138412546;
        __int16 v18 = v11;
        __int16 v19 = 2112;
        id v20 = playerPath;
        uint64_t v13 = "[MRDNowPlayingStateObserver] Updating playbackState %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x16u);

        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (v7)
  {
    uint64_t v14 = _MRLogForCategory(1LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)MRMediaRemoteCopyPlaybackStateDescription(-[NSNumber intValue](v4, "intValue"));
      uint64_t v15 = self->_playerPath;
      int v17 = 138412546;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      id v20 = v15;
      uint64_t v13 = "[MRDNowPlayingStateObserver] Setting playbackState %@ for %@";
      goto LABEL_8;
    }

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
  unint64_t playbackQueueCapabilities = self->_playbackQueueCapabilities;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v7 = [v6 verboseNowPlayingStateObserver];

  if (playbackQueueCapabilities)
  {
    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)MRPlaybackQueueCapabilitiesCopyDescription(a3);
        playerPath = self->_playerPath;
        int v16 = 138412546;
        int v17 = v11;
        __int16 v18 = 2112;
        __int16 v19 = playerPath;
        uint64_t v13 = "[MRDNowPlayingStateObserver] Updating playbackState %@ for %@";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);

        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (v7)
  {
    uint64_t v14 = _MRLogForCategory(1LL, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)MRPlaybackQueueCapabilitiesCopyDescription(a3);
      uint64_t v15 = self->_playerPath;
      int v16 = 138412546;
      int v17 = v11;
      __int16 v18 = 2112;
      __int16 v19 = v15;
      uint64_t v13 = "[MRDNowPlayingStateObserver] Setting playbackState %@ for %@";
      goto LABEL_8;
    }

- (MRNowPlayingState)state
{
  if (self->_supportedCommands
    || self->_playbackQueue
    || self->_playbackQueueCapabilities
    || self->_playbackState
    || self->_playbackStateTimestamp)
  {
    id v3 = objc_alloc(&OBJC_CLASS___MRNowPlayingState);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playerPath](self, "playerPath"));
    id v5 = -[MRNowPlayingState initWithPlayerPath:](v3, "initWithPlayerPath:", v4);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState supportedCommands](self, "supportedCommands"));
    -[MRNowPlayingState setSupportedCommands:](v5, "setSupportedCommands:", v6);

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playbackQueue](self, "playbackQueue"));
    -[MRNowPlayingState setPlaybackQueue:](v5, "setPlaybackQueue:", v7);

    -[MRNowPlayingState setPlaybackQueueCapabilities:]( v5,  "setPlaybackQueueCapabilities:",  -[MRDNowPlayingObserverState playbackQueueCapabilities](self, "playbackQueueCapabilities"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playbackState](self, "playbackState"));

    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playbackState](self, "playbackState"));
      -[MRNowPlayingState setPlaybackState:](v5, "setPlaybackState:", [v9 intValue]);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playbackStateTimestamp](self, "playbackStateTimestamp"));

    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingObserverState playbackStateTimestamp](self, "playbackStateTimestamp"));
      [v11 timeIntervalSinceReferenceDate];
      -[MRNowPlayingState setPlaybackStateTimestamp:](v5, "setPlaybackStateTimestamp:");
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)_coealesceItems:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v3;
  id v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        id v6 = *(void **)(*((void *)&v26 + 1) + 8 * v5);
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v7 = obj;
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            uint64_t v11 = 0LL;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v11);
              if (v6 != v12)
              {
                uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
                unsigned int v15 = [v13 isEqualToString:v14];

                if (v15) {
                  [v6 mergeFrom:v12];
                }
              }

              -[NSMutableSet addObject:](v4, "addObject:", v6, v18);
              uint64_t v11 = (char *)v11 + 1;
            }

            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }

          while (v9);
        }

        uint64_t v5 = v21 + 1;
      }

      while ((id)(v21 + 1) != v19);
      id v19 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v19);
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v4, "allObjects"));
  return v16;
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (unint64_t)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (NSArray)contentItemsArtwork
{
  return self->_contentItemsArtwork;
}

- (NSNumber)playbackState
{
  return self->_playbackState;
}

- (NSDate)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (void)setPlaybackStateTimestamp:(id)a3
{
}

- (MRClient)clientProperties
{
  return self->_clientProperties;
}

- (void)setClientProperties:(id)a3
{
}

- (MRPlayer)playerProperties
{
  return self->_playerProperties;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
}

@end