@interface MediaSocialContentItemEntity
+ (id)databaseTable;
+ (id)newEntityValuesWithMediaSocialPostItem:(id)a3;
@end

@implementation MediaSocialContentItemEntity

+ (id)databaseTable
{
  return @"content_item";
}

+ (id)newEntityValuesWithMediaSocialPostItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"item_id");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 type]);

  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"type");
  }

  return v4;
}

@end