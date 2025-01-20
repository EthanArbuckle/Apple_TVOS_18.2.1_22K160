@interface MTPodcastDetailDataSource
+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4;
+ (id)sortDescriptorsForPodcastUuid:(id)a3;
- (BOOL)showOnlyRssContent;
- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3;
- (MTPodcastDetailDataSourceDelegate)delegate;
- (NSArray)sections;
- (NSString)podcastUuid;
- (id)createSectionForDarkPlacard;
- (id)createSectionForEmptyOverlay;
- (id)createSectionForFeed;
- (id)createSectionForIsFromiTunesSync;
- (id)createSectionForOtherEpisodes;
- (id)createSectionForPlayedToBeDeleted;
- (id)createSectionForUnplayed;
- (id)feedSections;
- (id)podcast;
- (id)savedSections;
- (id)unplayedSections;
- (unint64_t)indexForSection:(id)a3;
- (unint64_t)selectedTab;
- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7;
- (void)reloadData;
- (void)sectionDidChangeContent:(id)a3;
- (void)sectionWillChangeContent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedTab:(unint64_t)a3;
- (void)setShowOnlyRssContent:(BOOL)a3;
@end

@implementation MTPodcastDetailDataSource

- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTPodcastDetailDataSource;
  v6 = -[MTPodcastDetailDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    v7->_showOnlyRssContent = 0;
  }

  return v7;
}

- (void)setSelectedTab:(unint64_t)a3
{
  if (self->_selectedTab != a3 || !self->_sections)
  {
    self->_selectedTab = a3;
    -[MTPodcastDetailDataSource reloadData](self, "reloadData");
  }

- (void)setShowOnlyRssContent:(BOOL)a3
{
  self->_showOnlyRssContent = a3;
}

- (void)reloadData
{
  unint64_t selectedTab = self->_selectedTab;
  if (selectedTab == 2)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource savedSections](self, "savedSections"));
  }

  else if (selectedTab == 1)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource feedSections](self, "feedSections"));
  }

  else if (selectedTab)
  {
    v4 = 0LL;
  }

  else
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource unplayedSections](self, "unplayedSections"));
  }

  sections = self->_sections;
  self->_sections = v4;
}

- (id)podcast
{
  if (self->_podcastUuid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:self->_podcastUuid]);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (id)unplayedSections
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForDarkPlacard](self, "createSectionForDarkPlacard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForUnplayed](self, "createSectionForUnplayed", v3));
  v10[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForOtherEpisodes](self, "createSectionForOtherEpisodes"));
  v10[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForEmptyOverlay](self, "createSectionForEmptyOverlay"));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastDetailDataSource createSectionForPlayedToBeDeleted]( self,  "createSectionForPlayedToBeDeleted"));
  v10[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 5LL));

  return v8;
}

- (id)feedSections
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForDarkPlacard](self, "createSectionForDarkPlacard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForFeed](self, "createSectionForFeed", v3));
  v8[1] = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForEmptyOverlay](self, "createSectionForEmptyOverlay"));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 3LL));

  return v6;
}

- (id)savedSections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource createSectionForIsFromiTunesSync](self, "createSectionForIsFromiTunesSync"));
  id v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource sections](self, "sections"));
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (void)sectionWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
  [v5 sectionWillChangeContent:v4];
}

- (void)sectionDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
  [v5 sectionDidChangeContent:v4];
}

- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  unint64_t v14 = -[MTPodcastDetailDataSource indexForSection:](self, "indexForSection:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = (id)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/PodcastsTab/PodcastDetail/MTPodcastD etailDataSource.m", 145, @"Observed change for object %@ in section %@ but can't find the section index", v12, v13 lineNumber format];
  }

  else
  {
    unint64_t v15 = v14;
    if (a5 == -1LL) {
      uint64_t v16 = 0LL;
    }
    else {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a5,  v14));
    }
    id v19 = (id)v16;
    if (a7 == -1LL) {
      uint64_t v17 = 0LL;
    }
    else {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  a7,  v15));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource delegate](self, "delegate"));
    [v18 episodeSection:v13 didChangeObject:v12 atIndexPath:v19 forChangeType:a6 newIndexPath:v17];

    id v12 = v18;
    id v13 = (id)v17;
  }
}

