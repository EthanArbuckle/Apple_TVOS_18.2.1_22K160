@interface TVHPhotosMainListViewDataSource
+ (TVHPhotosMainListViewDataSource)new;
+ (id)_itemTypesSortComparator;
- (NSArray)indexTitles;
- (NSDictionary)typeToPhotoMainItemDictionary;
- (NSOrderedSet)photoMainItems;
- (NSOrderedSet)sectionIdentifiers;
- (NSString)description;
- (NSString)title;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (TVHKMediaEntitiesFetchRequest)fetchRequest;
- (TVHPhotosMainListViewDataSource)init;
- (TVHPhotosMainListViewDataSource)initWithTitle:(id)a3;
- (id)_photoMainItemTypes;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)photoMainItemAtIndexPath:(id)a3;
- (id)photoMainItemForIdentifier:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setPhotoMainItems:(id)a3;
- (void)setTypeToPhotoMainItemDictionary:(id)a3;
- (void)updateWithPhotoPlaylistsFetchResponse:(id)a3;
@end

@implementation TVHPhotosMainListViewDataSource

+ (TVHPhotosMainListViewDataSource)new
{
  return 0LL;
}

- (TVHPhotosMainListViewDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHPhotosMainListViewDataSource)initWithTitle:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHPhotosMainListViewDataSource;
  v5 = -[TVHPhotosMainListViewDataSource init](&v13, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    title = v5->_title;
    v5->_title = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "playlistsFetchRequestWithPlaylistItemMediaCategoryTypes:",  &off_100106E18));
    uint64_t v9 = TVHKPlaylistProperties([v8 setIdentifier:@"PhotosPlaylistsFetchRequestIdentifier"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v8 setProperties:v10];

    fetchRequest = v5->_fetchRequest;
    v5->_fetchRequest = (TVHKMediaEntitiesFetchRequest *)v8;
  }

  return v5;
}

- (id)photoMainItemForIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPhotosMainListViewDataSource typeToPhotoMainItemDictionary]( self,  "typeToPhotoMainItemDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)photoMainItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource photoMainItems](self, "photoMainItems"));
    id v7 = [v4 item];
    if (v7 >= [v6 count]) {
      uint64_t v5 = 0LL;
    }
    else {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v7]);
    }
  }

  return v5;
}

- (void)updateWithPhotoPlaylistsFetchResponse:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 mediaEntitiesResult]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntities]);

  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  -[NSMutableOrderedSet addObject:](v5, "addObject:", &off_100106540);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (unint64_t)[*(id *)(*((void *)&v34 + 1) + 8 * (void)i) playlistType] - 1;
        if (v11 <= 7 && ((0xF1u >> v11) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  qword_1000C3738[v11]));
          -[NSMutableOrderedSet addObject:](v5, "addObject:", v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v8);
  }

  *(void *)&double v13 = objc_opt_class(self).n128_u64[0];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_itemTypesSortComparator", v13));
  -[NSMutableOrderedSet sortUsingComparator:](v5, "sortUsingComparator:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource _photoMainItemTypes](self, "_photoMainItemTypes"));
  if ((-[NSMutableOrderedSet isEqual:](v5, "isEqual:", v16) & 1) == 0)
  {
    v27 = v16;
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    v28 = v5;
    v19 = v5;
    id v20 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)j);
          v25 = -[TVHPhotosMainItem initWithType:]( [TVHPhotosMainItem alloc],  "initWithType:",  [v24 unsignedIntegerValue]);
          -[NSMutableOrderedSet addObject:](v17, "addObject:", v25);
          -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v25, v24);
        }

        id v21 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
      }

      while (v21);
    }

    -[TVHPhotosMainListViewDataSource setPhotoMainItems:](self, "setPhotoMainItems:", v17);
    -[TVHPhotosMainListViewDataSource setTypeToPhotoMainItemDictionary:](self, "setTypeToPhotoMainItemDictionary:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPhotosMainListViewDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
    [v26 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:1 itemIdentifiersOfAmendedItems:0];

    v16 = v27;
    uint64_t v5 = v28;
  }
}

- (NSOrderedSet)sectionIdentifiers
{
  return +[NSOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithObject:",  @"SectionIdentifier");
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  return 0LL;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  else {
    id v4 = 0LL;
  }
  return v4;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource photoMainItemAtIndexPath:](self, "photoMainItemAtIndexPath:", a3));
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 type]));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (NSArray)indexTitles
{
  return 0LL;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0LL;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource photoMainItems](self, "photoMainItems"));
  id v5 = [v3 appendObject:v4 withName:@"photoMainItems"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v6;
}

+ (id)_itemTypesSortComparator
{
  if (qword_100157628 != -1) {
    dispatch_once(&qword_100157628, &stru_1000FFA58);
  }
  return &stru_1000FFA98;
}

- (id)_photoMainItemTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewDataSource photoMainItems](self, "photoMainItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 array]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_map:", &stru_1000FFAD8));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v4));

  return v5;
}

- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate
{
  return (TVHDiffableDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_diffableDataSourceContentProviderDelegate);
}

- (void)setDiffableDataSourceContentProviderDelegate:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSOrderedSet)photoMainItems
{
  return self->_photoMainItems;
}

- (void)setPhotoMainItems:(id)a3
{
}

- (TVHKMediaEntitiesFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSDictionary)typeToPhotoMainItemDictionary
{
  return self->_typeToPhotoMainItemDictionary;
}

- (void)setTypeToPhotoMainItemDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end