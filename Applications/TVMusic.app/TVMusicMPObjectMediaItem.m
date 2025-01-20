@interface TVMusicMPObjectMediaItem
+ (double)_playedThresholdTimeForDuration:(double)a3;
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (BOOL)useBookmarks;
- (MPModelObject)modelObject;
- (MPUbiquitousPlaybackPositionEntity)bookmark;
- (NSMutableDictionary)mediaItemMetadata;
- (NSString)uniqueIdentifier;
- (TVMusicMPObjectMediaItem)initWithMPModelObject:(id)a3;
- (TVMusicMPObjectMediaItem)initWithMPModelObject:(id)a3 mediaItemMetadata:(id)a4;
- (TVPBaseMediaItem)dataItem;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (id)reportingDelegate;
- (id)storeBrowseContentItemWithStorePlatformDictionary:(id)a3;
- (unint64_t)hash;
- (void)performMediaItemMetadataTransactionWithBlock:(id)a3;
- (void)removeMediaItemMetadataForProperty:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setDataItem:(id)a3;
- (void)setMediaItemMetadata:(id)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)setModelObject:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation TVMusicMPObjectMediaItem

- (TVMusicMPObjectMediaItem)initWithMPModelObject:(id)a3 mediaItemMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVMusicMPObjectMediaItem;
  v9 = -[TVMusicMPObjectMediaItem init](&v25, "init");
  v10 = v9;
  if (v9)
  {
    p_modelObject = (id *)&v9->_modelObject;
    objc_storeStrong((id *)&v9->_modelObject, a3);
    uint64_t v12 = v8
        ? objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8))
        : objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mediaItemMetadata = v10->_mediaItemMetadata;
    v10->_mediaItemMetadata = (NSMutableDictionary *)v12;

    if (-[TVMusicMPObjectMediaItem useBookmarks](v10, "useBookmarks"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([*p_modelObject identifiers]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 universalStore]);
      id v16 = [v15 adamID];
      if (v16)
      {
        id v17 = v16;

LABEL_9:
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[MPUbiquitousPlaybackPositionEntity ubiquitousIdentifierWithStoreAdamID:]( &OBJC_CLASS___MPUbiquitousPlaybackPositionEntity,  "ubiquitousIdentifierWithStoreAdamID:",  v17));
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[MPUbiquitousPlaybackPositionController sharedUbiquitousPlaybackPositionController]( &OBJC_CLASS___MPUbiquitousPlaybackPositionController,  "sharedUbiquitousPlaybackPositionController"));
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 playbackPositionForLocalEntityIdentifier:v20]);
        bookmark = v10->_bookmark;
        v10->_bookmark = (MPUbiquitousPlaybackPositionEntity *)v22;

        goto LABEL_10;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([*p_modelObject identifiers]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 universalStore]);
      id v17 = [v19 subscriptionAdamID];

      if (v17) {
        goto LABEL_9;
      }
    }
  }

- (TVMusicMPObjectMediaItem)initWithMPModelObject:(id)a3
{
  return -[TVMusicMPObjectMediaItem initWithMPModelObject:mediaItemMetadata:]( self,  "initWithMPModelObject:mediaItemMetadata:",  a3,  0LL);
}

- (BOOL)useBookmarks
{
  return 0;
}

