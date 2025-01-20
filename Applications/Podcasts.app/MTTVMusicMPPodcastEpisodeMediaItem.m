@interface MTTVMusicMPPodcastEpisodeMediaItem
+ (double)_playedThresholdTimeForDuration:(double)a3;
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (BOOL)isUnknownItemType;
- (MPCPlayerResponseItem)responseItem;
- (MPModelPodcastEpisode)podcastEpisode;
- (MTTVMusicMPPodcastEpisodeMediaItem)initWithPlayerResponseItem:(id)a3;
- (MTTVMusicMPPodcastEpisodeMediaItem)initWithPlayerResponseItem:(id)a3 mediaItemMetadata:(id)a4;
- (NSDictionary)mediaItemMetadata;
- (NSString)unknownItemDescription;
- (TVPBaseMediaItem)mediaItem;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (id)reportingDelegate;
- (void)performMediaItemMetadataTransactionWithBlock:(id)a3;
- (void)removeMediaItemMetadataForProperty:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setMediaItemMetadata:(id)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)setPodcastEpisode:(id)a3;
- (void)setResponseItem:(id)a3;
- (void)setUnknownItemDescription:(id)a3;
- (void)setUnknownItemType:(BOOL)a3;
@end

@implementation MTTVMusicMPPodcastEpisodeMediaItem

- (MTTVMusicMPPodcastEpisodeMediaItem)initWithPlayerResponseItem:(id)a3 mediaItemMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTTVMusicMPPodcastEpisodeMediaItem;
  v9 = -[MTTVMusicMPPodcastEpisodeMediaItem init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseItem, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 metadataObject]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 podcastEpisode]);
    podcastEpisode = v10->_podcastEpisode;
    v10->_podcastEpisode = (MPModelPodcastEpisode *)v12;

    objc_storeStrong((id *)&v10->_mediaItemMetadata, a4);
    v14 = objc_alloc_init(&OBJC_CLASS___TVPBaseMediaItem);
    mediaItem = v10->_mediaItem;
    v10->_mediaItem = v14;
  }

  return v10;
}

- (MTTVMusicMPPodcastEpisodeMediaItem)initWithPlayerResponseItem:(id)a3
{
  return -[MTTVMusicMPPodcastEpisodeMediaItem initWithPlayerResponseItem:mediaItemMetadata:]( self,  "initWithPlayerResponseItem:mediaItemMetadata:",  a3,  0LL);
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPPodcastEpisodeMediaItem mediaItemMetadata](self, "mediaItemMetadata"));

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPPodcastEpisodeMediaItem mediaItemMetadata](self, "mediaItemMetadata")),
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]),
        v6,
        !v7))
  {
    if ([v4 isEqualToString:TVPMediaItemMetadataTitle])
    {
      if (-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v9 = v8;
        v10 = @"NOW_PLAYING_CURRENTLY_PLAYING_TITLE";
LABEL_6:
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_100248948 table:0]);
LABEL_7:
        id v7 = v11;
LABEL_8:

        goto LABEL_15;
      }

      uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue(-[MPModelPodcastEpisode title](self->_podcastEpisode, "title"));
