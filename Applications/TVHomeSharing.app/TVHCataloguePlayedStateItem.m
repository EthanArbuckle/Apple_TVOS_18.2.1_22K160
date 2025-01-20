@interface TVHCataloguePlayedStateItem
+ (id)new;
- (BOOL)isHideable;
- (BOOL)isRemoveable;
- (BOOL)shouldDisplay;
- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4;
- (NSMutableArray)playedStateGroups;
- (NSString)fetchRequestIdentifier;
- (NSString)identifier;
- (NSString)title;
- (TVHCataloguePlayedStateItem)init;
- (TVHCataloguePlayedStateItem)initWithTitle:(id)a3 fetchRequestIdentifier:(id)a4;
- (TVHCataloguePlayedStateRelatedContent)playedStateRelatedContent;
- (TVHCatalogueRelatedContent)relatedContent;
- (TVHMediaEntitiesDataSource)partiallyPlayedMediaEntitiesDataSource;
- (TVHMediaEntitiesDataSource)unplayedMediaEntitiesDataSource;
- (id)_mediaEntitiesDataSourceFetchResultWithGroup:(id)a3 changeSet:(id)a4;
- (id)_mediaEntitiesDataSourceForIdentfier:(id)a3;
- (void)_updateMediaEntitiesDataSourceWithGroup:(id)a3 changeSet:(id)a4;
@end

@implementation TVHCataloguePlayedStateItem

+ (id)new
{
  return 0LL;
}

- (TVHCataloguePlayedStateItem)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHCataloguePlayedStateItem)initWithTitle:(id)a3 fetchRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TVHCataloguePlayedStateItem;
  v8 = -[TVHCataloguePlayedStateItem init](&v37, "init");
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)[v7 copy];
    fetchRequestIdentifier = v8->_fetchRequestIdentifier;
    v8->_fetchRequestIdentifier = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    playedStateGroups = v8->_playedStateGroups;
    v8->_playedStateGroups = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  @"TVHPlayedStateGroupTitleValueTransformer"));
    v19 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 transformedValue:&off_100105FA0]);
    -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v19, "setTitle:", v20);
    v21 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
    v22 = (void *)objc_claimAutoreleasedReturnValue([&off_100105FA0 stringValue]);
    v39 = v19;
    id v36 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
    v24 = -[TVHMediaEntitiesDataSource initWithIdentifier:itemCollectionDescriptors:initialSortOption:]( v21,  "initWithIdentifier:itemCollectionDescriptors:initialSortOption:",  v22,  v23,  0LL);
    unplayedMediaEntitiesDataSource = v8->_unplayedMediaEntitiesDataSource;
    v8->_unplayedMediaEntitiesDataSource = v24;

    v26 = -[TVHMediaEntitiesDataSourceItemCollectionDescriptor initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceItemCollectionDescriptor),  "initWithFetchResultIdentifier:",  v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 transformedValue:&off_100105FB8]);
    -[TVHMediaEntitiesDataSourceItemCollectionDescriptor setTitle:](v26, "setTitle:", v27);
    v28 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
    v29 = (void *)objc_claimAutoreleasedReturnValue([&off_100105FB8 stringValue]);
    v38 = v26;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    v31 = -[TVHMediaEntitiesDataSource initWithIdentifier:itemCollectionDescriptors:initialSortOption:]( v28,  "initWithIdentifier:itemCollectionDescriptors:initialSortOption:",  v29,  v30,  0LL);
    partiallyPlayedMediaEntitiesDataSource = v8->_partiallyPlayedMediaEntitiesDataSource;
    v8->_partiallyPlayedMediaEntitiesDataSource = v31;

    id v6 = v36;
    v33 = -[TVHCataloguePlayedStateRelatedContent initWithUnplayedMediaEntitiesDataSource:partiallyPlayedMediaEntitiesDataSource:]( objc_alloc(&OBJC_CLASS___TVHCataloguePlayedStateRelatedContent),  "initWithUnplayedMediaEntitiesDataSource:partiallyPlayedMediaEntitiesDataSource:",  v8->_unplayedMediaEntitiesDataSource,  v8->_partiallyPlayedMediaEntitiesDataSource);
    playedStateRelatedContent = v8->_playedStateRelatedContent;
    v8->_playedStateRelatedContent = v33;
  }

  return v8;
}

