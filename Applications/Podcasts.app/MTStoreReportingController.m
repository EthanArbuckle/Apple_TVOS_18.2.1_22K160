@interface MTStoreReportingController
+ (id)reportingStringForPlayReason:(unint64_t)a3;
- (id)_dictionaryForPodcastUuid:(id)a3;
- (id)pageTypeForReportType:(int)a3;
- (void)recordMetricsEventForType:(int)a3 withData:(id)a4;
- (void)reportBrowse:(id)a3;
- (void)reportPlaybackFromStore:(id)a3 reason:(unint64_t)a4;
- (void)reportWithType:(int)a3 userInfo:(id)a4 location:(id)a5 reason:(unint64_t)a6;
@end

@implementation MTStoreReportingController

- (void)reportWithType:(int)a3 userInfo:(id)a4 location:(id)a5 reason:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a3;
  id v93 = a4;
  v10 = (__CFString *)a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  @"3",  @"v"));
  v12 = v11;
  if (v10) {
    v13 = v10;
  }
  else {
    v13 = &stru_100248948;
  }
  [v11 setObject:v13 forKey:@"pageLocation"];

  [v12 setObject:@"1" forKey:@"podcastType"];
  switch((int)v8)
  {
    case 0:
    case 1:
      v14 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kPodcastStoreCollectionId]);
      if ([v14 unsignedLongLongValue]) {
        [v12 setObject:v14 forKey:@"podcastId"];
      }
      uint64_t v15 = kPodcastTitle;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kPodcastTitle]);
      id v17 = [v16 length];

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v15]);
        [v12 setObject:v18 forKey:@"podcastName"];
      }

      uint64_t v19 = kPodcastUpdatedFeedUrl;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kPodcastUpdatedFeedUrl]);
      id v21 = [v20 length];

      if (v21
        || (uint64_t v19 = kPodcastFeedUrl,
            v22 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kPodcastFeedUrl]),
            id v23 = [v22 length],
            v22,
            v23))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v19]);
        [v12 setObject:v24 forKey:@"feedUrl"];
      }

      uint64_t v25 = kEpisodeGuid;
      v26 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeGuid]);
      id v27 = [v26 length];

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v25]);
        [v12 setObject:v28 forKey:@"episodeGuid"];
      }

      uint64_t v29 = kEpisodeEnclosureUrl;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeEnclosureUrl]);
      id v31 = [v30 length];

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v29]);
        [v12 setObject:v32 forKey:@"episodeUrl"];
      }

      uint64_t v33 = kEpisodeUti;
      v34 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeUti]);
      id v35 = [v34 length];

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v33]);
        [v12 setObject:v36 forKey:@"episodeType"];
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kMTEpisodeRestoreResultKey]);
      id v38 = [v37 length];

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kMTEpisodeRestoreResultKey]);
        [v12 setObject:v39 forKey:kMTEpisodeRestoreResultKey];
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kMTEpisodeRestoreTypeKey]);
      id v41 = [v40 length];

      if (v41)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kMTEpisodeRestoreTypeKey]);
        [v12 setObject:v42 forKey:kMTEpisodeRestoreTypeKey];
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v33]);
      unsigned __int8 v44 = [v43 isEqualToString:@"audio"];

      if ((v44 & 1) != 0)
      {
        v45 = @"episode";
      }

      else
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v33]);
        unsigned int v77 = [v76 isEqualToString:@"video"];

        if (!v77) {
          goto LABEL_57;
        }
        v45 = @"movie";
      }

      [v12 setObject:v45 forKey:@"episodeKind"];
      goto LABEL_57;
    case 2:
    case 3:
      uint64_t v46 = kEpisodeGuid;
      v47 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeGuid]);
      id v48 = [v47 length];

      if (v48)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v46]);
        [v12 setObject:v49 forKey:@"episodeGuid"];
      }

      uint64_t v50 = kEpisodeEnclosureUrl;
      v51 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeEnclosureUrl]);
      id v52 = [v51 length];

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v50]);
        [v12 setObject:v53 forKey:@"episodeUrl"];
      }

      uint64_t v54 = kEpisodeUti;
      v55 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodeUti]);
      unsigned __int8 v56 = [v55 isEqualToString:kUTTypeAudio];

      if ((v56 & 1) != 0)
      {
        v57 = @"episode";
      }

      else
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:v54]);
        unsigned int v79 = [v78 isEqualToString:kUTTypeMovie];

        if (!v79) {
          goto LABEL_49;
        }
        v57 = @"movie";
      }

      [v12 setObject:v57 forKey:@"episodeKind"];
