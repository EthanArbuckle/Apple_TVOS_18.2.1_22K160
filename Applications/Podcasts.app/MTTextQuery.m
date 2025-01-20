@interface MTTextQuery
- (id)titleForPodcastUuid:(id)a3;
- (void)runQueryWithText:(id)a3;
@end

@implementation MTTextQuery

- (void)runQueryWithText:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  0LL));
  v71[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  0LL));
  v71[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  1LL));
  v71[2] = v7;
  uint64_t v57 = kEpisodeTitle;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:"));
  v71[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 4LL));
  -[MTLibraryQuery setEpisodeSortDescriptors:](self, "setEpisodeSortDescriptors:", v9);

  uint64_t v55 = kPodcastTitle;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v10));
  v49 = self;
  -[MTLibraryQuery setPodcastSortDescriptors:](self, "setPodcastSortDescriptors:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v50 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v12]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByCharactersInSet:v14]);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v15;
  id v16 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v53 = *(void *)v67;
    uint64_t v52 = kPodcastDescription;
    uint64_t v18 = kEpisodeDescription;
    uint64_t v19 = kChannelName;
    uint64_t v20 = kChannelSubscriptionName;
    uint64_t v21 = kChannelShowCount;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v67 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v55,  v23));
        [v65 addObject:v24];

        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v52,  v23));
        [v64 addObject:v25];

        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v57,  v23));
        [v63 addObject:v26];

        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v18,  v23));
        [v62 addObject:v27];

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v19,  v23));
        [v61 addObject:v28];

        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K contains[cl] %@",  v20,  v23));
        [v60 addObject:v29];

        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K > %@",  v21,  &off_100254710));
        [v59 addObject:v30];
      }

      id v17 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }

    while (v17);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v65));
  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v64));
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v31, v32, 0LL));
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v34));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v33, v58, 0LL));
  v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v63));
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v62));

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v36, v37, 0LL));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v38));

  id v40 = v39;
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForEpisodesInSearchResults]( &OBJC_CLASS___MTEpisode,  "predicateForEpisodesInSearchResults"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v54, v40, 0LL));
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v41));

  v43 = (void *)objc_claimAutoreleasedReturnValue([v61 arrayByAddingObjectsFromArray:v59]);
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v43));

  v45 = (void *)objc_claimAutoreleasedReturnValue([v60 arrayByAddingObjectsFromArray:v59]);
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v45));

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v44, v46, 0LL));
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v47));

  -[MTLibraryQuery runQueryWithPodcastPredicate:episodePredicate:channelPredicate:]( v49,  "runQueryWithPodcastPredicate:episodePredicate:channelPredicate:",  v56,  v42,  v48);
}

- (id)titleForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100025F28;
  uint64_t v18 = sub_100025F38;
  id v19 = 0LL;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100026C70;
    v10[3] = &unk_100240558;
    id v6 = v5;
    id v11 = v6;
    id v12 = v3;
    v13 = &v14;
    [v6 performBlockAndWait:v10];

    v7 = (void *)v15[5];
  }

  else
  {
    v7 = 0LL;
  }

  id v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

@end