@interface ACCMediaLibraryUpdatePlaylistContentItem
- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 playlistPersistentID:(unint64_t)a5;
- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 playlistPersistentID:(unint64_t)a4 dict:(id)a5;
- (NSString)albumArtist;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)composer;
- (NSString)genre;
- (NSString)mediaLibraryUID;
- (NSString)title;
- (id)copyNSRepresentation:(int)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)persistentID;
- (unint64_t)playlistPersistentID;
- (unint64_t)validMask;
- (void)fillStruct:(id *)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setArtist:(id)a3;
- (void)setComposer:(id)a3;
- (void)setGenre:(id)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setPlaylistPersistentID:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ACCMediaLibraryUpdatePlaylistContentItem

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 playlistPersistentID:(unint64_t)a5
{
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdatePlaylistContentItem;
  v10 = -[ACCMediaLibraryUpdatePlaylistContentItem init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaLibraryUID, a3);
    v11->_playlistPersistentID = a5;
    v11->_validMask = 1LL;
    title = v11->_title;
    v11->_persistentID = a4;
    v11->_title = 0LL;

    albumTitle = v11->_albumTitle;
    v11->_albumTitle = 0LL;

    artist = v11->_artist;
    v11->_artist = 0LL;

    albumArtist = v11->_albumArtist;
    v11->_albumArtist = 0LL;

    genre = v11->_genre;
    v11->_genre = 0LL;

    composer = v11->_composer;
    v11->_composer = 0LL;
  }

  return v11;
}

- (ACCMediaLibraryUpdatePlaylistContentItem)initWithMediaLibrary:(id)a3 playlistPersistentID:(unint64_t)a4 dict:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___ACCMediaLibraryUpdatePlaylistContentItem;
  v11 = -[ACCMediaLibraryUpdatePlaylistContentItem init](&v40, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    v12->_playlistPersistentID = a4;
    title = v12->_title;
    v12->_persistentID = 0LL;
    v12->_title = 0LL;

    albumTitle = v12->_albumTitle;
    v12->_albumTitle = 0LL;

    artist = v12->_artist;
    v12->_artist = 0LL;

    albumArtist = v12->_albumArtist;
    v12->_albumArtist = 0LL;

    genre = v12->_genre;
    v12->_genre = 0LL;

    composer = v12->_composer;
    v12->_composer = 0LL;

    v12->_validMask = 0LL;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemPersistentID"]);

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemPersistentID"]);
      v12->_persistentID = (unint64_t)[v20 unsignedLongLongValue];

      v12->_validMask |= 1uLL;
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemTitle"]);

    if (v21)
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemTitle"]);
      v23 = v12->_title;
      v12->_title = (NSString *)v22;

      v12->_validMask |= 2uLL;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumTitle"]);

    if (v24)
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumTitle"]);
      v26 = v12->_albumTitle;
      v12->_albumTitle = (NSString *)v25;

      v12->_validMask |= 0x40uLL;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemArtist"]);

    if (v27)
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemArtist"]);
      v29 = v12->_artist;
      v12->_artist = (NSString *)v28;

      v12->_validMask |= 0x1000uLL;
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumArtist"]);

    if (v30)
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemAlbumArtist"]);
      v32 = v12->_albumArtist;
      v12->_albumArtist = (NSString *)v31;

      v12->_validMask |= 0x4000uLL;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemGenre"]);

    if (v33)
    {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemGenre"]);
      v35 = v12->_genre;
      v12->_genre = (NSString *)v34;

      v12->_validMask |= 0x10000uLL;
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemComposer"]);

    if (v36)
    {
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v10 objectForKey:@"ACCMediaLibraryPlaylistItemComposer"]);
      v38 = v12->_composer;
      v12->_composer = (NSString *)v37;

      v12->_validMask |= 0x40000uLL;
    }
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ACCMediaLibraryUpdatePlaylistContentItem>[%@:%llu itemPersistentID=%llu '%@' validMask=%llxh]",  self->_mediaLibraryUID,  self->_playlistPersistentID,  self->_persistentID,  self->_title,  self->_validMask);
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCMediaLibraryUpdatePlaylistContentItem description](self, "description"));
  id v4 = -[ACCMediaLibraryUpdatePlaylistContentItem copyNSRepresentation:](self, "copyNSRepresentation:", 3LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n    %@", v3, v4));

  return v5;
}

- (id)copyNSRepresentation:(int)a3
{
  if (a3 != 1)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    unint64_t validMask = self->_validMask;
    if ((validMask & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_persistentID));
      -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  v7,  @"ACCMediaLibraryPlaylistItemPersistentID");

      unint64_t validMask = self->_validMask;
      if ((validMask & 2) == 0)
      {
LABEL_5:
        if ((validMask & 0x40) == 0) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }

    else if ((validMask & 2) == 0)
    {
      goto LABEL_5;
    }

    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  self->_title,  @"ACCMediaLibraryPlaylistItemTitle");
    unint64_t validMask = self->_validMask;
    if ((validMask & 0x40) == 0)
    {
LABEL_6:
      if ((validMask & 0x1000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }

- (void)fillStruct:(id *)a3
{
  *(_OWORD *)&a3->var4 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
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
      if ((validMask & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
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
  if ((validMask & 0x40) == 0)
  {
LABEL_4:
    if ((validMask & 0x1000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setPlaylistPersistentID:(unint64_t)a3
{
  self->_playlistPersistentID = a3;
}

- (void)setPersistentID:(unint64_t)a3
{
  self->_validMask |= 1uLL;
  self->_persistentID = a3;
}

- (void)setTitle:(id)a3
{
  self->_validMask |= 1uLL;
}

- (void)setAlbumTitle:(id)a3
{
  self->_validMask |= 0x40uLL;
}

- (void)setArtist:(id)a3
{
  self->_validMask |= 0x1000uLL;
}

- (void)setAlbumArtist:(id)a3
{
  self->_validMask |= 0x4000uLL;
}

- (void)setGenre:(id)a3
{
  self->_validMask |= 0x10000uLL;
}

- (void)setComposer:(id)a3
{
  self->_validMask |= 0x40000uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (unint64_t)playlistPersistentID
{
  return self->_playlistPersistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)composer
{
  return self->_composer;
}

- (void).cxx_destruct
{
}

@end