- (id)storeBrowseContentItemWithStorePlatformDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v14[0] = MPModelStoreBrowseContentItemRelationshipSong;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForSongsWithDetails:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForSongsWithDetails:",  1LL));
  v15[0] = v5;
  v14[1] = MPModelStoreBrowseContentItemRelationshipTVEpisode;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForTVEpisode]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForTVEpisode"));
  v15[1] = v6;
  v14[2] = MPModelStoreBrowseContentItemRelationshipMovie;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory propertySetForMovie]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "propertySetForMovie"));
  v15[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));
  id v9 = [v4 initWithProperties:0 relationships:v8];

  id v10 = [[MPModelStoreBrowseContentItemBuilder alloc] initWithRequestedPropertySet:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 modelObjectWithStorePlatformDictionary:v3 userIdentity:v11]);

  return v12;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaItemMetadataForProperty:v4]),
        v6,
        !v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem mediaItemMetadata](self, "mediaItemMetadata"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);

    if (!v7)
    {
      if ([v4 isEqualToString:TVPMediaItemMetadataStoreItemIdentifier])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
        id v11 = [v10 adamID];
LABEL_8:
        uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
LABEL_9:
        id v7 = (void *)v12;

LABEL_10:
        goto LABEL_11;
      }

      if ([v4 isEqualToString:TVPMediaItemMetadataSubscriptionStoreItemIdentifier])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
        id v11 = [v10 subscriptionAdamID];
        goto LABEL_8;
      }

      if ([v4 isEqualToString:TVPMediaItemMetadataPAFAdamID])
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 universalStore]);
        id v16 = [v15 adamID];
        if (!v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 universalStore]);
          id v16 = [v18 subscriptionAdamID];
        }

        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v16));
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v9 stringValue]);
        goto LABEL_16;
      }

      if ([v4 isEqualToString:TVPMediaItemMetadataMPArtworkCatalog])
      {
        if ((objc_opt_respondsToSelector(self->_modelObject, "artworkCatalog") & 1) != 0)
        {
          v20 = (TVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue(-[MPModelObject artworkCatalog](self->_modelObject, "artworkCatalog"));
LABEL_26:
          id v7 = v20;
          goto LABEL_11;
        }
      }

      else
      {
        if ([v4 isEqualToString:TVPMediaItemMetadataArtworkImageProxy])
        {
          v20 = -[TVMusicMPModelImageProxy initWithMPObject:]( objc_alloc(&OBJC_CLASS___TVMusicMPModelImageProxy),  "initWithMPObject:",  self->_modelObject);
          goto LABEL_26;
        }

        if ([v4 isEqualToString:@"TVMusicMediaItemMetadataMPIdentifierSet"])
        {
          v20 = (TVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
          goto LABEL_26;
        }

        if ([v4 isEqualToString:@"TVMusicMediaItemMetadataMPModelObject"])
        {
          v20 = (TVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  self->_modelObject));
          goto LABEL_26;
        }

        if ([v4 isEqualToString:@"TVMusicMediaItemMetadataSagaID"])
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personalizedStore]);
          uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 cloudID]));
          goto LABEL_9;
        }

        if ([v4 isEqualToString:TVPMediaItemMetadataBookmarkNetTime])
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem bookmark](self, "bookmark"));
          [v21 bookmarkTime];
          double v23 = v22;

          if (v23 > 0.0)
          {
            id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem bookmark](self, "bookmark"));
            [v9 bookmarkTime];
            uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
LABEL_16:
            id v7 = (void *)v19;
            goto LABEL_10;
          }
        }
      }

      id v7 = 0LL;
    }
  }

- (id)mediaItemURL
{
  return 0LL;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaItemMetadataForProperty:@"TVMusicMediaItemMetadataMPIdentifierSet"]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelObject identifiers](self->_modelObject, "identifiers"));
    unsigned __int8 v6 = [v5 intersectsSet:v4];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:TVPMediaItemTraitSupportsBookmarks])
  {
    unsigned __int8 v5 = self->_bookmark != 0LL;
  }

  else if ([v4 isEqualToString:TVPMediaItemTraitForceSkipItemSkippingBehavior])
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPObjectMediaItem mediaItemMetadataForProperty:]( self,  "mediaItemMetadataForProperty:",  @"TVMusicMediaItemMetadataShouldSkipVideo"));
    unsigned __int8 v5 = [v6 BOOLValue];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)reportingDelegate
{
  return 0LL;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));

  if (!v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___TVPBaseMediaItem);
    -[TVMusicMPObjectMediaItem setDataItem:](self, "setDataItem:", v9);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));
  [v10 setMediaItemMetadata:v7 forProperty:v6];
}

- (void)removeMediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));
  [v5 removeMediaItemMetadataForProperty:v4];
}

- (void)performMediaItemMetadataTransactionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));

  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___TVPBaseMediaItem);
    -[TVMusicMPObjectMediaItem setDataItem:](self, "setDataItem:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem dataItem](self, "dataItem"));
  [v7 performMediaItemMetadataTransactionWithBlock:v4];
}

+ (double)_playedThresholdTimeForDuration:(double)a3
{
  double v3 = 0.0;
  if (TVPDurationUnknown != a3 && a3 > 0.0 && TVPDurationIndefinite != a3)
  {
    if (a3 >= 10.0)
    {
      if (a3 >= 1200.0)
      {
        if (a3 >= 3900.0) {
          unint64_t v6 = 0xC06E000000000000LL;
        }
        else {
          unint64_t v6 = 0xC044000000000000LL;
        }
        double v5 = *(double *)&v6;
      }

      else
      {
        double v5 = -10.0;
      }

      return a3 + v5;
    }

    else
    {
      return a3;
    }
  }

  return v3;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem modelObject](self, "modelObject"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    unint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 contentItemID]);
    id v7 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v6;

    uniqueIdentifier = self->_uniqueIdentifier;
  }

  return uniqueIdentifier;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem uniqueIdentifier](self, "uniqueIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVMusicMPObjectMediaItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPObjectMediaItem uniqueIdentifier](self, "uniqueIdentifier"));
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  return v10;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
}

- (NSMutableDictionary)mediaItemMetadata
{
  return self->_mediaItemMetadata;
}

- (void)setMediaItemMetadata:(id)a3
{
}

- (TVPBaseMediaItem)dataItem
{
  return self->_dataItem;
}

- (void)setDataItem:(id)a3
{
}

- (MPUbiquitousPlaybackPositionEntity)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (void).cxx_destruct
{
}

@end