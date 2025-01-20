@interface MTSubscribeUtil
+ (BOOL)isSubscribedToPodcastWithFeedUrl:(id)a3;
+ (BOOL)isSubscribedToPodcastWithStorePlatformDictionary:(id)a3;
+ (BOOL)isSubscribedToPodcastWithUuid:(id)a3;
+ (id)_identifierForDictionary:(id)a3;
+ (void)subscribeToPodcastWithAdamID:(id)a3 completion:(id)a4;
+ (void)subscribeToPodcastWithFeedUrl:(id)a3 completion:(id)a4;
+ (void)subscribeToPodcastWithStorePlatformDictionary:(id)a3 completion:(id)a4;
+ (void)unsubscribeToPodcastWithStorePlatformDictionary:(id)a3;
@end

@implementation MTSubscribeUtil

+ (BOOL)isSubscribedToPodcastWithUuid:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mainOrPrivateContext]);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100014B2C;
    v9[3] = &unk_100240558;
    id v10 = v3;
    id v6 = v5;
    id v11 = v6;
    v12 = &v13;
    [v6 performBlockAndWait:v9];
    BOOL v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isSubscribedToPodcastWithFeedUrl:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast podcastUuidForFeedUrlString:ctx:]( &OBJC_CLASS___MTPodcast,  "podcastUuidForFeedUrlString:ctx:",  v4,  v6));

    unsigned __int8 v8 = [a1 isSubscribedToPodcastWithUuid:v7];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)isSubscribedToPodcastWithStorePlatformDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _identifierForDictionary:v4]);
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainOrPrivateContext]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100014D94;
  v11[3] = &unk_100240558;
  id v8 = v5;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  v14 = &v15;
  [v9 performBlockAndWait:v11];
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

+ (void)subscribeToPodcastWithFeedUrl:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainOrPrivateContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015020;
  v15[3] = &unk_1002406C0;
  id v9 = v5;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  char v18 = &v24;
  v19 = &v20;
  [v10 performBlockAndWait:v15];
  if (!*((_BYTE *)v25 + 24))
  {
    if ([v9 length])
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10001512C;
      v12[3] = &unk_100240138;
      id v13 = v9;
      id v14 = v6;
      dispatch_async(&_dispatch_main_q, v12);

      goto LABEL_7;
    }

    if (!v6) {
      goto LABEL_7;
    }
    BOOL v11 = 0LL;
    goto LABEL_4;
  }

  if (v6)
  {
    BOOL v11 = *((_BYTE *)v21 + 24) == 0;
LABEL_4:
    (*((void (**)(id, BOOL))v6 + 2))(v6, v11);
  }

+ (void)subscribeToPodcastWithAdamID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_alloc_init(&OBJC_CLASS___MTAddPodcastParams);
  id v8 = [v6 longLongValue];

  -[MTAddPodcastParams setStoreCollectionId:](v7, "setStoreCollectionId:", v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000152EC;
  v11[3] = &unk_1002406E8;
  id v12 = v5;
  id v9 = v5;
  -[MTAddPodcastParams setCompletion:](v7, "setCompletion:", v11);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionManager sharedInstance](&OBJC_CLASS___MTSubscriptionManager, "sharedInstance"));
  [v10 subscribeToPodcastWithParams:v7];
}

+ (void)subscribeToPodcastWithStorePlatformDictionary:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTSubscribeUtil _identifierForDictionary:]( &OBJC_CLASS___MTSubscribeUtil,  "_identifierForDictionary:",  v5));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"isNotSubscribeable"]);
  unsigned int v9 = [v8 BOOLValue];

  if (!v9)
  {
    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x2020000000LL;
    char v32 = 0;
    uint64_t v25 = 0LL;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    char v28 = 0;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mainOrPrivateContext]);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100015574;
    v20[3] = &unk_1002406C0;
    id v12 = v7;
    id v21 = v12;
    id v13 = v11;
    id v22 = v13;
    char v23 = &v29;
    uint64_t v24 = &v25;
    [v13 performBlockAndWait:v20];
    if (*((_BYTE *)v30 + 24))
    {
      if (!v6)
      {
LABEL_10:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        goto LABEL_11;
      }

      BOOL v14 = *((_BYTE *)v26 + 24) == 0;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 feedUrl]);
      id v16 = [v15 length];

      if (v16)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100015680;
        v17[3] = &unk_100240138;
        id v18 = v12;
        id v19 = v6;
        dispatch_async(&_dispatch_main_q, v17);

        goto LABEL_10;
      }

      if (!v6) {
        goto LABEL_10;
      }
      BOOL v14 = 0LL;
    }

    (*((void (**)(id, BOOL))v6 + 2))(v6, v14);
    goto LABEL_10;
  }

  if (v6) {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0LL, 3LL);
  }
LABEL_11:
}

+ (void)unsubscribeToPodcastWithStorePlatformDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _identifierForDictionary:a3]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 privateQueueContext]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100015860;
  v8[3] = &unk_100240240;
  id v9 = v3;
  id v10 = v5;
  id v6 = v5;
  id v7 = v3;
  [v6 performBlockAndWait:v8];
}

+ (id)_identifierForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:AMSLookupPropertyItemIdentifier]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v8 = v4;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v8 longLongValue]));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringValue]);
    unsigned int v11 = [v10 isEqualToString:v8];

    id v4 = v8;
    if (v11)
    {
      id v4 = v9;
    }
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v4, v12) & 1) == 0)
  {

    id v4 = 0LL;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"feedUrl"]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0)
  {

    id v13 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier identifierWithFeedUrl:storeIdentifier:]( &OBJC_CLASS___MTStoreIdentifier,  "identifierWithFeedUrl:storeIdentifier:",  v13,  v4));

  return v16;
}

@end