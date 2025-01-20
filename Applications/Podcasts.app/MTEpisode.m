@interface MTEpisode
+ (id)dateLabelDescriptionForEpisode:(id)a3 download:(id)a4;
+ (int64_t)downloadSizeLimitForEpisode:(id)a3;
+ (int64_t)downloadSizeLimitForVideo:(BOOL)a3;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isEpisodeVisited;
- (BOOL)isPlayable;
- (MTEpisodeIdentifier)episodeIdentifier;
- (int64_t)reasonForNotPlayable;
- (void)didChangePersistentID;
- (void)setAuthor:(id)a3;
- (void)setGuid:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setPlayhead:(float)a3;
- (void)setTitle:(id)a3;
- (void)updateUPPIdentifierIfNeeded;
@end

@implementation MTEpisode

+ (id)dateLabelDescriptionForEpisode:(id)a3 download:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
  unint64_t v8 = (unint64_t)[v7 reasonForNoInternet];

  uint64_t v9 = +[MTEpisode downloadSizeLimitForEpisode:](&OBJC_CLASS___MTEpisode, "downloadSizeLimitForEpisode:", v5);
  if ((uint64_t)[v6 downloadBytes] <= v9)
  {
    unsigned int v11 = 0;
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](&OBJC_CLASS___MTReachability, "sharedInstance"));
    unsigned int v11 = [v10 isReachableViaCellular];
  }

  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v8 == 2) {
      int v14 = 1;
    }
    else {
      int v14 = v11;
    }
    if (v14 == 1)
    {
      int v15 = MGGetBoolAnswer(@"wapi");
      v16 = @"WIFI_CONNECT_RESUME";
      if (v15) {
        v16 = @"WLAN_CONNECT_RESUME";
      }
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:v17 value:&stru_100248948 table:0]);

      goto LABEL_23;
    }

+ (int64_t)downloadSizeLimitForEpisode:(id)a3
{
  return (int64_t)_objc_msgSend(a1, "downloadSizeLimitForVideo:", objc_msgSend(a3, "isVideo"));
}

+ (int64_t)downloadSizeLimitForVideo:(BOOL)a3
{
  return 0LL;
}

- (void)setGuid:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeGuid;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeGuid);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
    }
  }
}

- (void)setTitle:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeTitle;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeTitle);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));

      if (!v9) {
        -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
      }
    }
  }
}

- (void)setAuthor:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode author](self, "author"));
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode author](self, "author"));
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeAuthor;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeAuthor);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));

      if (!v9) {
        -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
      }
    }
  }
}

- (BOOL)isPlayable
{
  return -[MTEpisode reasonForNotPlayable](self, "reasonForNotPlayable") == 0;
}

- (int64_t)reasonForNotPlayable
{
  return +[MTEpisodeUnavailableUtil unavailableReasonForEpisode:]( &OBJC_CLASS___MTEpisodeUnavailableUtil,  "unavailableReasonForEpisode:",  self);
}

- (void)didChangePersistentID
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode playlists](self, "playlists", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateUnplayedCount];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)setPlayCount:(int64_t)a3
{
  if (-[MTEpisode playCount](self, "playCount") != (id)a3)
  {
    uint64_t v5 = kEpisodePlayCount;
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodePlayCount);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v5);
    -[MTEpisode updateUPPTimestamp](self, "updateUPPTimestamp");
  }

- (void)setPlayhead:(float)a3
{
  float v6 = v5;
  -[MTEpisode playhead](self, "playhead");
  if (*(float *)&v7 != a3)
  {
    *(float *)&double v7 = vabds_f32(v6, a3);
    if (a3 == 0.0 || *(float *)&v7 >= 0.5)
    {
      uint64_t v9 = kEpisodePlayhead;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodePlayhead, v7);
      *(float *)&double v10 = a3;
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v10));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v11, v9);

      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v9);
      -[MTEpisode updateUPPTimestamp](self, "updateUPPTimestamp");
    }
  }

- (BOOL)isCurrentPlayerItem
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
  unsigned __int8 v5 = [v3 isPlayingEpisodeUuid:v4];

  return v5;
}

- (BOOL)isEpisodeVisited
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTVisitedEpisodeManager sharedInstance](&OBJC_CLASS___MTVisitedEpisodeManager, "sharedInstance"));
  unsigned __int8 v4 = [v3 hasEndedVisitingEpisode:self];

  return v4;
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithEpisode:]( &OBJC_CLASS___MTEpisodeIdentifier,  "identifierWithEpisode:",  self);
}

- (void)updateUPPIdentifierIfNeeded
{
  uint64_t v3 = _MTLogCategoryUPPSync(self);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v7 = _MTLogCategoryUPPSync(v6);
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v40) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "updateUPPIdentifierIfNeeded",  "",  (uint8_t *)&v40,  2u);
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTUniversalPlaybackPositionDataSource mediaItemIdentifierForEpisode:]( &OBJC_CLASS___MTUniversalPlaybackPositionDataSource,  "mediaItemIdentifierForEpisode:",  self));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) != 0)
  {
    uint64_t v14 = _MTLogCategoryUPPSync(v13);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
      int v40 = 138543874;
      v41 = v16;
      __int16 v42 = 2114;
      v43 = v17;
      __int16 v44 = 2114;
      v45 = v18;
      v19 = "[UpdateUPPID] Skipping, equal metadata identifier: %{public}@, %{public}@, %{public}@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v40, 0x20u);

      goto LABEL_17;
    }
  }

  else
  {
    -[MTEpisode setMetadataIdentifier:](self, "setMetadataIdentifier:", v10);
    id v20 = -[MTEpisode metadataTimestamp](self, "metadataTimestamp");
    double v22 = v21;
    uint64_t v23 = _MTLogCategoryUPPSync(v20);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    BOOL v24 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v22 == 0.0)
    {
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
        int v40 = 138543874;
        v41 = v25;
        __int16 v42 = 2114;
        v43 = v26;
        __int16 v44 = 2114;
        v45 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[UpdateUPPID] Looking up UPP data for: %{public}@, %{public}@, %{public}@",  (uint8_t *)&v40,  0x20u);
      }

      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTEpisode managedObjectContext](self, "managedObjectContext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uppMetadataForMetadataIdentifier:](v15, "uppMetadataForMetadataIdentifier:", v10));
      uint64_t v28 = _MTLogCategoryUPPSync(v16);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      BOOL v29 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        if (v29)
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
          int v40 = 138543874;
          v41 = v30;
          __int16 v42 = 2114;
          v43 = v31;
          __int16 v44 = 2114;
          v45 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[UpdateUPPID] Setting UPP data for: %{public}@, %{public}@, %{public}@",  (uint8_t *)&v40,  0x20u);
        }

        +[MTUniversalPlaybackPositionDataSource updateEpisode:withUPPMetadata:]( &OBJC_CLASS___MTUniversalPlaybackPositionDataSource,  "updateEpisode:withUPPMetadata:",  self,  v16);
        goto LABEL_18;
      }

      if (v29)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
        int v40 = 138543874;
        v41 = v37;
        __int16 v42 = 2114;
        v43 = v38;
        __int16 v44 = 2114;
        v45 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[UpdateUPPID] Skipping, no UPP metadata: %{public}@, %{public}@, %{public}@",  (uint8_t *)&v40,  0x20u);
      }

@end