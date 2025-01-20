@interface ICMusicLibraryArtistAffinityAnalyzer
- (id)_requestItemProperties;
- (id)aggregateLibraryRecommendationMetricsFromSnapshots:(id)a3;
- (id)createFeatureProviderDictionaryFromNewContentResponse:(id)a3 withLibraryArtistSnapshots:(id)a4;
- (void)performLibraryAnalysisFromResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)performLibraryAnalysisWithCompletionHandler:(id)a3;
@end

@implementation ICMusicLibraryArtistAffinityAnalyzer

- (void)performLibraryAnalysisFromResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)sub_10002D894());
  [v8 setLabel:@"LibraryRecommendationArtistAffinity"];
  id v9 = [sub_10002D948() kindWithVariants:3];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setItemKind:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryArtistAffinityAnalyzer _requestItemProperties](self, "_requestItemProperties"));
  [v8 setItemProperties:v11];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002DD8C;
  v14[3] = &unk_1001A2378;
  objc_copyWeak(&v17, &location);
  v14[4] = self;
  id v12 = v6;
  id v15 = v12;
  id v13 = v7;
  id v16 = v13;
  [v8 performWithResponseHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (id)createFeatureProviderDictionaryFromNewContentResponse:(id)a3 withLibraryArtistSnapshots:(id)a4
{
  id v91 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v5 count])
  {
    unint64_t v7 = 0LL;
    do
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v7]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 artistAdamID]));
      [v6 setObject:v9 forKey:v10];

      ++v7;
    }

    while ((unint64_t)[v5 count] > v7);
  }

  v87 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v86 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v88 = v5;
  v76 = v6;
  obj = (char *)[v91 artistContentsCount];
  if (obj)
  {
    for (i = 0LL; i != obj; ++i)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v91 artistContentAtIndex:i]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 adamId]));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v13]);
      id v15 = v14;
      if (v14)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", (int)objc_msgSend( v14,  "intValue")));
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        __int128 v114 = 0u;
        __int128 v115 = 0u;
        v96 = v16;
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueAlbums]);
        id v82 = [v17 countByEnumeratingWithState:&v112 objects:v123 count:16];
        if (v82)
        {
          uint64_t v18 = *(void *)v113;
          v92 = v12;
          v89 = v13;
          v84 = v17;
          uint64_t v80 = *(void *)v113;
          do
          {
            v19 = 0LL;
            do
            {
              if (*(void *)v113 != v18) {
                objc_enumerationMutation(v17);
              }
              v20 = *(void **)(*((void *)&v112 + 1) + 8LL * (void)v19);
              __int128 v108 = 0u;
              __int128 v109 = 0u;
              __int128 v110 = 0u;
              __int128 v111 = 0u;
              v21 = (void *)objc_claimAutoreleasedReturnValue([v12 catalogContents]);
              id v22 = [v21 countByEnumeratingWithState:&v108 objects:v122 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v109;
                while (2)
                {
                  for (j = 0LL; j != v23; j = (char *)j + 1)
                  {
                    if (*(void *)v109 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v108 + 1) + 8LL * (void)j);
                    id v27 = [v20 storeAdamID];
                    if (v27 == [v26 adamId])
                    {

                      id v5 = v88;
                      id v13 = v89;
                      id v6 = v76;
                      id v12 = v92;
                      goto LABEL_24;
                    }
                  }

                  id v23 = [v21 countByEnumeratingWithState:&v108 objects:v122 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              v19 = (char *)v19 + 1;
              id v17 = v84;
              id v6 = v76;
              id v12 = v92;
              id v13 = v89;
              uint64_t v18 = v80;
            }

            while (v19 != v82);
            id v5 = v88;
            id v82 = [v84 countByEnumeratingWithState:&v112 objects:v123 count:16];
          }

          while (v82);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", i));
        -[NSMutableArray addObject:](v87, "addObject:", v28);

        -[NSMutableArray addObject:](v86, "addObject:", v15);
LABEL_24:
      }
    }
  }

  v29 = v87;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[NSMutableArray count](v87, "count")));
  v121[0] = v30;
  v121[1] = &off_1001B3AD8;
  uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 2LL));
  id v107 = 0LL;
  v85 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v31,  131104LL,  &v107);
  id v32 = v107;
  id v106 = v32;
  v83 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v31,  131104LL,  &v106);
  id v33 = v106;

  id v105 = v33;
  v81 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v31,  131104LL,  &v105);
  id v34 = v105;

  id v104 = v34;
  v79 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v31,  131104LL,  &v104);
  id v35 = v104;

  id v103 = v35;
  v93 = (void *)v31;
  v78 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v31,  65600LL,  &v103);
  id v97 = v103;

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v77 = v30;
  if ([v30 unsignedLongValue])
  {
    unint64_t v37 = 0LL;
    do
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v29, "objectAtIndex:", v37));
      signed int v39 = [v38 intValue];

      v90 = (void *)objc_claimAutoreleasedReturnValue([v91 artistContentAtIndex:v39]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v90 catalogContentAtIndex:0]);
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 contentFeatures]);

      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      id obja = v41;
      id v42 = [obja countByEnumeratingWithState:&v99 objects:v120 count:16];
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void *)v100;
        do
        {
          for (k = 0LL; k != v43; k = (char *)k + 1)
          {
            if (*(void *)v100 != v44) {
              objc_enumerationMutation(obja);
            }
            v46 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)k);
            v47 = (void *)objc_claimAutoreleasedReturnValue([v46 key]);
            if (!v37)
            {
              v48 = objc_alloc(&OBJC_CLASS___MLMultiArray);
              id v98 = v97;
              v49 = -[MLMultiArray initWithShape:dataType:error:]( v48,  "initWithShape:dataType:error:",  v93,  65600LL,  &v98);
              id v50 = v98;

              [v36 setObject:v49 forKey:v47];
              id v97 = v50;
            }

            v51 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:v47]);
            [v46 valueAtIndex:0];
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
            [v51 setObject:v52 atIndexedSubscript:v37];
          }

          id v43 = [obja countByEnumeratingWithState:&v99 objects:v120 count:16];
        }

        while (v43);
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v86, "objectAtIndex:", v37));
      signed int v54 = [v53 intValue];

      id v5 = v88;
      v55 = (void *)objc_claimAutoreleasedReturnValue([v88 objectAtIndex:v54]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v55 uniqueDatesWithAddedContent]);
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v56 count]));
      -[MLMultiArray setObject:atIndexedSubscript:](v85, "setObject:atIndexedSubscript:", v57, v37);

      v58 = (void *)objc_claimAutoreleasedReturnValue([v55 uniqueAlbums]);
      v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v58 count]));
      -[MLMultiArray setObject:atIndexedSubscript:](v83, "setObject:atIndexedSubscript:", v59, v37);

      v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v55 cumulativePlayCount]));
      -[MLMultiArray setObject:atIndexedSubscript:](v81, "setObject:atIndexedSubscript:", v60, v37);

      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v55 daysSinceLastPlayedDate]));
      -[MLMultiArray setObject:atIndexedSubscript:](v79, "setObject:atIndexedSubscript:", v61, v37);

      [v55 averagePlaysPerItemAdded];
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[MLMultiArray setObject:atIndexedSubscript:](v78, "setObject:atIndexedSubscript:", v62, v37);

      ++v37;
      v29 = v87;
    }

    while ((unint64_t)[v77 unsignedLongValue] > v37);
  }

  id v63 = -[NSMutableArray count](v29, "count");
  if (v63 != (id)-[MLMultiArray count](v85, "count")) {
    __assert_rtn( "-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]",  "ICMusicLibraryArtistAffinityAnalyzer.m",  163,  "releaseIx.count == daysWithAdds.count");
  }
  id v64 = -[NSMutableArray count](v29, "count");
  if (v64 != (id)-[MLMultiArray count](v83, "count")) {
    __assert_rtn( "-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]",  "ICMusicLibraryArtistAffinityAnalyzer.m",  164,  "releaseIx.count == albumCount.count");
  }
  id v65 = -[NSMutableArray count](v29, "count");
  if (v65 != (id)-[MLMultiArray count](v81, "count")) {
    __assert_rtn( "-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]",  "ICMusicLibraryArtistAffinityAnalyzer.m",  165,  "releaseIx.count == playCount.count");
  }
  id v66 = -[NSMutableArray count](v29, "count");
  if (v66 != (id)-[MLMultiArray count](v79, "count")) {
    __assert_rtn( "-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]",  "ICMusicLibraryArtistAffinityAnalyzer.m",  166,  "releaseIx.count == daysSinceLastPlay.count");
  }
  id v67 = -[NSMutableArray count](v29, "count");
  if (v67 != (id)-[MLMultiArray count](v78, "count")) {
    __assert_rtn( "-[ICMusicLibraryArtistAffinityAnalyzer createFeatureProviderDictionaryFromNewContentResponse:withLibraryArtistSnapshots:]",  "ICMusicLibraryArtistAffinityAnalyzer.m",  167,  "releaseIx.count == playsPerItem.count");
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v69 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    v119 = v85;
    _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MLModel inputs: unique days with added content: %{public}@",  buf,  0x16u);
  }

  [v68 setValue:v85 forKey:@"days_with_adds"];
  v70 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    v119 = v83;
    _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MLModel inputs: number of unique albums: %{public}@",  buf,  0x16u);
  }

  [v68 setValue:v83 forKey:@"num_albums"];
  v71 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    v119 = v81;
    _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MLModel inputs: cumulative song play count: %{public}@",  buf,  0x16u);
  }

  [v68 setValue:v81 forKey:@"num_plays"];
  v72 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    v119 = v79;
    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MLModel inputs: number of days since last play: %{public}@",  buf,  0x16u);
  }

  [v68 setValue:v79 forKey:@"days_since_last_play"];
  v73 = os_log_create("com.apple.amp.itunescloudd", "LibraryRecommendations");
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v117 = self;
    __int16 v118 = 2114;
    v119 = v78;
    _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MLModel inputs: average plays per item added: %{public}@",  buf,  0x16u);
  }

  [v68 setValue:v78 forKey:@"plays_per_item"];
  [v68 addEntriesFromDictionary:v36];
  [v68 setValue:v29 forKey:@"release_ix"];

  return v68;
}

