@interface TVHKMediaEntitiesFetchRequest
+ (id)tvh_imageParadeFetchRequestWithMediaCategoryType:(unint64_t)a3;
+ (id)tvh_imagePreviewFetchRequestWithMediaCategoryType:(unint64_t)a3 photoPlaylistIdentifier:(id)a4 maxMediaEntities:(unint64_t)a5;
+ (id)tvh_toplevelPlaylistsFetchRequestWithIdentifier:(id)a3 playlistItemMediaCategoryTypes:(id)a4;
- (void)tvh_addPlayedStateGroupingKeyPath;
@end

@implementation TVHKMediaEntitiesFetchRequest

+ (id)tvh_imageParadeFetchRequestWithMediaCategoryType:(unint64_t)a3
{
  return objc_msgSend( a1,  "tvh_imagePreviewFetchRequestWithMediaCategoryType:photoPlaylistIdentifier:maxMediaEntities:",  a3,  0,  50);
}

+ (id)tvh_imagePreviewFetchRequestWithMediaCategoryType:(unint64_t)a3 photoPlaylistIdentifier:(id)a4 maxMediaEntities:(unint64_t)a5
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingAddedDateSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingAddedDateSortDescriptor"));
  switch(a3)
  {
    case 0uLL:
      unint64_t v9 = 1LL;
      goto LABEL_3;
    case 1uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      unint64_t v9 = a3;
LABEL_3:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaEntityCollectionsFetchRequestWithMediaEntityCollectionType:mediaCategoryType:",  1LL,  v9));
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
    case 5uLL:
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  a3));
LABEL_5:
      v11 = (void *)v10;
      break;
    case 9uLL:
      if (v7) {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistItemsFetchRequestWithPlaylistIdentifier:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistItemsFetchRequestWithPlaylistIdentifier:",  v7));
      }
      else {
        uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest mediaItemsFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "mediaItemsFetchRequestWithMediaCategoryType:",  9LL));
      }
      v11 = (void *)v16;
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_descendingCreationDateSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_descendingCreationDateSortDescriptor"));

      v8 = (void *)v17;
      break;
    default:
      v11 = 0LL;
      break;
  }

  if (a5) {
    objc_msgSend(v11, "setRange:", 0, a5);
  }
  v18 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v11 setSortDescriptors:v12];

  uint64_t v13 = TVHKMinimalMediaEntityProperties();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v11 setProperties:v14];

  return v11;
}

+ (id)tvh_toplevelPlaylistsFetchRequestWithIdentifier:(id)a3 playlistItemMediaCategoryTypes:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  a4));
  [v6 setIdentifier:v5];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tvhk_equalPredicateWithKeyPath:value:]( &OBJC_CLASS___NSPredicate,  "tvhk_equalPredicateWithKeyPath:value:",  @"parentPlaylistIdentifier",  0LL));
  uint64_t v8 = TVHKPlaylistProperties([v6 setPredicate:v7]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 setProperties:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingPlaylistTypeSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingPlaylistTypeSortDescriptor"));
  v14[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor tvhk_ascendingPlaylistTitleSortDescriptor]( &OBJC_CLASS___NSSortDescriptor,  "tvhk_ascendingPlaylistTitleSortDescriptor"));
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  [v6 setSortDescriptors:v12];
  return v6;
}

- (void)tvh_addPlayedStateGroupingKeyPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchRequest groupingKeyPaths](self, "groupingKeyPaths"));
  uint64_t v10 = (NSMutableArray *)[v3 mutableCopy];

  v4 = v10;
  if (!v10) {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  v11 = v4;
  -[NSMutableArray addObject:](v4, "addObject:", @"playedState");
  -[TVHKMediaEntitiesFetchRequest setGroupingKeyPaths:](self, "setGroupingKeyPaths:", v11);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHPlayedStateGroupTitleValueTransformer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchRequest groupTitleValueTransformers](self, "groupTitleValueTransformers"));
  id v7 = (NSMutableDictionary *)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v5, @"playedState");
  -[TVHKMediaEntitiesFetchRequest setGroupTitleValueTransformers:](self, "setGroupTitleValueTransformers:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchRequest groupSortComparators](self, "groupSortComparators"));
  unint64_t v9 = (NSMutableDictionary *)[v8 mutableCopy];

  if (!v9) {
    unint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", &stru_1000FFC70, @"playedState");
  -[TVHKMediaEntitiesFetchRequest setGroupSortComparators:](self, "setGroupSortComparators:", v9);
}

@end