LABEL_14:
      id v7 = (__CFString *)v12;
      goto LABEL_15;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataArtworkImageProxy])
    {
      uint64_t v12 = -[MTTVMusicMPModelImageProxy initWithMPObject:]( objc_alloc(&OBJC_CLASS___MTTVMusicMPModelImageProxy),  "initWithMPObject:",  self->_podcastEpisode);
      goto LABEL_14;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataDuration])
    {
      -[MPModelPodcastEpisode duration](self->_podcastEpisode, "duration");
      uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      goto LABEL_14;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataArtist])
    {
      if (-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        uint64_t v14 = objc_claimAutoreleasedReturnValue(-[MTTVMusicMPPodcastEpisodeMediaItem unknownItemDescription](self, "unknownItemDescription"));
        id v9 = (id)v14;
        v15 = &stru_100248948;
        if (v14) {
          v15 = (__CFString *)v14;
        }
        v11 = v15;
      }

      else
      {
        id v9 = (id)objc_claimAutoreleasedReturnValue(-[MPModelPodcastEpisode author](self->_podcastEpisode, "author"));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 name]);
      }

      goto LABEL_7;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataAlbum])
    {
      if (-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        id v7 = &stru_100248948;
        goto LABEL_15;
      }

      id v9 = (id)objc_claimAutoreleasedReturnValue(-[MPModelPodcastEpisode podcast](self->_podcastEpisode, "podcast"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 title]);
      goto LABEL_7;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContentRating])
    {
      if (-[MPModelPodcastEpisode isExplicitEpisode](self->_podcastEpisode, "isExplicitEpisode")
        && !-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v9 = v8;
        v10 = @"ATV_EXPLICIT";
        goto LABEL_6;
      }

      goto LABEL_34;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataLongDescription])
    {
      uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue( -[MPModelPodcastEpisode descriptionText]( self->_podcastEpisode,  "descriptionText"));
      goto LABEL_14;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContainsClosedCaptions])
    {
LABEL_34:
      id v7 = 0LL;
      goto LABEL_15;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataMPArtworkCatalog])
    {
      uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue( -[MPModelPodcastEpisode artworkCatalog]( self->_podcastEpisode,  "artworkCatalog"));
      goto LABEL_14;
    }

    if ([v4 isEqualToString:@"TVMusicMediaItemMetadataMPModelObject"])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPPodcastEpisodeMediaItem podcastEpisode](self, "podcastEpisode"));
      id v17 = objc_alloc(&OBJC_CLASS___MPModelGenericObject);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 identifiers]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100059BC8;
      v19[3] = &unk_100242128;
      id v20 = v16;
      id v9 = v16;
      id v7 = (__CFString *)[v17 initWithIdentifiers:v18 block:v19];

      goto LABEL_8;
    }

    if ([v4 isEqualToString:@"TVMusicMediaItemMetadataMPCResponseItem"])
    {
      uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue(-[MTTVMusicMPPodcastEpisodeMediaItem responseItem](self, "responseItem"));
      goto LABEL_14;
    }

    if ([v4 isEqualToString:@"TVMusicMediaItemMetadataSagaID"])
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[MPModelPodcastEpisode identifiers](self->_podcastEpisode, "identifiers"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v9 storeCloudID]));
      goto LABEL_7;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContentRatingDomain])
    {
      if (-[MPModelPodcastEpisode isExplicitEpisode](self->_podcastEpisode, "isExplicitEpisode")
        && !-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        uint64_t v12 = (MTTVMusicMPModelImageProxy *)TVPMediaItemMetadataContentRatingDomainMusic;
        goto LABEL_14;
      }

      goto LABEL_34;
    }

    if (![v4 isEqualToString:TVPMediaItemMetadataContentRatingIsExplicitMusic])
    {
      if ([v4 isEqualToString:TVPMediaItemMetadataIsUnknownItem])
      {
        uint64_t v12 = (MTTVMusicMPModelImageProxy *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType]( self,  "isUnknownItemType")));
        goto LABEL_14;
      }

      goto LABEL_34;
    }

    if (-[MTTVMusicMPPodcastEpisodeMediaItem isUnknownItemType](self, "isUnknownItemType")) {
      id v7 = 0LL;
    }
    else {
      id v7 = (__CFString *)&__kCFBooleanTrue;
    }
  }

- (id)mediaItemURL
{
  return 0LL;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4 = (MTTVMusicMPPodcastEpisodeMediaItem *)a3;
  v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVMusicMPPodcastEpisodeMediaItem mediaItemMetadataForProperty:]( v4,  "mediaItemMetadataForProperty:",  @"TVMusicMediaItemMetadataMPIdentifierSet"));
    if (v6
      && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPModelPodcastEpisode identifiers](self->_podcastEpisode, "identifiers")),
          unsigned __int8 v8 = [v7 hasCommonIdentifierWithIdentifierSet:v6],
          v7,
          (v8 & 1) != 0))
    {
      unsigned __int8 v9 = 1;
    }

    else
    {
      unsigned __int8 v9 = -[TVPBaseMediaItem isEqualToMediaItem:](self->_mediaItem, "isEqualToMediaItem:", v5);
    }
  }

  return v9;
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  else {
    unsigned __int8 v5 = -[TVPBaseMediaItem hasTrait:](self->_mediaItem, "hasTrait:", v4);
  }

  return v5;
}

- (id)reportingDelegate
{
  return 0LL;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
}

- (void)removeMediaItemMetadataForProperty:(id)a3
{
}

- (void)performMediaItemMetadataTransactionWithBlock:(id)a3
{
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

- (MPModelPodcastEpisode)podcastEpisode
{
  return self->_podcastEpisode;
}

- (void)setPodcastEpisode:(id)a3
{
}

- (BOOL)isUnknownItemType
{
  return self->_unknownItemType;
}

- (void)setUnknownItemType:(BOOL)a3
{
  self->_unknownItemType = a3;
}

- (NSString)unknownItemDescription
{
  return self->_unknownItemDescription;
}

- (void)setUnknownItemDescription:(id)a3
{
}

- (MPCPlayerResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
}

- (NSDictionary)mediaItemMetadata
{
  return self->_mediaItemMetadata;
}

- (void)setMediaItemMetadata:(id)a3
{
}

- (TVPBaseMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end