- (void)performLibraryAnalysisWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)sub_10002D894());
  [v5 setLabel:@"LibraryRecommendationArtistAffinity"];
  id v6 = [sub_10002D948() kindWithVariants:3];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v5 setItemKind:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryArtistAffinityAnalyzer _requestItemProperties](self, "_requestItemProperties"));
  [v5 setItemProperties:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002D9FC;
  v10[3] = &unk_1001A23A0;
  v10[4] = self;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  id v11 = v9;
  [v5 performWithResponseHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)aggregateLibraryRecommendationMetricsFromSnapshots:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v29 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v30 = *(void *)v34;
    uint64_t v31 = v4;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        if ([v9 isValid])
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue([v9 artistMetadataDescriptor]);
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llu",  [v10 storeAdamID]));

          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](v4, "valueForKey:", v11));
          if (v12)
          {
            objc_msgSend( v12,  "setCumulativePlayCount:",  (char *)objc_msgSend(v9, "playCount") + (void)objc_msgSend(v12, "cumulativePlayCount"));
            objc_msgSend( v12,  "setCumulativeSkipCount:",  (char *)objc_msgSend(v9, "skipCount") + (void)objc_msgSend(v12, "cumulativeSkipCount"));
            id v13 = (ICMusicLibraryArtistAffinitySnapshot *)objc_claimAutoreleasedReturnValue([v9 albumMetadataDescriptor]);
            v14 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueAlbums]);
            unsigned __int8 v15 = [v14 containsObject:v13];

            if ((v15 & 1) == 0)
            {
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueAlbums]);
              [v16 addObject:v13];
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 songMetadataDescriptor]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueSongs]);
            unsigned __int8 v19 = [v18 containsObject:v17];

            if ((v19 & 1) == 0)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueSongs]);
              [v20 addObject:v17];
            }

            v21 = (void *)objc_claimAutoreleasedReturnValue([v9 libraryAddedDate]);
            if (v21)
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v29, "components:fromDate:", 28LL, v21));
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 uniqueDatesWithAddedContent]);
              [v23 addObject:v22];
            }

            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPlayedDate]);
            if (v24)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPlayedDate]);
              v26 = (void *)objc_claimAutoreleasedReturnValue([v25 laterDate:v24]);

              [v12 setLastPlayedDate:v26];
            }

            uint64_t v7 = v30;
            id v4 = v31;
          }

          else
          {
            id v13 = -[ICMusicLibraryArtistAffinitySnapshot initWithContentItemSnapshot:]( objc_alloc(&OBJC_CLASS___ICMusicLibraryArtistAffinitySnapshot),  "initWithContentItemSnapshot:",  v9);
            -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", v13, v11);
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v6);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v4, "allValues"));
  return v27;
}

