@interface TVHMediaEntitiesPlayedStateDataSource
+ (TVHMediaEntitiesPlayedStateDataSource)new;
- (NSArray)indexTitles;
- (NSOrderedSet)sectionIdentifiers;
- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate;
- (TVHMediaEntitiesPlayedStateDataSource)init;
- (TVHMediaEntitiesPlayedStateDataSource)initWithUnplayedDataSource:(id)a3 partiallyPlayedDataSource:(id)a4 shelfViewControllerBlock:(id)a5;
- (TVHMediaEntitiesPlayedStateDataSourceItem)partiallyPlayedItem;
- (TVHMediaEntitiesPlayedStateDataSourceItem)unplayedItem;
- (id)_displayableItems;
- (id)_itemForIndexPath:(id)a3;
- (id)_items;
- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)mediaEntitiesShelfViewControllerAtIndexPath:(id)a3;
- (id)mediaEntitiesShelfViewControllerForItemIdentifier:(id)a3;
- (id)sectionTitleAIndex:(unint64_t)a3;
- (void)_notfiyDiffableDataSourceContentProviderDelegateMediaEntitiesDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4;
- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4;
- (void)setDiffableDataSourceContentProviderDelegate:(id)a3;
- (void)setPartiallyPlayedItem:(id)a3;
- (void)setUnplayedItem:(id)a3;
@end

@implementation TVHMediaEntitiesPlayedStateDataSource

+ (TVHMediaEntitiesPlayedStateDataSource)new
{
  return 0LL;
}

- (TVHMediaEntitiesPlayedStateDataSource)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesPlayedStateDataSource)initWithUnplayedDataSource:(id)a3 partiallyPlayedDataSource:(id)a4 shelfViewControllerBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesPlayedStateDataSource;
  v11 = -[TVHMediaEntitiesPlayedStateDataSource init](&v17, "init");
  if (v11)
  {
    [v8 setDelegate:v11];
    v12 = -[TVHMediaEntitiesPlayedStateDataSourceItem initWithMediaEntitiesDataSource:shelfViewControllerBlock:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesPlayedStateDataSourceItem),  "initWithMediaEntitiesDataSource:shelfViewControllerBlock:",  v8,  v10);
    unplayedItem = v11->_unplayedItem;
    v11->_unplayedItem = v12;

    [v9 setDelegate:v11];
    v14 = -[TVHMediaEntitiesPlayedStateDataSourceItem initWithMediaEntitiesDataSource:shelfViewControllerBlock:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesPlayedStateDataSourceItem),  "initWithMediaEntitiesDataSource:shelfViewControllerBlock:",  v9,  v10);
    partiallyPlayedItem = v11->_partiallyPlayedItem;
    v11->_partiallyPlayedItem = v14;
  }

  return v11;
}

- (id)mediaEntitiesShelfViewControllerAtIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _itemForIndexPath:](self, "_itemForIndexPath:", a3));
  v4 = v3;
  if (v3) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 shelfViewController]);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (id)mediaEntitiesShelfViewControllerForItemIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _items](self, "_items", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v11 shelfViewController]);

          id v8 = (void *)v14;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4
{
}

- (NSOrderedSet)sectionIdentifiers
{
  return +[NSOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithObject:",  @"PlayedStateSection");
}

- (id)sectionTitleAIndex:(unint64_t)a3
{
  return 0LL;
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _displayableItems](self, "_displayableItems", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) identifier]);
        -[NSMutableOrderedSet addObject:](v4, "addObject:", v10);

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _itemForIndexPath:](self, "_itemForIndexPath:", a3));
  id v4 = v3;
  if (v3) {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (NSArray)indexTitles
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)indexPathForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  return 0LL;
}

- (id)_items
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource partiallyPlayedItem](self, "partiallyPlayedItem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource unplayedItem](self, "unplayedItem"));
  v7[0] = v3;
  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));

  return v5;
}

- (id)_displayableItems
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _items](self, "_items", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  id v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (void)_notfiyDiffableDataSourceContentProviderDelegateMediaEntitiesDidChangeWithAnimateChanges:(BOOL)a3 itemIdentifiersOfAmendedItems:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesPlayedStateDataSource diffableDataSourceContentProviderDelegate]( self,  "diffableDataSourceContentProviderDelegate"));
  [v7 diffableDataSourceContentProvider:self contentDidChangeWithAnimateChanges:v4 itemIdentifiersOfAmendedItems:v6];
}

- (id)_itemForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateDataSource _displayableItems](self, "_displayableItems"));
    id v7 = [v4 item];
    if (v7 >= [v6 count]) {
      id v5 = 0LL;
    }
    else {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v7]);
    }
  }

  return v5;
}

- (TVHDiffableDataSourceContentProviderDelegate)diffableDataSourceContentProviderDelegate
{
  return (TVHDiffableDataSourceContentProviderDelegate *)objc_loadWeakRetained((id *)&self->_diffableDataSourceContentProviderDelegate);
}

- (void)setDiffableDataSourceContentProviderDelegate:(id)a3
{
}

- (TVHMediaEntitiesPlayedStateDataSourceItem)unplayedItem
{
  return self->_unplayedItem;
}

- (void)setUnplayedItem:(id)a3
{
}

- (TVHMediaEntitiesPlayedStateDataSourceItem)partiallyPlayedItem
{
  return self->_partiallyPlayedItem;
}

- (void)setPartiallyPlayedItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end