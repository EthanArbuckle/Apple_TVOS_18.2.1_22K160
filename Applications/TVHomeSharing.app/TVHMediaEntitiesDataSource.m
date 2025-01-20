@interface TVHMediaEntitiesDataSource
+ (TVHMediaEntitiesDataSource)new;
- (BOOL)_canProvideMultipleSectionsForIndexTitlesWithIndexBarItems:(id)a3;
- (BOOL)_hasIndexBarItems;
- (BOOL)_isProvidingIndexTitles;
- (BOOL)_isProvidingMultipleSectionsForIndexTitles;
- (BOOL)provideIndexTitles;
- (BOOL)provideMultipleSectionsForIndexTitles;
- (BOOL)updateWithMediaEntitiesDataSourceFetchResults:(id)a3;
- (NSArray)fetchResults;
- (NSArray)indexBarItems;
- (NSArray)indexTitles;
- (NSArray)itemCollectionDescriptors;
- (NSArray)mediaEntities;
- (NSArray)sections;
- (NSString)description;
- (NSString)identifier;
- (TVHChangeSetDataSourceContentProviderDelegate)changeSetDataSourceContentProviderDelegate;
- (TVHMediaEntitiesDataSource)init;
- (TVHMediaEntitiesDataSource)initWithFetchResultIdentifier:(id)a3;
- (TVHMediaEntitiesDataSource)initWithFetchResultIdentifier:(id)a3 initialSortOption:(id)a4;
- (TVHMediaEntitiesDataSource)initWithIdentifier:(id)a3 itemCollectionDescriptors:(id)a4 initialSortOption:(id)a5;
- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptor:(id)a3;
- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptor:(id)a3 initialSortOption:(id)a4;
- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptors:(id)a3 initialSortOption:(id)a4;
- (TVHMediaEntitiesDataSourceDelegate)delegate;
- (TVHSortOption)currentSortOption;
- (id)_indexBarItemsWithFetchResult:(id)a3;
- (id)_mediaEntitiesWithFetchResults:(id)a3;
- (id)_sectionForIndex:(unint64_t)a3;
- (id)_sectionItemCollectionWithMediaEntities:(id)a3 indexBarItems:(id)a4;
- (id)fetchResultIdentifierAtSection:(unint64_t)a3;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)mediaEntitiesForFetchResultIdentifier:(id)a3;
- (id)mediaEntityAtIndexPath:(id)a3;
- (id)mediaEntityCollectionAtIndexPath:(id)a3;
- (id)mediaItemAtIndexPath:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_notifyDelegateCurrentSortDidChange:(id)a3;
- (void)_notifyDelegateMediaEntitiesDidChange:(id)a3;
- (void)_updateSectionsWithFetchResults:(id)a3 currentSortChanged:(BOOL)a4;
- (void)_updateWithLatestFetchResults:(id)a3 previousFetchResults:(id)a4 currentSortChanged:(BOOL)a5;
- (void)removeAll;
- (void)setChangeSetDataSourceContentProviderDelegate:(id)a3;
- (void)setCurrentSortOption:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchResults:(id)a3;
- (void)setProvideIndexTitles:(BOOL)a3;
- (void)setProvideMultipleSectionsForIndexTitles:(BOOL)a3;
- (void)setSections:(id)a3;
@end

@implementation TVHMediaEntitiesDataSource

+ (TVHMediaEntitiesDataSource)new
{
  return 0LL;
}

- (TVHMediaEntitiesDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesDataSource)initWithIdentifier:(id)a3 itemCollectionDescriptors:(id)a4 initialSortOption:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesDataSource;
  v11 = -[TVHMediaEntitiesDataSource init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    v14 = (NSArray *)[v9 copy];
    itemCollectionDescriptors = v11->_itemCollectionDescriptors;
    v11->_itemCollectionDescriptors = v14;

    objc_storeStrong((id *)&v11->_currentSortOption, a5);
  }

  return v11;
}

- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptors:(id)a3 initialSortOption:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  id v10 = -[TVHMediaEntitiesDataSource initWithIdentifier:itemCollectionDescriptors:initialSortOption:]( self,  "initWithIdentifier:itemCollectionDescriptors:initialSortOption:",  v9,  v7,  v6);

  return v10;
}

- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptor:(id)a3 initialSortOption:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));

  id v9 = -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptors:initialSortOption:]( self,  "initWithItemCollectionDescriptors:initialSortOption:",  v8,  v6,  v11);
  return v9;
}

- (TVHMediaEntitiesDataSource)initWithItemCollectionDescriptor:(id)a3
{
  return -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptor:initialSortOption:]( self,  "initWithItemCollectionDescriptor:initialSortOption:",  a3,  0LL);
}

- (TVHMediaEntitiesDataSource)initWithFetchResultIdentifier:(id)a3 initialSortOption:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  v7);

  id v9 = -[TVHMediaEntitiesDataSource initWithItemCollectionDescriptor:initialSortOption:]( self,  "initWithItemCollectionDescriptor:initialSortOption:",  v8,  v6);
  return v9;
}

- (TVHMediaEntitiesDataSource)initWithFetchResultIdentifier:(id)a3
{
  return -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:initialSortOption:]( self,  "initWithFetchResultIdentifier:initialSortOption:",  a3,  0LL);
}

- (NSArray)mediaEntities
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource fetchResults](self, "fetchResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSource _mediaEntitiesWithFetchResults:]( self,  "_mediaEntitiesWithFetchResults:",  v3));

  return (NSArray *)v4;
}

- (NSArray)indexBarItems
{
  return (NSArray *)-[NSArray copy](self->_indexBarItems, "copy");
}

- (void)setCurrentSortOption:(id)a3
{
  v5 = (TVHSortOption *)a3;
  if (self->_currentSortOption != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_currentSortOption, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource fetchResults](self, "fetchResults"));
    -[TVHMediaEntitiesDataSource _updateWithLatestFetchResults:previousFetchResults:currentSortChanged:]( self,  "_updateWithLatestFetchResults:previousFetchResults:currentSortChanged:",  v6,  0LL,  1LL);

    v5 = v7;
  }
}

- (id)fetchResultIdentifierAtSection:(unint64_t)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource _sectionForIndex:](self, "_sectionForIndex:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchResultIdentifier]);

  return v4;
}

- (id)mediaEntitiesForFetchResultIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fetchResultIdentifier]);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          if (!v8) {
            id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaEntities]);
          -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v14);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  id v15 = -[NSMutableArray copy](v8, "copy");
  return v15;
}

- (id)mediaEntityAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource _sectionForIndex:](self, "_sectionForIndex:", [v4 section]));
  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaEntityForIndex:", objc_msgSend(v4, "item")));
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)mediaEntityCollectionAtIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource mediaEntityAtIndexPath:](self, "mediaEntityAtIndexPath:", a3));
  objc_opt_class(&OBJC_CLASS___TVHKMediaEntityCollection);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (id)mediaItemAtIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource mediaEntityAtIndexPath:](self, "mediaEntityAtIndexPath:", a3));
  objc_opt_class(&OBJC_CLASS___TVHKMediaItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = v3;
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)updateWithMediaEntitiesDataSourceFetchResults:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource fetchResults](self, "fetchResults"));
  if (!v5)
  {
    *((_BYTE *)v10 + 24) = 1;
    goto LABEL_5;
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008F0B8;
  v8[3] = &unk_1000FF930;
  v8[4] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];
  if (*((_BYTE *)v10 + 24))
  {
LABEL_5:
    -[TVHMediaEntitiesDataSource _updateWithLatestFetchResults:previousFetchResults:currentSortChanged:]( self,  "_updateWithLatestFetchResults:previousFetchResults:currentSortChanged:",  v4,  v5,  0LL);
    BOOL v6 = *((_BYTE *)v10 + 24) != 0;
    goto LABEL_6;
  }

  BOOL v6 = 0;
LABEL_6:

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)removeAll
{
}

- (unint64_t)numberOfSections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections"));
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource _sectionForIndex:](self, "_sectionForIndex:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);

  return v4;
}

