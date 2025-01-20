@interface MTTVMediaItem
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (MTPlayerItem)playerItem;
- (MTTVMediaItem)initWithMediaItem:(id)a3;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (id)reportingDelegate;
- (void)performMediaItemMetadataTransactionWithBlock:(id)a3;
- (void)setPlayerItem:(id)a3;
@end

@implementation MTTVMediaItem

- (MTTVMediaItem)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVMediaItem;
  v5 = -[MTTVMediaItem init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVMediaItem setPlayerItem:](v5, "setPlayerItem:", v4);
  }

  return v6;
}

- (id)mediaItemURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 url]);

  return v3;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTTVMediaItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 playerItem]);

    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)hasTrait:(id)a3
{
  unsigned int v4 = [a3 isEqualToString:TVPMediaItemTraitAllowsVideoPlaybackWithoutVisuals];
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
    unsigned __int8 v6 = [v5 isVideo];

    LOBYTE(v4) = v6;
  }

  return v4;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:TVPMediaItemMetadataTitle])
  {
    if ([v4 isEqualToString:TVPMediaItemMetadataSubtitle])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 subtitle]);
      goto LABEL_9;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataArtist])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 author]);
      goto LABEL_9;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataAlbum])
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 album]);
      goto LABEL_9;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataArtworkImageProxy])
    {
      unsigned __int8 v9 = objc_alloc(&OBJC_CLASS___TVImageProxy);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
      v11 = objc_alloc_init(&OBJC_CLASS___MTTVImageLoader);
      v7 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v9,  "initWithObject:imageLoader:groupType:",  v10,  v11,  0LL);

      goto LABEL_10;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContentRatingDomain])
    {
      v12 = (void *)TVPMediaItemMetadataContentRatingDomainMusic;
LABEL_15:
      v7 = v12;
      goto LABEL_10;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContentRatingIsExplicitMusic])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 episodeUuid]);
      if (v14)
      {
        v15 = (void *)v14;
        unsigned int v16 = +[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed");

        if (v16)
        {
          uint64_t v48 = 0LL;
          v49 = &v48;
          uint64_t v50 = 0x2020000000LL;
          LOBYTE(v51) = 0;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mainOrPrivateContext]);

          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472LL;
          v58[2] = sub_10001CCF4;
          v58[3] = &unk_100240558;
          id v19 = v18;
          id v59 = v19;
          v60 = self;
          v61 = &v48;
          [v19 performBlockAndWait:v58];
          v7 = (TVImageProxy *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((unsigned __int8 *)v49 + 24)));
          v20 = v59;
          goto LABEL_39;
        }
      }

      else
      {
      }
    }

    if (![v4 isEqualToString:TVPMediaItemMetadataContentRating]
      || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem")),
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 episodeUuid]),
          v22,
          v21,
          !v22))
    {
      if ([v4 isEqualToString:TVPMediaItemMetadataDateReleased]
        && (v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem")),
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 episodeUuid]),
            v27,
            v26,
            v27))
      {
        uint64_t v48 = 0LL;
        v49 = &v48;
        uint64_t v50 = 0x3032000000LL;
        v51 = sub_10001CDEC;
        v52 = sub_10001CDFC;
        id v53 = 0LL;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 mainOrPrivateContext]);

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10001CE04;
        v44[3] = &unk_100240558;
        id v30 = v29;
        id v45 = v30;
        v46 = self;
        v47 = &v48;
        [v30 performBlockAndWait:v44];
        v7 = (TVImageProxy *)(id)v49[5];
        v31 = v45;
      }

      else
      {
        if (![v4 isEqualToString:TVPMediaItemMetadataLongDescription]
          || (v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem")),
              v33 = (void *)objc_claimAutoreleasedReturnValue([v32 episodeUuid]),
              v33,
              v32,
              !v33))
        {
          if (![v4 isEqualToString:TVPMediaItemMetadataContainsClosedCaptions])
          {
            v7 = 0LL;
            goto LABEL_10;
          }

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 asset]);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "tvp_sortedSubtitleAVMediaSelectionOptions"));
          id v39 = [v38 count];

          v12 = &__kCFBooleanTrue;
          if (!v39) {
            v12 = 0LL;
          }
          goto LABEL_15;
        }

        uint64_t v48 = 0LL;
        v49 = &v48;
        uint64_t v50 = 0x3032000000LL;
        v51 = sub_10001CDEC;
        v52 = sub_10001CDFC;
        id v53 = 0LL;
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 mainOrPrivateContext]);

        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_10001CE9C;
        v40[3] = &unk_100240558;
        id v30 = v35;
        id v41 = v30;
        v42 = self;
        v43 = &v48;
        [v30 performBlockAndWait:v40];
        v7 = (TVImageProxy *)(id)v49[5];
        v31 = v41;
      }

      _Block_object_dispose(&v48, 8);
      goto LABEL_10;
    }

    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x2020000000LL;
    LOBYTE(v51) = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 mainOrPrivateContext]);

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472LL;
    v54[2] = sub_10001CD70;
    v54[3] = &unk_100240558;
    id v19 = v24;
    id v55 = v19;
    v56 = self;
    v57 = &v48;
    [v19 performBlockAndWait:v54];
    if (*((_BYTE *)v49 + 24))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v7 = (TVImageProxy *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"ATV_EXPLICIT" value:&stru_100248948 table:0]);
    }

    else
    {
      v7 = 0LL;
    }

    v20 = v55;
LABEL_39:

    _Block_object_dispose(&v48, 8);
    goto LABEL_10;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVMediaItem playerItem](self, "playerItem"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 title]);
LABEL_9:
  v7 = (TVImageProxy *)v6;

LABEL_10:
  return v7;
}

- (void)performMediaItemMetadataTransactionWithBlock:(id)a3
{
}

- (id)reportingDelegate
{
  return 0LL;
}

- (MTPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void)setPlayerItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end