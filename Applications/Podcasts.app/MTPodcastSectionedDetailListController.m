@interface MTPodcastSectionedDetailListController
- (BOOL)hasEmptySection;
- (BOOL)hasEpisodesInTheFeed;
- (BOOL)hasEpisodesToBeDeleted;
- (BOOL)hasItems;
- (BOOL)hasOnlyToBeDeletedItems;
- (BOOL)hasUnplayedEpisodes;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (MTPodcastDetailDataSource)dataSource;
- (MTPodcastSectionedDetailListController)initWithPodcastUUID:(id)a3;
- (NSString)podcastUUID;
- (id)createEmptySectionCell;
- (id)frc;
- (id)indexPathForObject:(id)a3;
- (id)indexPathsForEpisode:(id)a3;
- (id)messageForEmptySection;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)sectionForIndex:(int64_t)a3;
- (id)sectionForType:(unint64_t)a3;
- (id)sections;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)indexForSection:(id)a3;
- (unint64_t)sectionIndexForType:(unint64_t)a3;
- (unint64_t)sectionTypeForIndex:(unint64_t)a3;
- (unint64_t)sectionTypeForIndexPath:(id)a3;
- (unint64_t)selectedTab;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)playEpisodeAtIndexPath:(id)a3;
- (void)reloadData;
- (void)reloadSectionForDarkPlacardIfNeeded;
- (void)reloadSectionForEmptyOverlayIfNeeded;
- (void)reloadSectionHeaderForSection:(id)a3;
- (void)sectionDidChangeContent:(id)a3;
- (void)sectionWillChangeContent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)switchToTab:(unint64_t)a3;
@end

@implementation MTPodcastSectionedDetailListController

- (MTPodcastSectionedDetailListController)initWithPodcastUUID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTPodcastSectionedDetailListController;
  v6 = -[MTTVEpisodeListViewController initWithCompositeFetchedResultsController:]( &v11,  "initWithCompositeFetchedResultsController:",  0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUUID, a3);
    v8 = -[MTPodcastDetailDataSource initWithPodcastUuid:]( objc_alloc(&OBJC_CLASS___MTPodcastDetailDataSource),  "initWithPodcastUuid:",  v5);
    dataSource = v7->_dataSource;
    v7->_dataSource = v8;

    -[MTPodcastDetailDataSource setDelegate:](v7->_dataSource, "setDelegate:", v7);
  }

  return v7;
}

- (void)reloadData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
  [v3 reloadData];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006D150;
  v4[3] = &unk_10023FF98;
  v4[4] = self;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v4);
  -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", 0LL);
}

- (void)playEpisodeAtIndexPath:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playEpisodeUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playEpisodeUuid:",  v3));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  [v5 playManifest:v4 reason:3];
}

- (unint64_t)selectedTab
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
  id v3 = [v2 selectedTab];

  return (unint64_t)v3;
}

- (void)switchToTab:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
  [v5 setSelectedTab:a3];

  -[MTPodcastSectionedDetailListController reloadData](self, "reloadData");
}

- (id)sections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sections]);

  return v3;
}

- (id)frc
{
  return 0LL;
}

- (BOOL)hasItems
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)i) episodes]);
        id v7 = [v6 count];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (BOOL)hasEmptySection
{
  if (-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab")) {
    return 0;
  }
  else {
    return -[MTPodcastSectionedDetailListController hasOnlyToBeDeletedItems](self, "hasOnlyToBeDeletedItems");
  }
}

- (BOOL)hasOnlyToBeDeletedItems
{
  return -[MTPodcastSectionedDetailListController hasEpisodesToBeDeleted](self, "hasEpisodesToBeDeleted")
      && !-[MTPodcastSectionedDetailListController hasUnplayedEpisodes](self, "hasUnplayedEpisodes");
}

- (BOOL)hasUnplayedEpisodes
{
  if (-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab")) {
    return 0;
  }
  BOOL v3 = 1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", 1LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
  id v6 = [v5 count];

  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", 3LL));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 episodes]);
    BOOL v3 = [v8 count] != 0;
  }

  return v3;
}

