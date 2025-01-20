@interface TVMusicMPSongMediaItem
- (BOOL)hasTrait:(id)a3;
- (BOOL)isUnknownItemType;
- (BOOL)useBookmarks;
- (NSString)description;
- (NSString)unknownItemDescription;
- (TVMusicMPSongMediaItem)initWithSong:(id)a3;
- (TVMusicMPSongMediaItem)initWithSong:(id)a3 mediaItemMetadata:(id)a4;
- (TVMusicMPSongMediaItem)initWithStorePlatformDictionary:(id)a3;
- (id)mediaItemMetadataForProperty:(id)a3;
- (void)setUnknownItemDescription:(id)a3;
- (void)setUnknownItemType:(BOOL)a3;
@end

@implementation TVMusicMPSongMediaItem

- (TVMusicMPSongMediaItem)initWithSong:(id)a3 mediaItemMetadata:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicMPSongMediaItem;
  return -[TVMusicMPObjectMediaItem initWithMPModelObject:mediaItemMetadata:]( &v5,  "initWithMPModelObject:mediaItemMetadata:",  a3,  a4);
}

- (TVMusicMPSongMediaItem)initWithSong:(id)a3
{
  return -[TVMusicMPSongMediaItem initWithSong:mediaItemMetadata:](self, "initWithSong:mediaItemMetadata:", a3, 0LL);
}

- (TVMusicMPSongMediaItem)initWithStorePlatformDictionary:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPObjectMediaItem storeBrowseContentItemWithStorePlatformDictionary:]( self,  "storeBrowseContentItemWithStorePlatformDictionary:",  a3));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 song]);
  v6 = -[TVMusicMPSongMediaItem initWithSong:](self, "initWithSong:", v5);

  return v6;
}

- (BOOL)useBookmarks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
  if ([v3 hasVideo])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playbackPosition]);
    unsigned __int8 v6 = [v5 shouldRememberBookmarkTime];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___TVMusicMPSongMediaItem;
  id v5 = -[TVMusicMPObjectMediaItem mediaItemMetadataForProperty:](&v59, "mediaItemMetadataForProperty:", v4);
  unsigned __int8 v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    if ([v4 isEqualToString:TVPMediaItemMetadataTitle])
    {
      if (!-[TVMusicMPSongMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 title]);
        goto LABEL_13;
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem unknownItemDescription](self, "unknownItemDescription"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"CurrentlyPlayingTitle" value:&stru_100279068 table:0]);
LABEL_13:
        unsigned __int8 v6 = v9;
LABEL_14:

        goto LABEL_15;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager defaultPlayer](&OBJC_CLASS___TVMusicPlayerManager, "defaultPlayer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 playQueue]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 audioRoute]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 routeName]);
      goto LABEL_21;
    }

    if ([v4 isEqualToString:@"TVMusicMediaItemMetadataArtistID"])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v10 artist]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 universalStore]);
      id v13 = [v12 adamID];
      if (!v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 universalStore]);
        id v13 = [v15 subscriptionAdamID];
      }

      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v13));
      goto LABEL_13;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataDuration])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      [v8 duration];
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      goto LABEL_13;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataArtist])
    {
      if (-[TVMusicMPSongMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem unknownItemDescription](self, "unknownItemDescription"));
        v8 = v17;
        if (v17)
        {
          v9 = v17;
          goto LABEL_13;
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v18 localizedStringForKey:@"PlayingTitle" value:&stru_100279068 table:0]);
        goto LABEL_35;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v8 artist]);
      goto LABEL_26;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataAlbum])
    {
      if (-[TVMusicMPSongMediaItem isUnknownItemType](self, "isUnknownItemType"))
      {
        unsigned __int8 v6 = &stru_100279068;
        goto LABEL_15;
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 album]);
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v18 title]);
      goto LABEL_35;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataTotalTrackCount])
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 album]);
      unsigned int v25 = [v24 hasLoadedValueForKey:MPModelPropertyAlbumTrackCount];

      if (v25)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v8 album]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 trackCount]));
        goto LABEL_35;
      }

      goto LABEL_74;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataTrackNumber])
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v27 = [v26 hasLoadedValueForKey:MPModelPropertySongTrackNumber];

      if (v27)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 trackNumber]));
        goto LABEL_13;
      }

      goto LABEL_74;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataGenre])
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v29 = [v28 hasLoadedValueForKey:MPModelRelationshipSongGenre];

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 genre]);
        unsigned int v32 = [v31 hasLoadedValueForKey:MPModelPropertyGenreName];

        if (v32)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
          v21 = (void *)objc_claimAutoreleasedReturnValue([v8 genre]);
