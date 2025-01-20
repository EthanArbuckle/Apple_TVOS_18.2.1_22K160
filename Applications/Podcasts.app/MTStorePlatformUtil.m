@interface MTStorePlatformUtil
+ (BOOL)isAValue:(id)a3;
+ (BOOL)isExplicitForStorePlatformDictionary:(id)a3;
+ (id)_genreNameForStoreItemDictionary:(id)a3;
+ (id)_offerNameForOfferFlavor:(id)a3;
+ (id)_storeDownloadArtworkArrayForStoreItemDictionary:(id)a3;
+ (id)_storeDownloadOffersForStoreItemDictionary:(id)a3;
+ (id)_storeOfferDownloadDictionaryForStoreOfferItemDictionary:(id)a3;
+ (id)_unmodifiedTitleForStoreItemDictionary:(id)a3;
+ (id)artworkDictionary:(id)a3 closestToSize:(double)a4;
+ (id)dateFromFormattedString:(id)a3;
+ (id)encodedQueryStringFromDictionary:(id)a3;
+ (id)formatDate:(id)a3;
+ (id)latestEpisodeDictionaryFromPodcastDictionary:(id)a3;
+ (id)pubDateFromStoreMediaDictionary:(id)a3;
+ (id)storeDownloadDictionaryFromStorePlatformDictionary:(id)a3;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 isNotSubscribeable:(BOOL)a5;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5;
+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5 isNotSubscribeable:(BOOL)a6;
+ (id)stringFromDictionary:(id)a3 forKey:(id)a4;
@end

@implementation MTStorePlatformUtil

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4
{
  return _[a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:0 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 isNotSubscribeable:(BOOL)a5
{
  return [a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:0 restricted:a5 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5
{
  return [a1 storeMediaDictionaryFromStorePlatformDictionary:a3 artworkSize:a5 restricted:0 isNotSubscribeable:a4];
}

+ (id)storeMediaDictionaryFromStorePlatformDictionary:(id)a3 artworkSize:(double)a4 restricted:(BOOL *)a5 isNotSubscribeable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = [a1 isExplicitForStorePlatformDictionary:v10];
  if (!(_DWORD)v11
    || (+[PFRestrictionsController isExplicitContentAllowed]( &OBJC_CLASS___PFRestrictionsController,  "isExplicitContentAllowed") & 1) != 0)
  {
    BOOL v61 = v6;
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"offers"]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"download"]);

    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"url"]);
    if (![v16 length])
    {
      v43 = 0LL;
LABEL_71:

      goto LABEL_72;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, @"assetURL");
    uint64_t v17 = objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v10 forKey:@"feedUrl"]);
    if (v17) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v17, kPodcastFeedUrl);
    }
    v70 = (void *)v17;
    uint64_t v18 = objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v10 forKey:@"collectionName"]);
    if (v18) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v18,  @"podcastTitle");
    }
    v72 = v15;
    v75 = (void *)v18;
    uint64_t v19 = objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v10 forKey:@"name"]);
    if (v19) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v19,  @"episodeTitle");
    }
    v74 = (void *)v19;
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"description"]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v20 forKey:@"standard"]);
    if (![v21 length])
    {
      uint64_t v22 = objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v20 forKey:@"short"]);

      v21 = (void *)v22;
    }

    if ([v21 length]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v21,  @"episodeDescription");
    }
    uint64_t v23 = objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v10 forKey:@"url"]);
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v23));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v24,  @"episodeShareUrl");
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"id"]);
    v77 = (void *)objc_claimAutoreleasedReturnValue([v25 stringValue]);
    if (v25) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v25, @"episodeId");
    }
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"podcastEpisodeGuid"]);
    if (v26) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v26,  @"episodeGuid");
    }
    v65 = (void *)v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"collectionId"]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v27 stringValue]);
    if (v27) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v27, @"podcastId");
    }
    v66 = v25;
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"artistName"]);
    if (v28) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v28, @"artistName");
    }
    v63 = (void *)v28;
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"releaseDate"]);
    uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString);
    v73 = (void *)v29;
    if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([a1 formatDate:v29]);
      if (v31) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v31, kEpisodePubDate);
      }
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"artwork"]);
    v67 = (void *)v23;
    v62 = v32;
    if (v32)
    {
      v33 = v32;
      if ([v32 count])
      {
        uint64_t v34 = objc_claimAutoreleasedReturnValue([a1 artworkDictionary:v33 closestToSize:a4]);
        v35 = (void *)v34;
        if (v34)
        {
          uint64_t v78 = v34;
          v36 = v21;
          uint64_t v37 = v20;
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v78,  1LL));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v38,  @"artworkURL");

          uint64_t v20 = v37;
          v21 = v36;
        }
      }
    }

    v69 = (void *)v20;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v39, @"explicit");

    v40 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"isNotSubscribeable"]);
    v41 = v40;
    v68 = v21;
    if (v40) {
      unint64_t v42 = (unint64_t)[v40 BOOLValue];
    }
    else {
      unint64_t v42 = v61;
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v42));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v44,  @"isNotSubscribeable");

    v45 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"offers"]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v45 firstObject]);

    v71 = v16;
    v64 = v27;
    if (!v46)
    {
      v53 = 0LL;
      v54 = &stru_100248948;
      v55 = v75;
LABEL_56:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v54, kEpisodeUti);
      v57 = (void *)objc_claimAutoreleasedReturnValue([a1 stringFromDictionary:v10 forKey:@"artistId"]);
      v58 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if ([a1 isAValue:v76]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v76,  @"podcastId");
      }
      if ([a1 isAValue:v55]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v55,  @"podcastName");
      }
      if ([a1 isAValue:@"1"]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  @"1",  @"podcastType");
      }
      if ([a1 isAValue:v74]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v74,  @"episodeName");
      }
      if ([a1 isAValue:v77]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v77,  @"episodeId");
      }
      if ([a1 isAValue:v53]) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  v53,  @"episodeKind");
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", @"3", @"v");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v58,  "setObject:forKeyedSubscript:",  @"ntc",  @"pageLocation");
      v59 = (void *)objc_claimAutoreleasedReturnValue([a1 encodedQueryStringFromDictionary:v58]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v59,  @"reportParams");

      v43 = v12;
      v16 = v71;
      v15 = v72;
      goto LABEL_71;
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"assets"]);
    v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);

    if (!v48)
    {
      v53 = 0LL;
      v54 = &stru_100248948;
LABEL_55:
      v55 = v75;

      goto LABEL_56;
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"duration"]);
    if (v49) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v49, @"duration");
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"flavor"]);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v50 == v51)
    {
      v53 = 0LL;
      v54 = &stru_100248948;
LABEL_54:

      goto LABEL_55;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:@"flavor"]);
    if ([v52 rangeOfString:@"Video"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v52 rangeOfString:@"Audio"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v53 = 0LL;
        v54 = &stru_100248948;
LABEL_53:

        goto LABEL_54;
      }

      v53 = @"episode";
      v56 = (id *)&kUTTypeAudio;
    }

    else
    {
      v53 = @"movie";
      v56 = (id *)&kUTTypeVideo;
    }

    v54 = (__CFString *)*v56;
    goto LABEL_53;
  }

  v43 = 0LL;
  if (a5) {
    *a5 = 1;
  }