- (BOOL)hasEpisodesToBeDeleted
{
  if (-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab")) {
    return 0;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", 4LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (BOOL)hasEpisodesInTheFeed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", 6LL));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episodes]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastSectionedDetailListController sectionForIndex:]( self,  "sectionForIndex:",  [v4 section]));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 episodes]);
    id v8 = [v5 row];
    if (v8 >= [v7 count]) {
      __int128 v9 = 0LL;
    }
    else {
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
    }
  }

  else
  {
    __int128 v9 = 0LL;
  }

  return v9;
}

- (id)indexPathForObject:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController indexPathsForEpisode:](self, "indexPathsForEpisode:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (id)reuseIdentifierForRow:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastSectionedDetailListController sectionForIndex:]( self,  "sectionForIndex:",  [v4 section]));
  if ([v5 sectionType] == (id)8)
  {
    id v6 = @"EmptySectionCell";
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___MTPodcastSectionedDetailListController;
    id v7 = -[MTTVEpisodeListViewController reuseIdentifierForRow:](&v9, "reuseIdentifierForRow:", v4);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"EmptySectionCell"])
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController createEmptySectionCell](self, "createEmptySectionCell"));
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MTPodcastSectionedDetailListController;
    id v5 = -[MTTVEpisodeListViewController newCellInstanceWithReuseIdentifier:]( &v8,  "newCellInstanceWithReuseIdentifier:",  v4);
  }

  id v6 = v5;

  return v6;
}

- (id)createEmptySectionCell
{
  BOOL v3 = -[MTNoContentTableViewCell initWithReuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTNoContentTableViewCell),  "initWithReuseIdentifier:",  @"EmptySectionCell");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController messageForEmptySection](self, "messageForEmptySection"));
  -[MTNoContentTableViewCell setMessage:](v3, "setMessage:", v4);

  return v3;
}

- (id)messageForEmptySection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"PODCASTS_EMPTY_UNPLAYED" value:&stru_100248948 table:0]);

  return v3;
}

- (unint64_t)sectionTypeForIndexPath:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastSectionedDetailListController sectionForIndex:]( self,  "sectionForIndex:",  [a3 section]));
  id v4 = [v3 sectionType];

  return (unint64_t)v4;
}

- (id)sectionForIndex:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections"));
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    objc_super v8 = 0LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
  }

  return v8;
}

- (id)sectionForType:(unint64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v9 sectionType] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v10 = 0LL;
LABEL_11:

  return v10;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections"));
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (unint64_t)sectionIndexForType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", a3));
  unint64_t v5 = -[MTPodcastSectionedDetailListController indexForSection:](self, "indexForSection:", v4);

  return v5;
}

- (unint64_t)sectionTypeForIndex:(unint64_t)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForIndex:](self, "sectionForIndex:", a3));
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 sectionType];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)indexPathsForEpisode:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006DBE4;
  v12[3] = &unk_100242490;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v12];

  objc_super v9 = v14;
  id v10 = v7;

  return v10;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sections](self, "sections", a3));
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForIndex:](self, "sectionForIndex:", a4));
  if ([v5 sectionType] == (id)8)
  {
    int64_t v6 = -[MTPodcastSectionedDetailListController hasEmptySection](self, "hasEmptySection");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 episodes]);
    int64_t v6 = (int64_t)[v7 count];
  }

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForIndex:](self, "sectionForIndex:", a4));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);

  return v5;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 reuseIdentifier]);
  unsigned int v12 = [v11 isEqualToString:@"EmptySectionCell"];

  if (v12)
  {
    if ((objc_opt_respondsToSelector(v8, "setContentInset:") & 1) != 0)
    {
      -[MTTVEpisodeListViewController _layoutMargins](self, "_layoutMargins");
      objc_msgSend(v8, "setContentInset:");
    }
  }

  else
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MTEpisode);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___MTPodcastSectionedDetailListController;
      -[MTTVEpisodeListViewController configureCell:withObject:atIndexPath:]( &v14,  "configureCell:withObject:atIndexPath:",  v8,  v9,  v10);
    }
  }
}

