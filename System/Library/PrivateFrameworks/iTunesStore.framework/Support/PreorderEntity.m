@interface PreorderEntity
+ (id)allProperties;
+ (id)databaseTable;
+ (id)newClientPreorderWithPersistentID:(int64_t)a3 allValues:(const void *)a4;
+ (id)newValueDictionaryWithItem:(id)a3;
- (void)setValuesWithItem:(id)a3;
@end

@implementation PreorderEntity

+ (id)databaseTable
{
  return @"preorder";
}

+ (id)allProperties
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"artist_name",  @"image_collection_data",  @"kind",  @"release_date",  @"release_date_string",  @"store_account_id",  @"store_item_id",  @"store_preorder_id",  @"title",  0LL);
}

+ (id)newClientPreorderWithPersistentID:(int64_t)a3 allValues:(const void *)a4
{
  id v5 = [[SSPreorder alloc] _initWithPersistentIdentifier:a3];
  [v5 _setArtistName:*a4];
  [v5 _setItemKind:a4[2]];
  [v5 _setReleaseDateString:a4[4]];
  [v5 _setStoreAccountIdentifier:a4[5]];
  [v5 _setTitle:a4[8]];
  v6 = (void *)a4[3];
  if (v6)
  {
    [v6 doubleValue];
    objc_msgSend( v5,  "_setReleaseDate:",  +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  }

  v7 = a4[6];
  if (v7) {
    [v5 _setStoreItemIdentifier:SSGetItemIdentifierFromValue(v7)];
  }
  v8 = a4[7];
  if (v8) {
    [v5 _setStorePreorderIdentifier:SSGetItemIdentifierFromValue(v8)];
  }
  v9 = a4[1];
  if (v9)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___SSItemImageCollection);
    ObjectWithArchivedData = (void *)SSCodingCreateObjectWithArchivedData(v9, v10);
    [v5 _setImageCollection:ObjectWithArchivedData];
  }

  return v5;
}

+ (id)newValueDictionaryWithItem:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = [a3 artistName];
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"artist_name");
  }
  id v6 = [a3 itemKind];
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"kind");
  }
  id v7 = [a3 releaseDate];
  if (v7)
  {
    [v7 timeIntervalSinceReferenceDate];
    -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"release_date");
  }

  id v8 = [a3 releaseDateString];
  if (v8) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"release_date_string");
  }
  id v9 = [a3 ITunesStoreIdentifier];
  if (v9) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"store_item_id");
  }
  id v10 = [a3 preOrderIdentifier];
  if (v10) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"store_preorder_id");
  }
  id v11 = [a3 itemTitle];
  if (v11) {
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"title");
  }
  id v12 = [a3 imageCollection];
  if (v12)
  {
    uint64_t ArchivableData = SSCodingCreateArchivableData(v12);
    if (ArchivableData)
    {
      v14 = (void *)ArchivableData;
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", ArchivableData, @"image_collection_data");
    }
  }

  return v4;
}

- (void)setValuesWithItem:(id)a3
{
  id v4 = [(id)objc_opt_class(self) newValueDictionaryWithItem:a3];
  -[PreorderEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);
}

@end