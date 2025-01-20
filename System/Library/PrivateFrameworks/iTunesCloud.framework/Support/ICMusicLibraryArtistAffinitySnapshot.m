@interface ICMusicLibraryArtistAffinitySnapshot
- (ICMusicLibraryArtistAffinitySnapshot)initWithContentItemSnapshot:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor;
- (NSDate)lastPlayedDate;
- (NSMutableArray)uniqueAlbums;
- (NSMutableArray)uniqueSongs;
- (NSMutableSet)uniqueDatesWithAddedContent;
- (NSString)artistName;
- (double)averagePlaysPerItemAdded;
- (float)legacyScore;
- (id)debugDescription;
- (int64_t)artistAdamID;
- (int64_t)cumulativePlayCount;
- (int64_t)cumulativeSkipCount;
- (int64_t)daysSinceLastPlayedDate;
- (void)setArtistMetadataDescriptor:(id)a3;
- (void)setCumulativePlayCount:(int64_t)a3;
- (void)setCumulativeSkipCount:(int64_t)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setUniqueAlbums:(id)a3;
- (void)setUniqueDatesWithAddedContent:(id)a3;
- (void)setUniqueSongs:(id)a3;
@end

@implementation ICMusicLibraryArtistAffinitySnapshot

- (ICMusicLibraryArtistAffinitySnapshot)initWithContentItemSnapshot:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ICMusicLibraryArtistAffinitySnapshot;
  v5 = -[ICMusicLibraryArtistAffinitySnapshot init](&v18, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 artistMetadataDescriptor]);
    -[ICMusicLibraryArtistAffinitySnapshot setArtistMetadataDescriptor:](v5, "setArtistMetadataDescriptor:", v6);

    v7 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 songMetadataDescriptor]);
    v9 = -[NSMutableArray initWithObjects:](v7, "initWithObjects:", v8, 0LL);
    -[ICMusicLibraryArtistAffinitySnapshot setUniqueSongs:](v5, "setUniqueSongs:", v9);

    v10 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 albumMetadataDescriptor]);
    v12 = -[NSMutableArray initWithObjects:](v10, "initWithObjects:", v11, 0LL);
    -[ICMusicLibraryArtistAffinitySnapshot setUniqueAlbums:](v5, "setUniqueAlbums:", v12);

    v13 = objc_alloc(&OBJC_CLASS___NSMutableSet);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryAddedDate]);
    v15 = -[NSMutableSet initWithObjects:](v13, "initWithObjects:", v14, 0LL);
    -[ICMusicLibraryArtistAffinitySnapshot setUniqueDatesWithAddedContent:](v5, "setUniqueDatesWithAddedContent:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 lastPlayedDate]);
    -[ICMusicLibraryArtistAffinitySnapshot setLastPlayedDate:](v5, "setLastPlayedDate:", v16);

    -[ICMusicLibraryArtistAffinitySnapshot setCumulativePlayCount:]( v5,  "setCumulativePlayCount:",  [v4 playCount]);
    -[ICMusicLibraryArtistAffinitySnapshot setCumulativeSkipCount:]( v5,  "setCumulativeSkipCount:",  [v4 skipCount]);
  }

  return v5;
}

- (NSString)artistName
{
  return -[ICMusicLibraryContentMetadataDescriptor title](self->_artistMetadataDescriptor, "title");
}

- (int64_t)artistAdamID
{
  return -[ICMusicLibraryContentMetadataDescriptor storeAdamID](self->_artistMetadataDescriptor, "storeAdamID");
}

- (double)averagePlaysPerItemAdded
{
  double cumulativePlayCount = (double)self->_cumulativePlayCount;
  return cumulativePlayCount / (double)(unint64_t)-[NSMutableArray count](self->_uniqueSongs, "count");
}

