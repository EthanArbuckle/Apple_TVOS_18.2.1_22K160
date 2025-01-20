@interface VOTNameSearcherAppSource
- (VOTNameSearcherAppSource)initWithLaunchContext:(int)a3;
- (double)selectSpeechDelay;
- (id)messageForMatchingItemsCount:(int64_t)a3;
- (id)messageForNoMatchingItems;
- (id)messageForSelectingItem:(id)a3;
- (int)launchContext;
- (void)retrieveAllEntries:(id)a3;
- (void)setLaunchContext:(int)a3;
@end

@implementation VOTNameSearcherAppSource

- (VOTNameSearcherAppSource)initWithLaunchContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VOTNameSearcherAppSource;
  v4 = -[VOTNameSearcherAppSource init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    -[VOTNameSearcherAppSource setLaunchContext:](v4, "setLaunchContext:", v3);
    v6 = v5;
  }

  return v5;
}

- (void)retrieveAllEntries:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (!-[VOTNameSearcherAppSource launchContext](self, "launchContext"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 launchableApps]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100039C88;
    v12[3] = &unk_1001776A8;
    v7 = &v13;
    id v13 = v9;
    objc_super v8 = v12;
    goto LABEL_5;
  }

  if (-[VOTNameSearcherAppSource launchContext](self, "launchContext") == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTElement springBoardApplication](&OBJC_CLASS___VOTElement, "springBoardApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appSwitcherApps]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100039D00;
    v10[3] = &unk_1001776A8;
    v7 = &v11;
    id v11 = v9;
    objc_super v8 = v10;
LABEL_5:
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }

  [v9 sortUsingComparator:&stru_1001776E8];
  [v4 didRetrieveAllEntries:v9];
}

- (id)messageForMatchingItemsCount:(int64_t)a3
{
  id v4 = sub_10004A988(off_1001AC148, @"handwrite.num.matching.apps.count", 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v5, a3));

  return v6;
}

- (id)messageForNoMatchingItems
{
  return sub_10004A988(off_1001AC148, @"handwrite.no.apps", 0LL);
}

- (id)messageForSelectingItem:(id)a3
{
  uint64_t v3 = off_1001AC148;
  id v4 = a3;
  id v5 = sub_10004A988(v3, @"handwrite.launch.app", 0LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));

  return v7;
}

- (double)selectSpeechDelay
{
  return 0.5;
}

- (int)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int)a3
{
  self->_launchContext = a3;
}

@end