@interface MTJSPodcasts
- (BOOL)isDiagnosticSubmissionAllowed;
- (BOOL)isSubscribed:(id)a3;
- (BOOL)shouldShowWelcome;
- (id)_adjustedOptionsWithOptions:(id)a3;
- (id)identifierForDictionary:(id)a3;
- (void)markWelcomeAsShown;
- (void)subscribe:(id)a3;
- (void)subscribeWithCallback:(id)a3 :(id)a4;
- (void)unsubscribe:(id)a3;
@end

@implementation MTJSPodcasts

- (void)subscribe:(id)a3
{
}

- (void)subscribeWithCallback:(id)a3 :(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10009D16C;
  v8[3] = &unk_1002432A0;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MTJSPodcasts blockForJSCallback:](self, "blockForJSCallback:", a4));
  id v7 = v9;
  +[MTSubscribeUtil subscribeToPodcastWithStorePlatformDictionary:completion:]( &OBJC_CLASS___MTSubscribeUtil,  "subscribeToPodcastWithStorePlatformDictionary:completion:",  v6,  v8);
}

- (void)unsubscribe:(id)a3
{
}

- (BOOL)isSubscribed:(id)a3
{
  return +[MTSubscribeUtil isSubscribedToPodcastWithStorePlatformDictionary:]( &OBJC_CLASS___MTSubscribeUtil,  "isSubscribedToPodcastWithStorePlatformDictionary:",  a3);
}

- (BOOL)isDiagnosticSubmissionAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

- (BOOL)shouldShowWelcome
{
  return +[MTWelcomeUtil shouldShowWelcome](&OBJC_CLASS___MTWelcomeUtil, "shouldShowWelcome");
}

- (void)markWelcomeAsShown
{
}

- (id)identifierForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"id"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v6 longLongValue]));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
    unsigned int v9 = [v8 isEqualToString:v6];

    id v4 = v6;
    if (v9)
    {
      id v4 = v7;
    }
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) == 0)
  {

    id v4 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"feedUrl"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier identifierWithFeedUrl:storeIdentifier:]( &OBJC_CLASS___MTStoreIdentifier,  "identifierWithFeedUrl:storeIdentifier:",  v11,  v4));

  return v12;
}

- (id)_adjustedOptionsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"sourceElement"]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getAttribute:@"itmlID"]);
    if ([v6 length]) {
      [v4 setObject:v6 forKey:@"sourceElement"];
    }
    else {
      [v4 removeObjectForKey:@"sourceElement"];
    }
  }

  return v4;
}

@end