@interface ACCMediaLibraryUpdateItem
- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 dict:(id)a4;
- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5;
- (BOOL)local;
- (BOOL)partOfCompilation;
- (NSString)albumArtist;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)composer;
- (NSString)genre;
- (NSString)mediaLibraryUID;
- (NSString)revision;
- (NSString)title;
- (id)copyDict;
- (id)debugDescription;
- (id)description;
- (int)rating;
- (int)type;
- (unint64_t)albumArtistPersistentID;
- (unint64_t)albumPersistentID;
- (unint64_t)artistPersistentID;
- (unint64_t)composerPersistentID;
- (unint64_t)genrePersistentID;
- (unint64_t)persistentID;
- (unint64_t)validMask;
- (unsigned)albumDiscCount;
- (unsigned)albumDiscNumber;
- (unsigned)albumTrackCount;
- (unsigned)albumTrackNumber;
- (unsigned)chapterCount;
- (unsigned)duration;
- (void)copyDict;
- (void)fillStruct:(id *)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumArtistPersistentID:(unint64_t)a3;
- (void)setAlbumDiscCount:(unsigned __int16)a3;
- (void)setAlbumDiscNumber:(unsigned __int16)a3;
- (void)setAlbumPersistentID:(unint64_t)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setAlbumTrackCount:(unsigned __int16)a3;
- (void)setAlbumTrackNumber:(unsigned __int16)a3;
- (void)setArtist:(id)a3;
- (void)setArtistPersistentID:(unint64_t)a3;
- (void)setChapterCount:(unsigned __int16)a3;
- (void)setComposer:(id)a3;
- (void)setComposerPersistentID:(unint64_t)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setGenre:(id)a3;
- (void)setGenrePersistentID:(unint64_t)a3;
- (void)setLocal:(BOOL)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setPartOfCompilation:(BOOL)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setRating:(int)a3;
- (void)setRevision:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ACCMediaLibraryUpdateItem

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdateItem;
  v11 = -[ACCMediaLibraryUpdateItem init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1LL;
    title = v12->_title;
    v12->_title = 0LL;

    *(void *)&v12->_type = 0x500000004LL;
    v12->_duration = 0;
    albumTitle = v12->_albumTitle;
    v12->_albumPersistentID = 0LL;
    v12->_albumTitle = 0LL;

    artist = v12->_artist;
    v12->_artistPersistentID = 0LL;
    v12->_artist = 0LL;
    *(void *)&v12->_albumTrackNumber = 0LL;

    albumArtist = v12->_albumArtist;
    v12->_albumArtistPersistentID = 0LL;
    v12->_albumArtist = 0LL;

    genre = v12->_genre;
    v12->_genrePersistentID = 0LL;
    v12->_genre = 0LL;

    composer = v12->_composer;
    v12->_composerPersistentID = 0LL;
    v12->_composer = 0LL;

    *(_WORD *)&v12->_partOfCompilation = 0;
    v12->_chapterCount = 0;
  }

  return v12;
}