- (void)sectionWillChangeContent:(id)a3
{
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    [v4 beginUpdates];
  }

- (void)reloadSectionForEmptyOverlayIfNeeded
{
  unint64_t v3 = -[MTPodcastSectionedDetailListController sectionIndexForType:](self, "sectionIndexForType:", 8LL);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v4));
    [v6 reloadSections:v5 withRowAnimation:0];
  }

- (void)reloadSectionForDarkPlacardIfNeeded
{
  unint64_t v3 = -[MTPodcastSectionedDetailListController sectionIndexForType:](self, "sectionIndexForType:", 10LL);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v4));
    [v6 reloadSections:v5 withRowAnimation:0];
  }

- (void)sectionDidChangeContent:(id)a3
{
  id v4 = a3;
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    -[MTPodcastSectionedDetailListController reloadSectionHeaderForSection:](self, "reloadSectionHeaderForSection:", v4);
    -[MTPodcastSectionedDetailListController reloadSectionForEmptyOverlayIfNeeded]( self,  "reloadSectionForEmptyOverlayIfNeeded");
    -[MTPodcastSectionedDetailListController reloadSectionForDarkPlacardIfNeeded]( self,  "reloadSectionForDarkPlacardIfNeeded");
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    [v5 endUpdates];

    if (v4)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
      id v7 = [v6 count];

      if (v7)
      {
        -[MTTVListViewController updateListStateAnimated:](self, "updateListStateAnimated:", 0LL);
      }

      else
      {
        dispatch_time_t v8 = dispatch_time(0LL, 500000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10006E118;
        block[3] = &unk_10023FF98;
        block[4] = self;
        dispatch_after(v8, &_dispatch_main_q, block);
      }
    }
  }
}

- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v26 = a4;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
  if (!-[MTTVFetchedTableWithSectionsViewController changeIsUserDriven](self, "changeIsUserDriven"))
  {
    switch(a6)
    {
      case 1uLL:
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
        __int128 v15 = v13;
        v16 = v14;
        uint64_t v17 = 0LL;
        goto LABEL_7;
      case 2uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v18 withRowAnimation:0];

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v19 cellForRowAtIndexPath:v11]);

        uint64_t v20 = objc_opt_class(&OBJC_CLASS___MTEpisodeCell);
        if ((objc_opt_isKindOfClass(v14, v20) & 1) != 0) {
          [v14 dismissActionSheetsAndPopovers];
        }
        goto LABEL_8;
      case 3uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v11));
        [v13 deleteRowsAtIndexPaths:v21 withRowAnimation:5];

        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));
        __int128 v15 = v13;
        v16 = v14;
        uint64_t v17 = 5LL;
LABEL_7:
        [v15 insertRowsAtIndexPaths:v16 withRowAnimation:v17];
        goto LABEL_8;
      case 4uLL:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 indexPathsForVisibleRows]);
        unsigned int v24 = [v23 containsObject:v11];

        if (!v24) {
          break;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v25 cellForRowAtIndexPath:v11]);

        if (v26 && v14) {
          -[MTPodcastSectionedDetailListController configureCell:withObject:atIndexPath:]( self,  "configureCell:withObject:atIndexPath:",  v14,  v26,  v11);
        }
LABEL_8:

        break;
      default:
        break;
    }
  }
}

- (void)reloadSectionHeaderForSection:(id)a3
{
  id v13 = a3;
  unint64_t v4 = -[MTPodcastSectionedDetailListController indexForSection:](self, "indexForSection:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 headerViewForSection:v5]);

    dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v13 title]);
    id v10 = (void *)v9;
    if (v8)
    {
      if (![v8 compare:v9 options:1])
      {
LABEL_5:

        goto LABEL_6;
      }
    }

    else if (!v9)
    {
      goto LABEL_5;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v5));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController tableView](self, "tableView"));
    [v12 reloadSections:v11 withRowAnimation:0];

    goto LABEL_5;
  }

- (NSString)podcastUUID
{
  return self->_podcastUUID;
}

- (MTPodcastDetailDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end