+ (id)sortDescriptorsForPodcastUuid:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainQueueContext]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 podcastForUuid:v3]);
  if (v6) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortDescriptorsForSortOrder]);
  }
  else {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)createSectionForUnplayed
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  v7 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailUnplayedEpisodeSection);
  v8 = (void *)objc_opt_class(self);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 sortDescriptorsForPodcastUuid:v9]);
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v10);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 1LL);
  id v11 = [(id)objc_opt_class(self) predicateForPodcast:v6 sectionType:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v12);

  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForOtherEpisodes
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  v7 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  if (v6)
  {
    id v8 = [(id)objc_opt_class(self) predicateForPodcast:v6 sectionType:3];
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);
  }

  v10 = (void *)objc_opt_class(self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sortDescriptorsForPodcastUuid:v11]);
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"OTHER_EPISODES_SECTION" value:&stru_100248948 table:0]);
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 3LL);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForEmptyOverlay
{
  v2 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 0LL));
  -[MTPodcastDetailEpisodeSection setPredicate:](v2, "setPredicate:", v3);

  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v2, "setSortDescriptors:", &__NSArray0__struct);
  -[MTPodcastDetailEpisodeSection setSectionType:](v2, "setSectionType:", 8LL);
  return v2;
}

- (id)createSectionForDarkPlacard
{
  v2 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 0LL));
  -[MTPodcastDetailEpisodeSection setPredicate:](v2, "setPredicate:", v3);

  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v2, "setSortDescriptors:", &__NSArray0__struct);
  -[MTPodcastDetailEpisodeSection setSectionType:](v2, "setSectionType:", 10LL);
  return v2;
}

- (id)createSectionForPlayedToBeDeleted
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  v7 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  id v8 = [(id)objc_opt_class(self) predicateForPodcast:v6 sectionType:4];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);

  v10 = (void *)objc_opt_class(self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sortDescriptorsForPodcastUuid:v11]);
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"Played Episodes to be Deleted" value:&stru_100248948 table:0]);
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 4LL);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForIsFromiTunesSync
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  v7 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  id v8 = [(id)objc_opt_class(self) predicateForPodcast:v6 sectionType:7];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);

  v10 = (void *)objc_opt_class(self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sortDescriptorsForPodcastUuid:v11]);
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"From Your Computer" value:&stru_100248948 table:0]);
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 7LL);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

- (id)createSectionForFeed
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  v7 = objc_opt_new(&OBJC_CLASS___MTPodcastDetailEpisodeSection);
  id v8 = [(id)objc_opt_class(self) predicateForPodcast:v6 sectionType:6];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (self->_showOnlyRssContent)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](&OBJC_CLASS___MTEpisode, "predicateForRSSEpisodes"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 AND:v10]);

    objc_super v9 = (void *)v11;
  }

  -[MTPodcastDetailEpisodeSection setPredicate:](v7, "setPredicate:", v9);
  id v12 = (void *)objc_opt_class(self);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailDataSource podcastUuid](self, "podcastUuid"));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 sortDescriptorsForPodcastUuid:v13]);
  -[MTPodcastDetailEpisodeSection setSortDescriptors:](v7, "setSortDescriptors:", v14);

  -[MTPodcastDetailEpisodeSection setSectionType:](v7, "setSectionType:", 6LL);
  -[MTPodcastDetailEpisodeSection setTitle:](v7, "setTitle:", 0LL);
  -[MTPodcastDetailEpisodeSection setDelegate:](v7, "setDelegate:", self);
  -[MTPodcastDetailEpisodeSection loadData](v7, "loadData");

  return v7;
}

+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = 0LL;
  id v7 = [v5 deletePlayedEpisodesResolvedValue];
  switch(a4)
  {
    case 1uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:",  v8,  v7));
      goto LABEL_12;
    case 3uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:",  v10,  v7));

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:",  v11,  v8,  v7));

      goto LABEL_13;
    case 4uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:]( &OBJC_CLASS___MTEpisode,  "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:",  v8,  v7));
      goto LABEL_12;
    case 6uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesInFeedForPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesInFeedForPodcastUuid:",  v8));
      goto LABEL_12;
    case 7uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:",  v8));
      goto LABEL_12;
    case 9uLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:]( &OBJC_CLASS___MTEpisode,  "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:",  v8,  0LL,  v7,  0LL));
      goto LABEL_12;
    case 0xBuLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 nextEpisodeUuid]);
      if (v8) {
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuid:", v8));
      }
      else {
        uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
      }
LABEL_12:
      id v6 = (void *)v9;
      goto LABEL_13;
    case 0xCuLL:
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForAllEpisodesOnPodcastUuid:]( &OBJC_CLASS___MTEpisode,  "predicateForAllEpisodesOnPodcastUuid:",  v8));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForVisuallyPlayed:]( &OBJC_CLASS___MTEpisode,  "predicateForVisuallyPlayed:",  0LL));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 AND:v13]);

LABEL_13:
      break;
    default:
      break;
  }

  return v6;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (MTPodcastDetailDataSourceDelegate)delegate
{
  return (MTPodcastDetailDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedTab
{
  return self->_selectedTab;
}

- (BOOL)showOnlyRssContent
{
  return self->_showOnlyRssContent;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end