- (id)_requestItemProperties
{
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  v2 = (id *)qword_1001DB5D8;
  uint64_t v66 = qword_1001DB5D8;
  if (!qword_1001DB5D8)
  {
    id v3 = sub_10002D618();
    v2 = (id *)dlsym(v3, "MPModelRelationshipSongArtist");
    v64[3] = (uint64_t)v2;
    qword_1001DB5D8 = (uint64_t)v2;
  }

  _Block_object_dispose(&v63, 8);
  if (!v2)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelRelationshipSongArtist(void)"));
    objc_msgSend( v43,  "handleFailureInFunction:file:lineNumber:description:",  v44,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  34,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v4 = *v2;
  v71[0] = v4;
  id v5 = sub_10002D71C();
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  id v6 = (id *)qword_1001DB5E8;
  uint64_t v66 = qword_1001DB5E8;
  if (!qword_1001DB5E8)
  {
    uint64_t v7 = sub_10002D618();
    id v6 = (id *)dlsym(v7, "MPModelPropertyArtistName");
    v64[3] = (uint64_t)v6;
    qword_1001DB5E8 = (uint64_t)v6;
  }

  _Block_object_dispose(&v63, 8);
  if (!v6)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertyArtistName(void)"));
    objc_msgSend( v45,  "handleFailureInFunction:file:lineNumber:description:",  v46,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  27,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v8 = *v6;
  id v70 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 propertySetWithProperties:v9]);
  v72[0] = v10;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  id v11 = (id *)qword_1001DB5F0;
  uint64_t v66 = qword_1001DB5F0;
  if (!qword_1001DB5F0)
  {
    id v12 = sub_10002D618();
    id v11 = (id *)dlsym(v12, "MPModelRelationshipSongAlbum");
    v64[3] = (uint64_t)v11;
    qword_1001DB5F0 = (uint64_t)v11;
  }

  _Block_object_dispose(&v63, 8);
  if (!v11)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelRelationshipSongAlbum(void)"));
    objc_msgSend( v47,  "handleFailureInFunction:file:lineNumber:description:",  v48,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  35,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v13 = *v11;
  v71[1] = v13;
  id v14 = sub_10002D71C();
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  unsigned __int8 v15 = (id *)qword_1001DB5F8;
  uint64_t v66 = qword_1001DB5F8;
  if (!qword_1001DB5F8)
  {
    id v16 = sub_10002D618();
    unsigned __int8 v15 = (id *)dlsym(v16, "MPModelPropertyAlbumTitle");
    v64[3] = (uint64_t)v15;
    qword_1001DB5F8 = (uint64_t)v15;
  }

  _Block_object_dispose(&v63, 8);
  if (!v15)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertyAlbumTitle(void)"));
    objc_msgSend( v49,  "handleFailureInFunction:file:lineNumber:description:",  v50,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  26,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v69 = *v15;
  id v17 = v69;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v69, 1LL));
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 propertySetWithProperties:v18]);
  v72[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  2LL));

  id v21 = objc_alloc((Class)sub_10002D71C());
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  id v22 = (id *)qword_1001DB600;
  uint64_t v66 = qword_1001DB600;
  if (!qword_1001DB600)
  {
    id v23 = sub_10002D618();
    id v22 = (id *)dlsym(v23, "MPModelPropertySongTitle");
    v64[3] = (uint64_t)v22;
    qword_1001DB600 = (uint64_t)v22;
  }

  _Block_object_dispose(&v63, 8);
  if (!v22)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongTitle(void)"));
    objc_msgSend( v51,  "handleFailureInFunction:file:lineNumber:description:",  v52,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  29,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v24 = *v22;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  v25 = (id *)qword_1001DB608;
  uint64_t v66 = qword_1001DB608;
  v67[0] = v24;
  if (!qword_1001DB608)
  {
    v26 = sub_10002D618();
    v25 = (id *)dlsym(v26, "MPModelPropertySongPlayCount");
    v64[3] = (uint64_t)v25;
    qword_1001DB608 = (uint64_t)v25;
  }

  _Block_object_dispose(&v63, 8);
  if (!v25)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    signed int v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongPlayCount(void)"));
    objc_msgSend( v53,  "handleFailureInFunction:file:lineNumber:description:",  v54,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  30,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v27 = *v25;
  v67[1] = v27;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  v28 = (id *)qword_1001DB610;
  uint64_t v66 = qword_1001DB610;
  if (!qword_1001DB610)
  {
    v29 = sub_10002D618();
    v28 = (id *)dlsym(v29, "MPModelPropertySongSkipCount");
    v64[3] = (uint64_t)v28;
    qword_1001DB610 = (uint64_t)v28;
  }

  _Block_object_dispose(&v63, 8);
  if (!v28)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongSkipCount(void)"));
    objc_msgSend( v55,  "handleFailureInFunction:file:lineNumber:description:",  v56,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  31,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v30 = *v28;
  v67[2] = v30;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  uint64_t v31 = (id *)qword_1001DB618;
  uint64_t v66 = qword_1001DB618;
  if (!qword_1001DB618)
  {
    id v32 = sub_10002D618();
    uint64_t v31 = (id *)dlsym(v32, "MPModelPropertySongLastDevicePlaybackDate");
    v64[3] = (uint64_t)v31;
    qword_1001DB618 = (uint64_t)v31;
  }

  _Block_object_dispose(&v63, 8);
  if (!v31)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongLastDevicePlaybackDate(void)"));
    objc_msgSend( v57,  "handleFailureInFunction:file:lineNumber:description:",  v58,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  28,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v33 = *v31;
  v67[3] = v33;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  __int128 v34 = (id *)qword_1001DB620;
  uint64_t v66 = qword_1001DB620;
  if (!qword_1001DB620)
  {
    __int128 v35 = sub_10002D618();
    __int128 v34 = (id *)dlsym(v35, "MPModelPropertySongLibraryAddedDate");
    v64[3] = (uint64_t)v34;
    qword_1001DB620 = (uint64_t)v34;
  }

  _Block_object_dispose(&v63, 8);
  if (!v34)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongLibraryAddedDate(void)"));
    objc_msgSend( v59,  "handleFailureInFunction:file:lineNumber:description:",  v60,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  32,  @"%s",  dlerror());

    goto LABEL_42;
  }

  id v36 = *v34;
  v67[4] = v36;
  uint64_t v63 = 0LL;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  unint64_t v37 = (id *)qword_1001DB628;
  uint64_t v66 = qword_1001DB628;
  if (!qword_1001DB628)
  {
    v38 = sub_10002D618();
    unint64_t v37 = (id *)dlsym(v38, "MPModelPropertySongUserRating");
    v64[3] = (uint64_t)v37;
    qword_1001DB628 = (uint64_t)v37;
  }

  _Block_object_dispose(&v63, 8);
  if (!v37)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getMPModelPropertySongUserRating(void)"));
    objc_msgSend( v61,  "handleFailureInFunction:file:lineNumber:description:",  v62,  @"ICMusicLibraryArtistAffinityAnalyzer.m",  33,  @"%s",  dlerror());

LABEL_42:
    __break(1u);
  }

  id v68 = *v37;
  id v39 = v68;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 6LL));

  id v41 = [v21 initWithProperties:v40 relationships:v20];
  return v41;
}

@end