- (int64_t)daysSinceLastPlayedDate
{
  lastPlayedDate = self->_lastPlayedDate;
  if (!lastPlayedDate) {
    return -1LL;
  }
  -[NSDate timeIntervalSinceNow](lastPlayedDate, "timeIntervalSinceNow");
  double v4 = v3 / 60.0 / 60.0 / 24.0;
  else {
    return -(uint64_t)v4;
  }
}

- (float)legacyScore
{
  id v3 = -[NSMutableArray count](self->_uniqueSongs, "count");
  id v4 = -[NSMutableArray count](self->_uniqueAlbums, "count");
  lastPlayedDate = self->_lastPlayedDate;
  if (lastPlayedDate)
  {
    -[NSDate timeIntervalSinceNow](lastPlayedDate, "timeIntervalSinceNow");
    *(float *)&double v6 = v6;
    float v7 = (float)((float)((float)((float)(*(float *)&v6 / 60.0) / 60.0) / 24.0) / 7.0) * 0.25;
  }

  else
  {
    float v7 = 0.0;
  }

  return roundf( (float)((float)((float)((float)(unint64_t)v4 * 0.85) + (float)((float)(unint64_t)v3 * 0.55))
                 + (float)((float)((float)self->_cumulativePlayCount * -0.15)
}

- (id)debugDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryArtistAffinitySnapshot artistName](self, "artistName"));
  -[ICMusicLibraryArtistAffinitySnapshot legacyScore](self, "legacyScore");
  double v5 = v4;
  int64_t v17 = -[ICMusicLibraryArtistAffinitySnapshot artistAdamID](self, "artistAdamID");
  int64_t v6 = -[ICMusicLibraryArtistAffinitySnapshot cumulativePlayCount](self, "cumulativePlayCount");
  int64_t v7 = -[ICMusicLibraryArtistAffinitySnapshot cumulativeSkipCount](self, "cumulativeSkipCount");
  -[ICMusicLibraryArtistAffinitySnapshot averagePlaysPerItemAdded](self, "averagePlaysPerItemAdded");
  uint64_t v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryArtistAffinitySnapshot uniqueAlbums](self, "uniqueAlbums"));
  id v11 = [v10 count];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryArtistAffinitySnapshot uniqueSongs](self, "uniqueSongs"));
  id v13 = [v12 count];
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICMusicLibraryArtistAffinitySnapshot uniqueDatesWithAddedContent]( self,  "uniqueDatesWithAddedContent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Artist: %@: Score: %f, artistID: %lld, cumulativePlayCount: %ld, cumulativeSkipCount: %ld, playsPerItem: %f, uniqueAlbums: %lu, uniqueSongs: %lu, daysWithAdds: %lu, daysSinceLastPlay: %ld",  v3,  *(void *)&v5,  v17,  v6,  v7,  v9,  v11,  v13,  [v14 count],  -[ICMusicLibraryArtistAffinitySnapshot daysSinceLastPlayedDate](self, "daysSinceLastPlayedDate")));

  return v15;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (int64_t)cumulativePlayCount
{
  return self->_cumulativePlayCount;
}

- (void)setCumulativePlayCount:(int64_t)a3
{
  self->_double cumulativePlayCount = a3;
}

- (int64_t)cumulativeSkipCount
{
  return self->_cumulativeSkipCount;
}

- (void)setCumulativeSkipCount:(int64_t)a3
{
  self->_cumulativeSkipCount = a3;
}

- (NSMutableArray)uniqueSongs
{
  return self->_uniqueSongs;
}

- (void)setUniqueSongs:(id)a3
{
}

- (NSMutableArray)uniqueAlbums
{
  return self->_uniqueAlbums;
}

- (void)setUniqueAlbums:(id)a3
{
}

- (NSMutableSet)uniqueDatesWithAddedContent
{
  return self->_uniqueDatesWithAddedContent;
}

- (void)setUniqueDatesWithAddedContent:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor
{
  return self->_artistMetadataDescriptor;
}

- (void)setArtistMetadataDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end