LABEL_72:

  return v43;
}

+ (BOOL)isExplicitForStorePlatformDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contentRating"]);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contentRatingsBySystem"]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"riaa"]);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"rank"]);
  BOOL v7 = (uint64_t)[v6 integerValue] > 1;

  return v7;
}

+ (id)latestEpisodeDictionaryFromPodcastDictionary:(id)a3
{
  id v3 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", @"childrenIds", 0));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * v8) stringValue]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"children"]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v11 = 0LL;
  }

  return v11;
}

+ (id)artworkDictionary:(id)a3 closestToSize:(double)a4
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v21;
    double v10 = 1.79769313e308;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", @"height", (void)v20));
        [v13 floatValue];
        double v15 = v14;
        if (v15 == a4)
        {
          id v18 = v12;

          goto LABEL_15;
        }

        double v16 = vabdd_f64(v15, a4);
        if (v16 < v10)
        {
          id v17 = v12;

          double v10 = v16;
          id v8 = v17;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  id v8 = v8;
  id v18 = v8;
LABEL_15:

  return v18;
}

+ (BOOL)isAValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNull, v4);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

    char v7 = isKindOfClass ^ 1;
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

+ (id)stringFromDictionary:(id)a3 forKey:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:a4]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector(v5, "stringValue") & 1) != 0)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue([v5 stringValue]);
      goto LABEL_6;
    }

+ (id)encodedQueryStringFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v11]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 stringByAddingPercentEscapesUsingEncoding:1]);
        float v14 = (void *)v13;
        if ((v9 & 1) != 0) {
          double v15 = @"%@=%@";
        }
        else {
          double v15 = @"&%@=%@";
        }
        -[NSMutableString appendFormat:](v4, "appendFormat:", v15, v11, v13, (void)v17);

        char v9 = 0;
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      char v9 = 0;
    }

    while (v7);
  }

  return v4;
}

+ (id)formatDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_1002B6AB8;
  if (!qword_1002B6AB8)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    id v6 = (void *)qword_1002B6AB8;
    qword_1002B6AB8 = (uint64_t)v5;

    [(id)qword_1002B6AB8 setDateFormat:@"yyyy-MM-dd"];
    id v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    uint64_t v8 = (void *)qword_1002B6AC0;
    qword_1002B6AC0 = (uint64_t)v7;

    [(id)qword_1002B6AC0 setDateStyle:2];
    uint64_t v4 = (void *)qword_1002B6AB8;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dateFromString:v3]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002B6AC0 stringFromDate:v9]);

  return v10;
}