- (ACCMediaLibraryUpdateItem)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdateItem;
  id v9 = -[ACCMediaLibraryUpdateItem init](&v72, "init");
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_100200A40;

    v10->_persistentID = 0LL;
    title = v10->_title;
    v10->_title = 0LL;

    *(void *)&v10->_type = 0x500000004LL;
    v10->_duration = 0;
    albumTitle = v10->_albumTitle;
    v10->_albumPersistentID = 0LL;
    v10->_albumTitle = 0LL;

    artist = v10->_artist;
    v10->_artistPersistentID = 0LL;
    v10->_artist = 0LL;
    *(void *)&v10->_albumTrackNumber = 0LL;

    albumArtist = v10->_albumArtist;
    v10->_albumArtistPersistentID = 0LL;
    v10->_albumArtist = 0LL;

    genre = v10->_genre;
    v10->_genrePersistentID = 0LL;
    v10->_genre = 0LL;

    composer = v10->_composer;
    v10->_composerPersistentID = 0LL;
    v10->_composer = 0LL;

    *(_WORD *)&v10->_partOfCompilation = 0;
    v10->_chapterCount = 0;
    v10->_validMask = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"]);

    if (v18)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"]);
      objc_super v20 = v10->_revision;
      v10->_revision = (NSString *)v19;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemPersistentID"]);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemPersistentID"]);
      v10->_persistentID = (unint64_t)[v22 unsignedLongLongValue];

      v10->_validMask |= 1uLL;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemTitle"]);

    if (v23)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemTitle"]);
      v25 = v10->_title;
      v10->_title = (NSString *)v24;

      v10->_validMask |= 2uLL;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemType"]);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemType"]);
      v10->_type = [v27 unsignedCharValue];

      v10->_validMask |= 4uLL;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemRating"]);

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemRating"]);
      v10->_rating = [v29 unsignedCharValue];

      v10->_validMask |= 8uLL;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"]);

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue( [v8 objectForKey:@"ACCMediaLibraryUpdateItemPlaybackDurationInMilliseconds"]);
      v10->_duration = [v31 unsignedLongValue];

      v10->_validMask |= 0x10uLL;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumPersistentID"]);

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumPersistentID"]);
      v10->_albumPersistentID = (unint64_t)[v33 unsignedLongLongValue];

      v10->_validMask |= 0x20uLL;
    }

    v34 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTitle"]);

    if (v34)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTitle"]);
      v36 = v10->_albumTitle;
      v10->_albumTitle = (NSString *)v35;

      v10->_validMask |= 0x40uLL;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackNumber"]);

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackNumber"]);
      v10->_albumTrackNumber = (unsigned __int16)[v38 unsignedShortValue];

      v10->_validMask |= 0x80uLL;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackCount"]);

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumTrackCount"]);
      v10->_albumTrackCount = (unsigned __int16)[v40 unsignedShortValue];

      v10->_validMask |= 0x100uLL;
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscNumber"]);

    if (v41)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscNumber"]);
      v10->_albumDiscNumber = (unsigned __int16)[v42 unsignedShortValue];

      v10->_validMask |= 0x200uLL;
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscCount"]);

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumDiscCount"]);
      v10->_albumDiscCount = (unsigned __int16)[v44 unsignedShortValue];

      v10->_validMask |= 0x400uLL;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemArtistPersistentID"]);

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemArtistPersistentID"]);
      v10->_artistPersistentID = (unint64_t)[v46 unsignedLongLongValue];

      v10->_validMask |= 0x800uLL;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemArtist"]);

    if (v47)
    {
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemArtist"]);
      v49 = v10->_artist;
      v10->_artist = (NSString *)v48;

      v10->_validMask |= 0x1000uLL;
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtistPersistentID"]);

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtistPersistentID"]);
      v10->_albumArtistPersistentID = (unint64_t)[v51 unsignedLongLongValue];

      v10->_validMask |= 0x2000uLL;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtist"]);

    if (v52)
    {
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemAlbumArtist"]);
      v54 = v10->_albumArtist;
      v10->_albumArtist = (NSString *)v53;

      v10->_validMask |= 0x4000uLL;
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemGenrePersistentID"]);

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemGenrePersistentID"]);
      v10->_genrePersistentID = (unint64_t)[v56 unsignedLongLongValue];

      v10->_validMask |= 0x8000uLL;
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemGenre"]);

    if (v57)
    {
      uint64_t v58 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemGenre"]);
      v59 = v10->_genre;
      v10->_genre = (NSString *)v58;

      v10->_validMask |= 0x10000uLL;
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemComposerPersistentID"]);

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemComposerPersistentID"]);
      v10->_composerPersistentID = (unint64_t)[v61 unsignedLongLongValue];

      v10->_validMask |= 0x20000uLL;
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemComposer"]);

    if (v62)
    {
      uint64_t v63 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemComposer"]);
      v64 = v10->_composer;
      v10->_composer = (NSString *)v63;

      v10->_validMask |= 0x40000uLL;
    }

    v65 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemIsPartOfCompilation"]);

    if (v65)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemIsPartOfCompilation"]);
      v10->_partOfCompilation = [v66 unsignedCharValue] != 0;

      v10->_validMask |= 0x80000uLL;
    }

    v67 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemIsLocal"]);

    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemIsLocal"]);
      v10->_local = [v68 unsignedCharValue] != 0;

      v10->_validMask |= 0x2000000uLL;
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemChapterCount"]);

    if (v69)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"ACCMediaLibraryUpdateItemChapterCount"]);
      v10->_chapterCount = (unsigned __int16)[v70 unsignedShortValue];

      v10->_validMask |= 0x8000000uLL;
    }
  }

  return v10;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCMediaLibraryUpdateItem>[%@:%llu valid=%llxh '%@' mediaType=%d local=%d]",  self->_mediaLibraryUID,  self->_persistentID,  self->_validMask,  self->_title,  self->_type,  self->_local);
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCMediaLibraryUpdateItem description](self, "description"));
  id v4 = -[ACCMediaLibraryUpdateItem copyDict](self, "copyDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n    %@", v3, v4));

  return v5;
}

- (id)copyDict
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  p_unint64_t validMask = (uint64_t *)&self->_validMask;
  unint64_t validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_persistentID));
    -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v10,  @"ACCMediaLibraryUpdateItemPersistentID");

    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }

  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }

  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  self->_title,  @"ACCMediaLibraryUpdateItemTitle");
  unint64_t validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }

