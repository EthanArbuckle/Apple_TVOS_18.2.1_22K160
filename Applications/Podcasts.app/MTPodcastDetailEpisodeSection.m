@interface MTPodcastDetailEpisodeSection
+ (id)dependentPropertyKeys;
- (BOOL)showTitleWithNoEpisodes;
- (MTFetchedResultsControllerProtocol)frc;
- (MTPodcastDetailEpisodeSectionDelegate)delegate;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)title;
- (id)episodes;
- (unint64_t)indexOfEpisode:(id)a3;
- (unint64_t)sectionType;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)initializeFrc;
- (void)setDelegate:(id)a3;
- (void)setFrc:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSectionType:(unint64_t)a3;
- (void)setShowTitleWithNoEpisodes:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTPodcastDetailEpisodeSection

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( &off_100255188,  "objectAtIndexedSubscript:",  -[MTPodcastDetailEpisodeSection sectionType](self, "sectionType")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection episodes](self, "episodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Section: %@ (%lu)",  v3,  [v4 count]));

  return (NSString *)v5;
}

- (NSString)title
{
  if (self->_showTitleWithNoEpisodes
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection episodes](self, "episodes")),
        id v4 = [v3 count],
        v3,
        v4))
  {
    v5 = self->_title;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setPredicate:(id)a3
{
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)initializeFrc
{
  if (!self->_frc)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
    id v4 = -[NSFetchRequest initWithEntityName:](v3, "initWithEntityName:", kMTEpisodeEntityName);
    -[NSFetchRequest setPredicate:](v4, "setPredicate:", self->_predicate);
    -[NSFetchRequest setSortDescriptors:](v4, "setSortDescriptors:", self->_sortDescriptors);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

    id v7 = [[MTFetchedResultsController alloc] initWithFetchRequest:v4 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];
    id v8 = [(id)objc_opt_class(self) dependentPropertyKeys];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v7 setPropertyKeys:v9];

    [v7 setDelegate:self];
    id v13 = 0LL;
    unsigned int v10 = [v7 performFetch:&v13];
    id v11 = v13;
    v12 = v11;
    if (v10) {
      -[MTPodcastDetailEpisodeSection setFrc:](self, "setFrc:", v7);
    }
    else {
      [v11 logAndThrow:1];
    }
  }

+ (id)dependentPropertyKeys
{
  v3[0] = kEpisodeUuid;
  v3[1] = kEpisodeGuid;
  v3[2] = kEpisodeTitle;
  v3[3] = kEpisodeCleanedTitle;
  v3[4] = kEpisodeDescription;
  v3[5] = kEpisodeEnclosureUrl;
  v3[6] = kEpisodeFeedDeleted;
  v3[7] = kEpisodeAssetURL;
  v3[8] = kEpisodeSuppressAutoDownload;
  v3[9] = kEpisodePubDate;
  v3[10] = kEpisodeDuration;
  v3[11] = kEpisodeAudio;
  v3[12] = kEpisodeVideo;
  v3[13] = kEpisodeExternalType;
  v3[14] = kEpisodeUti;
  v3[15] = kEpisodeExplicit;
  v3[16] = kEpisodeIsFromiTunesSync;
  v3[17] = kEpisodePlayState;
  v3[18] = kEpisodePlayStateManuallySet;
  v3[19] = kEpisodeBackCatalog;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  20LL));
}

- (id)episodes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection frc](self, "frc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchedObjects]);

  return v3;
}

- (unint64_t)indexOfEpisode:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection frc](self, "frc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 indexPathForObject:v4]);

  if (v6) {
    unint64_t v7 = (unint64_t)[v6 row];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = v14;
  if (!v13)
  {
    uint64_t v16 = -1LL;
    if (v14) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = -1LL;
    goto LABEL_6;
  }

  uint64_t v16 = (uint64_t)[v13 row];
  if (!v15) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v17 = (uint64_t)[v15 row];
LABEL_6:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate"));
  [v18 episodeSection:self didChangeObject:v12 atIndex:v16 forChangeType:a6 newIndex:v17];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3));
  [v4 sectionWillChangeContent:self];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastDetailEpisodeSection delegate](self, "delegate", a3));
  [v4 sectionDidChangeContent:self];
}

- (void)setTitle:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)showTitleWithNoEpisodes
{
  return self->_showTitleWithNoEpisodes;
}

- (void)setShowTitleWithNoEpisodes:(BOOL)a3
{
  self->_showTitleWithNoEpisodes = a3;
}

- (MTPodcastDetailEpisodeSectionDelegate)delegate
{
  return (MTPodcastDetailEpisodeSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end