LABEL_26:
          v18 = v21;
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 name]);
LABEL_35:
          unsigned __int8 v6 = (__CFString *)v22;
          goto LABEL_36;
        }
      }

      goto LABEL_74;
    }

    if ([v4 isEqualToString:@"TVMusicMediaItemMetadataUserLyrics"])
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v34 = [v33 hasLoadedValueForKey:MPModelRelationshipSongLyrics];

      if (v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lyrics]);
        unsigned int v37 = [v36 hasLoadedValueForKey:MPModelPropertyLyricsText];

        if (v37)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v8 lyrics]);
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v18 text]);
          goto LABEL_35;
        }
      }

      goto LABEL_74;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataStoreLyricsAvailable])
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v39 = [v38 hasLoadedValueForKey:MPModelRelationshipSongLyrics];

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 lyrics]);
        unsigned int v42 = [v41 hasLoadedValueForKey:MPModelPropertyLyricsHasStoreLyrics];

        if (v42)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
          v18 = (void *)objc_claimAutoreleasedReturnValue([v8 lyrics]);
          uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v18 hasStoreLyrics]));
          goto LABEL_35;
        }
      }

      goto LABEL_74;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataMediaType])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v43 = [v8 hasVideo];
      v44 = (id *)&TVPMediaTypeMusicVideo;
      if (!v43) {
        v44 = (id *)&TVPMediaTypeMusic;
      }
      v9 = (__CFString *)*v44;
      goto LABEL_13;
    }

    if ([v4 isEqualToString:TVPMediaItemMetadataContentRatingDomain])
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
      unsigned int v46 = [v45 isExplicitSong];

      if (!v46) {
        goto LABEL_74;
      }
      v47 = (__CFString *)TVPMediaItemMetadataContentRatingDomainMusic;
      goto LABEL_62;
    }

    if (![v4 isEqualToString:TVPMediaItemMetadataContentRatingIsExplicitMusic])
    {
      if (![v4 isEqualToString:TVPMediaItemMetadataIsUnknownItem])
      {
        if (![v4 isEqualToString:TVPMediaItemMetadataDateReleased])
        {
          if ([v4 isEqualToString:TVPMediaItemMetadataIsInLibrary])
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
            id v58 = [v8 isLibraryAdded];
          }

          else
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
            id v58 = [v8 isArtistUploadedContent];
          }

          v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v58));
          goto LABEL_13;
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
        v51 = (void *)objc_claimAutoreleasedReturnValue([v50 album]);
        unsigned int v52 = [v51 hasLoadedValueForKey:MPModelPropertyAlbumReleaseDateComponents];

        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 album]);
          v8 = (void *)objc_claimAutoreleasedReturnValue([v54 releaseDateComponents]);

          if ((uint64_t)[v8 year] <= 0)
          {
            unsigned __int8 v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 date]);

            if (!v6) {
              goto LABEL_14;
            }
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
          v55 = (void *)objc_claimAutoreleasedReturnValue([v8 date]);
          v56 = v55;
          if (v55) {
            id v57 = v55;
          }
          else {
            id v57 = (id)objc_claimAutoreleasedReturnValue([v18 dateFromComponents:v8]);
          }
          v19 = v57;

          uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v19,  2LL,  0LL));
LABEL_21:
          unsigned __int8 v6 = (__CFString *)v20;

LABEL_36:
          goto LABEL_14;
        }

- (BOOL)hasTrait:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicMPSongMediaItem;
  id v4 = a3;
  unsigned __int8 v5 = -[TVMusicMPObjectMediaItem hasTrait:](&v9, "hasTrait:", v4);
  unsigned int v6 = objc_msgSend( v4,  "isEqualToString:",  TVPMediaItemTraitAllowsVideoPlaybackWithoutVisuals,  v9.receiver,  v9.super_class);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
    unsigned __int8 v5 = [v7 hasVideo];
  }

  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPSongMediaItem song](self, "song"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 artist]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Song: %@ by %@",  v4,  v7));

  return (NSString *)v8;
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

- (void).cxx_destruct
{
}

@end