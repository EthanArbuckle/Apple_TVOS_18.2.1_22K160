@interface MTEpisodeDeletionProcessor
- (id)entityName;
- (id)predicate;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
@end

@implementation MTEpisodeDeletionProcessor

- (id)predicate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForFeedDeleted:](&OBJC_CLASS___MTEpisode, "predicateForFeedDeleted:", 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  0LL,  0LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 AND:v3]);

  return v4;
}

- (id)entityName
{
  return kMTEpisodeEntityName;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v5 = a4;
  id v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = _MTLogCategoryDatabase(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deleting episodes matching deletion processor query: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v9 deleteEpisodeUuids:v5];
  }
}

@end