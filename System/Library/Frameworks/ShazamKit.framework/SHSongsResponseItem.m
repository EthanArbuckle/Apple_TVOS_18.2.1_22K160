@interface SHSongsResponseItem
- (BOOL)isExplicitContent;
- (CGSize)targetArtworkImageSizeFromOriginalSize:(CGSize)result;
- (NSArray)genreNames;
- (NSArray)lyricsRelationIDs;
- (NSArray)musicVideoRelationIDs;
- (NSDate)releaseDate;
- (NSDictionary)songItemDictionary;
- (NSDictionary)spatialOffsets;
- (NSNumber)durationInMilliseconds;
- (NSString)albumName;
- (NSString)appleMusicID;
- (NSString)appleMusicURLString;
- (NSString)isrc;
- (NSURL)artworkURL;
- (NSURL)hapticsURL;
- (SHSongsResponseItem)initWithSongItemDictionary:(id)a3;
- (id)artworkURLFromDictionary:(id)a3;
- (id)extractIDsFromRelation:(id)a3;
- (id)rawResponseWithCampaignToken:(id)a3;
@end

@implementation SHSongsResponseItem

- (SHSongsResponseItem)initWithSongItemDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHSongsResponseItem;
  v6 = -[SHSongsResponseItem init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_songItemDictionary, a3);
  }

  return v7;
}

- (NSString)appleMusicID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"id"]);

  return (NSString *)v3;
}

- (NSURL)artworkURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"attributes"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"artwork"]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem artworkURLFromDictionary:](self, "artworkURLFromDictionary:", v5));

  return (NSURL *)v6;
}

- (NSString)appleMusicURLString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"url"]);

  return (NSString *)v4;
}

- (NSURL)hapticsURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"hapticsAssetUrl"]);

  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  }
  else {
    id v5 = 0LL;
  }

  return (NSURL *)v5;
}

- (NSNumber)durationInMilliseconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"durationInMillis"]);

  return (NSNumber *)v4;
}

- (NSDictionary)spatialOffsets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"spatialOffsets"]);

  return (NSDictionary *)v4;
}

- (NSArray)genreNames
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"genreNames"]);

  return (NSArray *)v4;
}

- (NSDate)releaseDate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"releaseDate"]);

  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
    -[NSISO8601DateFormatter setFormatOptions:](v5, "setFormatOptions:", 275LL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter dateFromString:](v5, "dateFromString:", v4));
  }

  else
  {
    v6 = 0LL;
  }

  return (NSDate *)v6;
}

- (BOOL)isExplicitContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contentRating"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);
  unsigned __int8 v6 = [v5 isEqualToString:@"EXPLICIT"];

  return v6;
}

- (NSString)albumName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"albumName"]);

  return (NSString *)v4;
}

- (NSString)isrc
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"attributes"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"isrc"]);

  return (NSString *)v4;
}

- (NSArray)lyricsRelationIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"relationships"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"public-lyrics"]);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem extractIDsFromRelation:](self, "extractIDsFromRelation:", v5));
  return (NSArray *)v6;
}

- (NSArray)musicVideoRelationIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"relationships"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"music-videos"]);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem extractIDsFromRelation:](self, "extractIDsFromRelation:", v5));
  return (NSArray *)v6;
}

- (id)rawResponseWithCampaignToken:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem songItemDictionary](self, "songItemDictionary"));
  id v6 = [v5 mutableCopy];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHSongsResponseItem appleMusicURLString](self, "appleMusicURLString"));
  id v8 = [v7 copy];

  if (v8)
  {
    objc_super v9 = -[SHTokenizedURL initWithString:](objc_alloc(&OBJC_CLASS___SHTokenizedURL), "initWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHTokenizedURL URLRepresentation](v9, "URLRepresentation"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"attributes"]);
      id v12 = [v11 mutableCopy];

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHTokenizedURL URLRepresentation](v9, "URLRepresentation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
      [v12 setValue:v14 forKey:@"url"];

      id v15 = [v12 copy];
      [v6 setValue:v15 forKey:@"attributes"];
    }
  }

  id v16 = [v6 copy];

  return v16;
}

- (id)extractIDsFromRelation:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"data"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", @"id", (void)v15));

        if (v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"id"]);
          [v4 addObject:v12];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = [v4 copy];
  return v13;
}

- (id)artworkURLFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSMediaArtwork alloc] initWithDictionary:v4];

  [v5 artworkSize];
  -[SHSongsResponseItem targetArtworkImageSizeFromOriginalSize:](self, "targetArtworkImageSizeFromOriginalSize:");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "URLWithSize:cropStyle:format:",  AMSMediaArtworkCropStyleBoundedBox,  AMSMediaArtworkFormatJPG));

  return v6;
}

- (CGSize)targetArtworkImageSizeFromOriginalSize:(CGSize)result
{
  if (result.width != 0.0 && result.height != 0.0)
  {
    double v3 = sqrt(result.width / result.height * 640000.0);
    double v4 = 640000.0 / v3;
    result.width = round(v3);
    result.height = round(v4);
  }

  return result;
}

- (NSDictionary)songItemDictionary
{
  return self->_songItemDictionary;
}

- (void).cxx_destruct
{
}

@end