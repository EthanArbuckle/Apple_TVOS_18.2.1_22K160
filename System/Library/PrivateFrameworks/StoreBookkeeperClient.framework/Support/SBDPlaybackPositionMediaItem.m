@interface SBDPlaybackPositionMediaItem
- (NSString)identifier;
- (SBCPlaybackPositionEntity)entity;
- (SBDPlaybackPositionMediaItem)initWithUbiquitousIdentifier:(id)a3 inLibrary:(id)a4;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
@end

@implementation SBDPlaybackPositionMediaItem

- (SBDPlaybackPositionMediaItem)initWithUbiquitousIdentifier:(id)a3 inLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SBDPlaybackPositionMediaItem;
  v9 = -[SBDPlaybackPositionMediaItem init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uppDatabase]);
    uint64_t v12 = MSVTCCIdentityForCurrentProcess();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue( [v11 readUbiquitousDatabaseMetadataValuesWithClientIdentity:v13 identifier:v10->_identifier]);
    entity = v10->_entity;
    v10->_entity = (SBCPlaybackPositionEntity *)v14;
  }

  return v10;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = SBKUniversalPlaybackPositionMediaItemPropertySubscriptionStoreID;
    uint64_t v25 = SBKUniversalPlaybackPositionMediaItemPropertyPlayCount;
    uint64_t v24 = SBKUniversalPlaybackPositionMediaItemPropertyBookmarkTime;
    uint64_t v23 = SBKUniversalPlaybackPositionMediaItemPropertyHasBeenPlayed;
    uint64_t v22 = SBKUniversalPlaybackPositionMediaItemPropertyMetadataTimestamp;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
        if ([v14 isEqualToString:v12])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionMediaItem entity](self, "entity"));
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 ubiquitousIdentifier]);
          goto LABEL_15;
        }

        if ([v14 isEqualToString:v25])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionMediaItem entity](self, "entity"));
          uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v15 userPlayCount]));
          goto LABEL_15;
        }

        if ([v14 isEqualToString:v24])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionMediaItem entity](self, "entity"));
          [v15 bookmarkTime];
          double v18 = v17 / 1000.0;
          goto LABEL_12;
        }

        if ([v14 isEqualToString:v23])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionMediaItem entity](self, "entity"));
          uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v15 hasBeenPlayed]));
          goto LABEL_15;
        }

        if ([v14 isEqualToString:v22])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionMediaItem entity](self, "entity"));
          [v15 bookmarkTimestamp];
LABEL_12:
          uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
LABEL_15:
          v19 = (void *)v16;

          goto LABEL_16;
        }

        v19 = 0LL;
LABEL_16:
        unsigned __int8 v26 = 0;
        v7[2](v7, v14, v19, &v26);
        int v20 = v26;

        if (v20) {
          goto LABEL_23;
        }
        v13 = (char *)v13 + 1;
      }

      while (v10 != v13);
      id v21 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v10 = v21;
    }

    while (v21);
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (SBCPlaybackPositionEntity)entity
{
  return self->_entity;
}

- (void).cxx_destruct
{
}

@end