- (TVHCatalogueRelatedContent)relatedContent
{
  return (TVHCatalogueRelatedContent *)self->_playedStateRelatedContent;
}

- (BOOL)shouldDisplay
{
  return 1;
}

- (BOOL)isHideable
{
  return 0;
}

- (BOOL)isRemoveable
{
  return 0;
}

- (BOOL)updateWithMediaEntitiesFetchResponse:(id)a3 fetchResponseChangeSet:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 groupings]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 groupingChangeSets]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"playedState"]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCataloguePlayedStateItem playedStateRelatedContent](self, "playedStateRelatedContent"));
  id v11 = [v10 mediaEntitiesCount];
  id v12 = v11;
  if (v9)
  {
    id v23 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 groups]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"playedState"]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deleteChange]);
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v15 sourceIndexes]);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100031B98;
      v30[3] = &unk_1000FDB60;
      v30[4] = self;
      [v17 enumerateIndexesUsingBlock:v30];
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCataloguePlayedStateItem playedStateGroups](self, "playedStateGroups"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100031C2C;
    v27[3] = &unk_1000FDB88;
    id v28 = v13;
    v29 = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100031D50;
    v24[3] = &unk_1000FDBB0;
    id v25 = v28;
    v26 = self;
    id v19 = v28;
    objc_msgSend( v18,  "tvhk_applyChangeSetIfAvailable:destinationObjectsBlock:amendObjectBlock:replaceContentsOnNilChangeSet:",  v14,  v27,  v24,  1);

    id v12 = v23;
  }

  else
  {
    id v20 = sub_100079DD8();
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_10009C284((os_log_t)v14);
    }
  }

  BOOL v21 = v12 != [v10 mediaEntitiesCount];
  return v21;
}

- (void)_updateMediaEntitiesDataSourceWithGroup:(id)a3 changeSet:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHCataloguePlayedStateItem _mediaEntitiesDataSourceFetchResultWithGroup:changeSet:]( self,  "_mediaEntitiesDataSourceFetchResultWithGroup:changeSet:",  v6,  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHCataloguePlayedStateItem _mediaEntitiesDataSourceForIdentfier:]( self,  "_mediaEntitiesDataSourceForIdentfier:",  v8));
  id v11 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v9 updateWithMediaEntitiesDataSourceFetchResults:v10];
}

- (id)_mediaEntitiesDataSourceFetchResultWithGroup:(id)a3 changeSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCataloguePlayedStateItem fetchRequestIdentifier](self, "fetchRequestIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntities]);
  id v11 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( v8,  "initWithIdentifier:mediaEntities:",  v9,  v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 indexBarItems]);
  -[TVHMediaEntitiesDataSourceFetchResult setIndexBarItems:](v11, "setIndexBarItems:", v12);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v11, "setChangeSet:", v6);
  return v11;
}

- (id)_mediaEntitiesDataSourceForIdentfier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHCataloguePlayedStateItem playedStateRelatedContent](self, "playedStateRelatedContent"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 unplayedMediaEntitiesDataSource]);
  v22[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 partiallyPlayedMediaEntitiesDataSource]);
  v22[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (void)v17));
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)fetchRequestIdentifier
{
  return self->_fetchRequestIdentifier;
}

- (TVHCataloguePlayedStateRelatedContent)playedStateRelatedContent
{
  return self->_playedStateRelatedContent;
}

- (TVHMediaEntitiesDataSource)unplayedMediaEntitiesDataSource
{
  return self->_unplayedMediaEntitiesDataSource;
}

- (TVHMediaEntitiesDataSource)partiallyPlayedMediaEntitiesDataSource
{
  return self->_partiallyPlayedMediaEntitiesDataSource;
}

- (NSMutableArray)playedStateGroups
{
  return self->_playedStateGroups;
}

- (void).cxx_destruct
{
}

@end