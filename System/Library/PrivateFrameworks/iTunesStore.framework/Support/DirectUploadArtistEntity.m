@interface DirectUploadArtistEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialArtist:(id)a3;
@end

@implementation DirectUploadArtistEntity

+ (id)newEntityValuesWithMediaSocialArtist:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if ([v5 length]) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"artist_id");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  if ([v6 length]) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"name");
  }

  return v4;
}

+ (id)databaseTable
{
  return @"artist";
}

@end