- (void)fillStruct:(id *)a3
{
  *(_OWORD *)&a3->var17 = 0u;
  *(_OWORD *)&a3->var19 = 0u;
  *(_OWORD *)&a3->var13 = 0u;
  *(_OWORD *)&a3->var15 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  *(_OWORD *)&a3->var8 = 0u;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 1) != 0)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_3:
      if ((validMask & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }

  else if ((validMask & 2) == 0)
  {
    goto LABEL_3;
  }

  title = self->_title;
  if (title)
  {
    title = -[NSString UTF8String](title, "UTF8String");
    unint64_t validMask = self->_validMask;
  }

  a3->var2 = (char *)title;
  a3->var0 |= 2u;
  if ((validMask & 4) == 0)
  {
LABEL_4:
    if ((validMask & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setRevision:(id)a3
{
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_unint64_t validMask = v3;
}

- (void)setTitle:(id)a3
{
  self->_validMask |= 2uLL;
}

- (void)setType:(int)a3
{
  self->_type = a3;
  self->_validMask |= 4uLL;
}

- (void)setRating:(int)a3
{
  self->_rating = a3;
  self->_validMask |= 8uLL;
}

- (void)setDuration:(unsigned int)a3
{
  self->_duration = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setAlbumPersistentID:(unint64_t)a3
{
  self->_albumPersistentID = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setAlbumTitle:(id)a3
{
  self->_validMask |= 0x40uLL;
}

- (void)setAlbumTrackNumber:(unsigned __int16)a3
{
  self->_albumTrackNumber = a3;
  self->_validMask |= 0x80uLL;
}

- (void)setAlbumTrackCount:(unsigned __int16)a3
{
  self->_albumTrackCount = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setAlbumDiscNumber:(unsigned __int16)a3
{
  self->_albumDiscNumber = a3;
  self->_validMask |= 0x200uLL;
}

- (void)setAlbumDiscCount:(unsigned __int16)a3
{
  self->_albumDiscCount = a3;
  self->_validMask |= 0x400uLL;
}

- (void)setArtistPersistentID:(unint64_t)a3
{
  self->_artistPersistentID = a3;
  self->_validMask |= 0x800uLL;
}

- (void)setArtist:(id)a3
{
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtistPersistentID:(unint64_t)a3
{
  self->_albumArtistPersistentID = a3;
  self->_validMask |= 0x2000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  self->_validMask |= 0x4000uLL;
}

- (void)setGenrePersistentID:(unint64_t)a3
{
  self->_genrePersistentID = a3;
  self->_validMask |= 0x8000uLL;
}

- (void)setGenre:(id)a3
{
  self->_validMask |= 0x10000uLL;
}

- (void)setComposerPersistentID:(unint64_t)a3
{
  self->_composerPersistentID = a3;
  self->_validMask |= 0x20000uLL;
}

- (void)setComposer:(id)a3
{
  self->_validMask |= 0x40000uLL;
}

- (void)setPartOfCompilation:(BOOL)a3
{
  self->_partOfCompilation = a3;
  self->_validMask |= 0x80000uLL;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
  self->_validMask |= 0x2000000uLL;
}

- (void)setChapterCount:(unsigned __int16)a3
{
  self->_chapterCount = a3;
  self->_validMask |= 0x8000000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)title
{
  return self->_title;
}

- (int)type
{
  return self->_type;
}

- (int)rating
{
  return self->_rating;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unint64_t)albumPersistentID
{
  return self->_albumPersistentID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (unsigned)albumTrackNumber
{
  return self->_albumTrackNumber;
}

- (unsigned)albumTrackCount
{
  return self->_albumTrackCount;
}

- (unsigned)albumDiscNumber
{
  return self->_albumDiscNumber;
}

- (unsigned)albumDiscCount
{
  return self->_albumDiscCount;
}

- (unint64_t)artistPersistentID
{
  return self->_artistPersistentID;
}

- (NSString)artist
{
  return self->_artist;
}

- (unint64_t)albumArtistPersistentID
{
  return self->_albumArtistPersistentID;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (unint64_t)genrePersistentID
{
  return self->_genrePersistentID;
}

- (NSString)genre
{
  return self->_genre;
}

- (unint64_t)composerPersistentID
{
  return self->_composerPersistentID;
}

- (NSString)composer
{
  return self->_composer;
}

- (BOOL)partOfCompilation
{
  return self->_partOfCompilation;
}

- (BOOL)local
{
  return self->_local;
}

- (unsigned)chapterCount
{
  return self->_chapterCount;
}

- (void).cxx_destruct
{
}

- (void)copyDict
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "_validMask=%llxh dict=%@",  (uint8_t *)&v4,  0x16u);
}

@end