LABEL_49:
      v80 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:kEpisodePodcastUuid]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController _dictionaryForPodcastUuid:](self, "_dictionaryForPodcastUuid:", v80));

      v67 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kPodcastStoreCollectionId]);
      if ([v67 unsignedLongLongValue]) {
        [v12 setObject:v67 forKey:@"podcastId"];
      }
      uint64_t v81 = kPodcastTitle;
      v82 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kPodcastTitle]);
      id v83 = [v82 length];

      if (v83)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v81]);
        [v12 setObject:v84 forKey:@"podcastName"];
      }

      uint64_t v85 = kPodcastUpdatedFeedUrl;
      v86 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kPodcastUpdatedFeedUrl]);
      id v87 = [v86 length];

      if (v87
        || (uint64_t v85 = kPodcastFeedUrl,
            v88 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:kPodcastFeedUrl]),
            id v89 = [v88 length],
            v88,
            v89))
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v85]);
        [v12 setObject:v90 forKey:@"feedUrl"];
      }

- (void)reportPlaybackFromStore:(id)a3 reason:(unint64_t)a4
{
  if (a3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryByDecomposingQueryStringWithURLDecode:", 1, a4));
    -[MTStoreReportingController recordMetricsEventForType:withData:]( self,  "recordMetricsEventForType:withData:",  2LL,  v5);
  }

- (void)reportBrowse:(id)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue([a3 dictionaryByDecomposingQueryStringWithURLDecode:1]);
    -[MTStoreReportingController recordMetricsEventForType:withData:]( self,  "recordMetricsEventForType:withData:",  5LL,  v4);
  }

- (id)_dictionaryForPodcastUuid:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_10001B30C;
  v18 = sub_10001B31C;
  id v19 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001B324;
  v10[3] = &unk_1002404B8;
  v13 = &v14;
  id v6 = v5;
  id v11 = v6;
  id v7 = v3;
  id v12 = v7;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)recordMetricsEventForType:(int)a3 withData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___IMAMSMetricsEvent);
  [v7 setEventType:@"reporting_event"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController pageTypeForReportType:](self, "pageTypeForReportType:", v4));
  [v7 setPageType:v8];

  objc_msgSend(v7, "im_addPropertiesWithDictionary:", v6);
  v9 = (void *)objc_opt_new(&OBJC_CLASS___IMAMSMetricsEvent);
  [v9 setEventType:@"reporting_event"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreReportingController pageTypeForReportType:](self, "pageTypeForReportType:", v4));
  [v9 setPageType:v10];

  objc_msgSend(v9, "im_addPropertiesWithDictionary:", v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AnalyticsIdentifierManager sharedInstance]( &OBJC_CLASS____TtC18PodcastsFoundation26AnalyticsIdentifierManager,  "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifierPromise]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001B4DC;
  v14[3] = &unk_100240880;
  id v15 = v9;
  id v13 = v9;
  [v12 addFinishBlock:v14];
}

- (id)pageTypeForReportType:(int)a3
{
  else {
    return off_1002408A0[a3 - 1];
  }
}

+ (id)reportingStringForPlayReason:(unint64_t)a3
{
  if (a3 > 0xF) {
    return @"unknown";
  }
  else {
    return off_1002408D0[a3];
  }
}

@end