- (unint64_t)numberOfItemsInSectionAtIndex:(unint64_t)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource _sectionForIndex:](self, "_sectionForIndex:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntities]);
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (NSArray)indexTitles
{
  if (-[TVHMediaEntitiesDataSource _hasIndexBarItems](self, "_hasIndexBarItems"))
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections", 0LL));
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      BOOL v6 = 0LL;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)i) indexTitles]);
          if (v9)
          {
            if (!v6) {
              BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            }
            -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v9);
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v5);
    }

    else
    {
      BOOL v6 = 0LL;
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  id v10 = -[NSMutableArray copy](v6, "copy");

  return (NSArray *)v10;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  id v5 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  __int128 v18 = sub_10008F474;
  __int128 v19 = sub_10008F484;
  id v20 = 0LL;
  if (-[TVHMediaEntitiesDataSource _hasIndexBarItems](self, "_hasIndexBarItems"))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008F48C;
    v12[3] = &unk_1000FF958;
    id v13 = v5;
    __int128 v14 = &v15;
    [v6 enumerateObjectsUsingBlock:v12];
  }

  uint64_t v7 = (void *)v16[5];
  if (!v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    uint64_t v9 = (void *)v16[5];
    v16[5] = v8;

    uint64_t v7 = (void *)v16[5];
  }

  id v10 = v7;
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (NSString)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource identifier](self, "identifier"));
  id v5 = [v3 appendObject:v4 withName:@"identifier"];

  id v6 =  objc_msgSend( v3,  "appendBool:withName:",  -[TVHMediaEntitiesDataSource provideIndexTitles](self, "provideIndexTitles"),  @"provideIndexTitles");
  id v7 =  objc_msgSend( v3,  "appendBool:withName:",  -[TVHMediaEntitiesDataSource provideMultipleSectionsForIndexTitles]( self,  "provideMultipleSectionsForIndexTitles"),  @"provideMultipleSectionsForIndexTitles");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource currentSortOption](self, "currentSortOption"));
  id v9 = [v3 appendObject:v8 withName:@"currentSortOption"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource mediaEntities](self, "mediaEntities"));
  id v11 = [v3 appendObject:v10 withName:@"mediaEntities"];

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource indexBarItems](self, "indexBarItems"));
  id v13 = [v3 appendObject:v12 withName:@"indexBarItems"];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections"));
  id v15 = [v3 appendObject:v14 withName:@"sections"];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v16;
}

- (void)_notifyDelegateCurrentSortDidChange:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "mediaEntitiesDataSource:currentSortDidChange:") & 1) != 0) {
    [v4 mediaEntitiesDataSource:self currentSortDidChange:v5];
  }
}

- (void)_notifyDelegateMediaEntitiesDidChange:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "mediaEntitiesDataSource:mediaEntitiesDidChange:") & 1) != 0) {
    [v4 mediaEntitiesDataSource:self mediaEntitiesDidChange:v5];
  }
}

- (void)_updateWithLatestFetchResults:(id)a3 previousFetchResults:(id)a4 currentSortChanged:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  if (v14)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource currentSortOption](self, "currentSortOption"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sortDescriptors]);

    if (v10)
    {
      id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10008F888;
      v15[3] = &unk_1000FF980;
      id v16 = v10;
      uint64_t v17 = v11;
      id v18 = v8;
      __int128 v19 = self;
      __int128 v12 = v11;
      [v14 enumerateObjectsUsingBlock:v15];
      id v13 = -[NSMutableArray copy](v12, "copy");
    }

    else
    {
      id v13 = v14;
    }

    -[TVHMediaEntitiesDataSource _updateSectionsWithFetchResults:currentSortChanged:]( self,  "_updateSectionsWithFetchResults:currentSortChanged:",  v13,  v5);
  }
}

- (id)_mediaEntitiesWithFetchResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "mediaEntities", (void)v12));
        if (v10) {
          -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v10);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (void)_updateSectionsWithFetchResults:(id)a3 currentSortChanged:(BOOL)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = &qword_1000C3000;
  if ([v6 count] == (id)1)
  {
    v52 = v7;
    BOOL v9 = a4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource itemCollectionDescriptors](self, "itemCollectionDescriptors"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntities]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSource _indexBarItemsWithFetchResult:]( self,  "_indexBarItemsWithFetchResult:",  v10));
    v53 = v13;
    if ([v14 count])
    {
      __int128 v15 = (TVHMediaEntitiesDataSourceSectionItemCollection *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesDataSource _sectionItemCollectionWithMediaEntities:indexBarItems:]( self,  "_sectionItemCollectionWithMediaEntities:indexBarItems:",  v13,  v14));
      v51 = self;
      if (-[TVHMediaEntitiesDataSource _canProvideMultipleSectionsForIndexTitlesWithIndexBarItems:]( self,  "_canProvideMultipleSectionsForIndexTitlesWithIndexBarItems:",  v14))
      {
        v46 = v12;
        v47 = v14;
        v49 = v10;
        BOOL v48 = v9;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v15 = v15;
        id v16 = -[TVHMediaEntitiesDataSourceSectionItemCollection countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v74,  v80,  16LL);
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v75;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v75 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)i);
              v21 = (void *)objc_claimAutoreleasedReturnValue([v20 indexTitle]);
              v22 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSection);
              v79 = v20;
              v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v79,  1LL));
              v24 = -[TVHMediaEntitiesDataSourceSection initWithIdentifier:fetchResultIdentifier:itemCollections:]( v22,  "initWithIdentifier:fetchResultIdentifier:itemCollections:",  v21,  v54,  v23);

              -[NSMutableArray addObject:](v52, "addObject:", v24);
            }

            id v17 = -[TVHMediaEntitiesDataSourceSectionItemCollection countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v74,  v80,  16LL);
          }

          while (v17);
        }

        a4 = v48;
        __int128 v14 = v47;
        id v7 = v52;
        uint64_t v8 = &qword_1000C3000;
        id v10 = v49;
        __int128 v12 = v46;
        goto LABEL_20;
      }

      a4 = v9;
      if (!-[TVHMediaEntitiesDataSourceSectionItemCollection count](v15, "count"))
      {
        id v7 = v52;
        goto LABEL_20;
      }

      v50 = v10;
      v29 = -[TVHMediaEntitiesDataSourceSection initWithIdentifier:fetchResultIdentifier:itemCollections:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSection),  "initWithIdentifier:fetchResultIdentifier:itemCollections:",  v54,  v54,  v15);
      v31 = v12;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
      -[TVHMediaEntitiesDataSourceSection setTitle:](v29, "setTitle:", v32);

      __int128 v12 = v31;
      id v7 = v52;
    }

    else
    {
      id v25 = [v13 count];
      a4 = v9;
      id v7 = v52;
      if (!v25) {
        goto LABEL_21;
      }
      v51 = self;
      __int128 v15 = -[TVHMediaEntitiesDataSourceSectionItemCollection initWithMediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSectionItemCollection),  "initWithMediaEntities:",  v53);
      v50 = v10;
      v26 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSection);
      v78 = v15;
      v27 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v78, 1LL));
      v29 = -[TVHMediaEntitiesDataSourceSection initWithIdentifier:fetchResultIdentifier:itemCollections:]( v26,  "initWithIdentifier:fetchResultIdentifier:itemCollections:",  v54,  v54,  v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue([v27 title]);
      -[TVHMediaEntitiesDataSourceSection setTitle:](v29, "setTitle:", v30);

      __int128 v12 = v27;
    }

    -[NSMutableArray addObject:](v7, "addObject:", v29);

    id v10 = v50;
LABEL_20:

    self = v51;
LABEL_21:

    if (a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_1000901B4;
  v72[3] = &unk_1000FF9A8;
  v72[4] = self;
  v73 = v7;
  [v6 enumerateObjectsUsingBlock:v72];

  __int128 v14 = 0LL;
  if (a4) {
    goto LABEL_24;
  }
LABEL_22:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource fetchResults](self, "fetchResults"));

  if (v33)
  {
    id v34 = objc_alloc_init(&OBJC_CLASS___TVHKCollectionComparator);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections"));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = v8[2];
    v69[2] = sub_100090324;
    v69[3] = &unk_1000FFA10;
    id v70 = v6;
    v71 = self;
    uint64_t v36 = objc_claimAutoreleasedReturnValue( [v34 changeSetFromObjects:v35 toObjects:v7 identifierBlock:&stru_1000FF9E8 amendChangeSetBlock:v69]);

    v37 = (void *)v36;
    unsigned int v38 = 1;
    goto LABEL_25;
  }

