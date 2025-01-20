@interface ICMusicLibraryContentItemSnapshot
- (BOOL)hasArtistAndAlbumData;
- (BOOL)isValid;
- (ICMusicLibraryContentItemSnapshot)initWithSong:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)albumMetadataDescriptor;
- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor;
- (ICMusicLibraryContentMetadataDescriptor)songMetadataDescriptor;
- (NSDate)lastPlayedDate;
- (NSDate)libraryAddedDate;
- (float)userRating;
- (id)debugDescription;
- (int64_t)playCount;
- (int64_t)skipCount;
- (void)setAlbumMetadataDescriptor:(id)a3;
- (void)setArtistMetadataDescriptor:(id)a3;
- (void)setHasArtistAndAlbumData:(BOOL)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setLibraryAddedDate:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setSkipCount:(int64_t)a3;
- (void)setSongMetadataDescriptor:(id)a3;
- (void)setUserRating:(float)a3;
@end

@implementation ICMusicLibraryContentItemSnapshot

- (ICMusicLibraryContentItemSnapshot)initWithSong:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ICMusicLibraryContentItemSnapshot;
  v5 = -[ICMusicLibraryContentItemSnapshot init](&v28, "init");
  v6 = v5;
  if (v5)
  {
    v5->_hasArtistAndAlbumData = 1;
    v7 = objc_alloc(&OBJC_CLASS___ICMusicLibraryContentMetadataDescriptor);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 universalStore]);
    v11 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:]( v7,  "initWithTitle:andStoreAdamID:",  v8,  [v10 adamID]);
    -[ICMusicLibraryContentItemSnapshot setSongMetadataDescriptor:](v6, "setSongMetadataDescriptor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 artist]);
    if (!v12) {
      v6->_hasArtistAndAlbumData = 0;
    }
    v13 = objc_alloc(&OBJC_CLASS___ICMusicLibraryContentMetadataDescriptor);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 identifiers]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 universalStore]);
    v17 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:]( v13,  "initWithTitle:andStoreAdamID:",  v14,  [v16 adamID]);
    -[ICMusicLibraryContentItemSnapshot setArtistMetadataDescriptor:](v6, "setArtistMetadataDescriptor:", v17);

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 album]);
    v19 = (void *)v18;
    if (v6->_hasArtistAndAlbumData && !v18) {
      v6->_hasArtistAndAlbumData = 0;
    }
    v20 = objc_alloc(&OBJC_CLASS___ICMusicLibraryContentMetadataDescriptor);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 title]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 identifiers]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 universalStore]);
    v24 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:]( v20,  "initWithTitle:andStoreAdamID:",  v21,  [v23 adamID]);
    -[ICMusicLibraryContentItemSnapshot setAlbumMetadataDescriptor:](v6, "setAlbumMetadataDescriptor:", v24);

    -[ICMusicLibraryContentItemSnapshot setPlayCount:](v6, "setPlayCount:", [v4 playCount]);
    -[ICMusicLibraryContentItemSnapshot setSkipCount:](v6, "setSkipCount:", [v4 skipCount]);
    [v4 userRating];
    -[ICMusicLibraryContentItemSnapshot setUserRating:](v6, "setUserRating:");
    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 lastDevicePlaybackDate]);
    -[ICMusicLibraryContentItemSnapshot setLastPlayedDate:](v6, "setLastPlayedDate:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryAddedDate]);
    -[ICMusicLibraryContentItemSnapshot setLibraryAddedDate:](v6, "setLibraryAddedDate:", v26);
  }

  return v6;
}

- (BOOL)isValid
{
  return self->_hasArtistAndAlbumData;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryContentMetadataDescriptor title](self->_artistMetadataDescriptor, "title"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryContentMetadataDescriptor title](self->_songMetadataDescriptor, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryContentMetadataDescriptor title](self->_albumMetadataDescriptor, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ - %@ - %@, playCount: %ld",  v3,  v4,  v5,  self->_playCount));
  id v7 = [v6 mutableCopy];

  if (self->_lastPlayedDate) {
    id v8 = [v7 stringByAppendingFormat:@", lastPlayedDate: %@", self->_lastPlayedDate];
  }
  return v7;
}

- (ICMusicLibraryContentMetadataDescriptor)songMetadataDescriptor
{
  return self->_songMetadataDescriptor;
}

- (void)setSongMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor
{
  return self->_artistMetadataDescriptor;
}

- (void)setArtistMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)albumMetadataDescriptor
{
  return self->_albumMetadataDescriptor;
}

- (void)setAlbumMetadataDescriptor:(id)a3
{
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(int64_t)a3
{
  self->_skipCount = a3;
}

- (float)userRating
{
  return self->_userRating;
}

- (void)setUserRating:(float)a3
{
  self->_userRating = a3;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (NSDate)libraryAddedDate
{
  return self->_libraryAddedDate;
}

- (void)setLibraryAddedDate:(id)a3
{
}

- (BOOL)hasArtistAndAlbumData
{
  return self->_hasArtistAndAlbumData;
}

- (void)setHasArtistAndAlbumData:(BOOL)a3
{
  self->_hasArtistAndAlbumData = a3;
}

- (void).cxx_destruct
{
}

@end