+ (id)dateFromFormattedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_1002B6AC8;
  if (!qword_1002B6AC8)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    id v6 = (void *)qword_1002B6AC8;
    qword_1002B6AC8 = (uint64_t)v5;

    [(id)qword_1002B6AC8 setDateStyle:2];
    uint64_t v4 = (void *)qword_1002B6AC8;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dateFromString:v3]);

  return v7;
}

+ (id)pubDateFromStoreMediaDictionary:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kEpisodePubDate]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 dateFromFormattedString:v4]);

  return v5;
}

+ (id)storeDownloadDictionaryFromStorePlatformDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v5 setObject:@"episode" forKeyedSubscript:@"episode-kind"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"collectionId"]);
  [v5 setObject:v6 forKeyedSubscript:@"collection-id"];

  [v5 setObject:@"podcast-episode" forKeyedSubscript:@"type"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"artistName"]);
  [v5 setObject:v7 forKeyedSubscript:@"artist-name"];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a1 _genreNameForStoreItemDictionary:v4]);
  [v5 setObject:v8 forKeyedSubscript:@"genre-name"];

  char v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"collectionName"]);
  [v5 setObject:v9 forKeyedSubscript:@"collection-name"];

  double v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _unmodifiedTitleForStoreItemDictionary:v4]);
  [v5 setObject:v10 forKeyedSubscript:@"unmodified-title"];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"id"]);
  [v5 setObject:v11 forKeyedSubscript:@"item-id"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"id"]);
  [v5 setObject:v12 forKeyedSubscript:@"itemId"];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"url"]);
  [v5 setObject:v13 forKeyedSubscript:@"url"];

  float v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"releaseDate"]);
  [v5 setObject:v14 forKeyedSubscript:@"release-date"];

  double v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"podcastEpisodeGuid"]);
  [v5 setObject:v15 forKeyedSubscript:@"episode-guid"];

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"description"]);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"standard"]);
  [v5 setObject:v17 forKeyedSubscript:@"longDescription"];

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"feedUrl"]);
  [v5 setObject:v18 forKeyedSubscript:@"podcast-feed-url"];

  [v5 setObject:@"1" forKeyedSubscript:@"podcast-type-dzc"];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 _storeDownloadOffersForStoreItemDictionary:v4]);
  [v5 setObject:v19 forKeyedSubscript:@"store-offers"];

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([a1 _storeDownloadArtworkArrayForStoreItemDictionary:v4]);
  [v5 setObject:v20 forKeyedSubscript:@"artwork-urls"];

  id v21 = [v5 copy];
  return v21;
}

+ (id)_storeDownloadArtworkArrayForStoreItemDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"artwork"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mt_compactMap:", &stru_100243810));

  return v4;
}

+ (id)_genreNameForStoreItemDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"genres"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);

  return v5;
}

+ (id)_unmodifiedTitleForStoreItemDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"rawName"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"name"]);

  if ([v4 length]) {
    id v6 = v4;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

+ (id)_storeDownloadOffersForStoreItemDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"offers"]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 _storeOfferDownloadDictionaryForStoreOfferItemDictionary:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)]);
        if (v11) {
          [v5 addEntriesFromDictionary:v11];
        }

        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

+ (id)_storeOfferDownloadDictionaryForStoreOfferItemDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"type"]);
  if ([v5 isEqualToString:@"anonymousDownload"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"download"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"url"]);

    if (v7)
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"assets"]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"duration"]);
      double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v10 setObject:v7 forKeyedSubscript:@"asset-url"];
      if (v9) {
        [v10 setObject:v9 forKeyedSubscript:@"duration"];
      }
      id v11 = [v10 copy];
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"flavor"]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _offerNameForOfferFlavor:v12]);
      __int128 v17 = v13;
      id v18 = v11;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    }

    else
    {
      __int128 v14 = 0LL;
    }
  }

  else
  {
    __int128 v14 = 0LL;
  }

  return v14;
}

+ (id)_offerNameForOfferFlavor:(id)a3
{
  id v3 = a3;
  if ([v3 localizedCaseInsensitiveContainsString:@"video"])
  {
    id v4 = @"standard-video";
  }

  else
  {
    id v4 = @"standard-audio";
    if (([v3 localizedCaseInsensitiveContainsString:@"audio"] & 1) == 0)
    {
      id v4 = @"document";
      if (([v3 localizedCaseInsensitiveContainsString:@"booklet"] & 1) == 0
        && ![v3 localizedCaseInsensitiveContainsString:@"document"])
      {
        id v4 = @"standard-audio";
      }
    }
  }

  return (id)v4;
}

@end