- (id)_sectionForIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource sections](self, "sections"));
  else {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
  }

  return v5;
}

- (BOOL)_isProvidingIndexTitles
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource itemCollectionDescriptors](self, "itemCollectionDescriptors"));
  if ([v3 count] == (id)1) {
    BOOL v4 = -[TVHMediaEntitiesDataSource provideIndexTitles](self, "provideIndexTitles");
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_hasIndexBarItems
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesDataSource indexBarItems](self, "indexBarItems"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_canProvideMultipleSectionsForIndexTitlesWithIndexBarItems:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[TVHMediaEntitiesDataSource _isProvidingIndexTitles](self, "_isProvidingIndexTitles")
    && -[TVHMediaEntitiesDataSource provideMultipleSectionsForIndexTitles]( self,  "provideMultipleSectionsForIndexTitles")
    && [v4 count] != 0;

  return v5;
}

- (BOOL)_isProvidingMultipleSectionsForIndexTitles
{
  if (-[TVHMediaEntitiesDataSource _isProvidingIndexTitles](self, "_isProvidingIndexTitles")
    && -[TVHMediaEntitiesDataSource provideMultipleSectionsForIndexTitles]( self,  "provideMultipleSectionsForIndexTitles"))
  {
    return -[TVHMediaEntitiesDataSource _hasIndexBarItems](self, "_hasIndexBarItems");
  }

  else
  {
    return 0;
  }

- (id)_indexBarItemsWithFetchResult:(id)a3
{
  id v4 = a3;
  if (-[TVHMediaEntitiesDataSource _isProvidingIndexTitles](self, "_isProvidingIndexTitles"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 indexBarItems]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"title"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));
    id v8 = [v6 count];
    if (v8 == [v7 count])
    {
      id v9 = v5;
    }

    else
    {
      id v10 = sub_100079DD8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009CEB8(v11);
      }

      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)_sectionItemCollectionWithMediaEntities:(id)a3 indexBarItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "subarrayWithRange:",  objc_msgSend(v13, "startIndex", (void)v19),  objc_msgSend(v13, "count")));
        __int128 v15 = -[TVHMediaEntitiesDataSourceSectionItemCollection initWithMediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceSectionItemCollection),  "initWithMediaEntities:",  v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
        -[TVHMediaEntitiesDataSourceSectionItemCollection setIndexTitle:](v15, "setIndexTitle:", v16);

        -[NSMutableArray addObject:](v7, "addObject:", v15);
      }

      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  id v17 = -[NSMutableArray copy](v7, "copy");
  return v17;
}

- (TVHChangeSetDataSourceContentProviderDelegate)changeSetDataSourceContentProviderDelegate
{
  return (TVHChangeSetDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_changeSetDataSourceContentProviderDelegate);
}

- (void)setChangeSetDataSourceContentProviderDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)itemCollectionDescriptors
{
  return self->_itemCollectionDescriptors;
}

- (TVHMediaEntitiesDataSourceDelegate)delegate
{
  return (TVHMediaEntitiesDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)provideIndexTitles
{
  return self->_provideIndexTitles;
}

- (void)setProvideIndexTitles:(BOOL)a3
{
  self->_provideIndexTitles = a3;
}

- (BOOL)provideMultipleSectionsForIndexTitles
{
  return self->_provideMultipleSectionsForIndexTitles;
}

- (void)setProvideMultipleSectionsForIndexTitles:(BOOL)a3
{
  self->_provideMultipleSectionsForIndexTitles = a3;
}

- (TVHSortOption)currentSortOption
{
  return self->_currentSortOption;
}

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (void)setFetchResults:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end