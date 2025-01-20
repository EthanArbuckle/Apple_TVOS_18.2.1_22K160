@interface GEOExperimentServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOExperimentServer)initWithDaemon:(id)a3;
- (void)fetchAllExperimentsWithMessage:(id)a3;
- (void)fetchAssignUUIDSyncWithMessage:(id)a3;
- (void)fetchAssignUUIDWithMessage:(id)a3;
- (void)refreshDatasetWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setActiveBranchWithMessage:(id)a3;
- (void)setBucketIdWithMessage:(id)a3;
- (void)setQuerySubstringWithMessage:(id)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation GEOExperimentServer

+ (id)identifier
{
  return @"experiments";
}

+ (unint64_t)launchMode
{
  return 1LL;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_10005E460;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100011D18(v10);
  BOOL v14 = 0;
  if (v13 > 1525)
  {
    if (v13 > 1858)
    {
      if (v13 == 1859)
      {
        id v23 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        v16 = v23;
        BOOL v14 = v23 != 0LL;
        if (v23)
        {
          [v23 setSignpostId:a6];
          -[GEOExperimentServer fetchAssignUUIDSyncWithMessage:](self, "fetchAssignUUIDSyncWithMessage:", v16);
          goto LABEL_33;
        }

        goto LABEL_34;
      }

      if (v13 != 1975) {
        goto LABEL_35;
      }
      if (sub_100012B28(v12, v11, @"experiments", v10, &off_10005E4C0, 0LL))
      {
        id v19 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
        v16 = v19;
        BOOL v14 = v19 != 0LL;
        if (v19)
        {
          [v19 setSignpostId:a6];
          -[GEOExperimentServer fetchAllExperimentsWithMessage:](self, "fetchAllExperimentsWithMessage:", v16);
          goto LABEL_33;
        }

        goto LABEL_34;
      }
    }

    else
    {
      if (v13 != 1526)
      {
        if (v13 == 1827)
        {
          if (sub_100012B28(v12, v11, @"experiments", v10, &off_10005E478, 0LL))
          {
            id v17 = [[GEOMessage alloc] initWithXPCMessage:v11 peer:v12];
            v16 = v17;
            BOOL v14 = v17 != 0LL;
            if (v17)
            {
              [v17 setSignpostId:a6];
              -[GEOExperimentServer setQuerySubstringWithMessage:](self, "setQuerySubstringWithMessage:", v16);
              goto LABEL_33;
            }

- (GEOExperimentServer)initWithDaemon:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GEOExperimentServer;
  v3 = -[GEOExperimentServer initWithDaemon:](&v7, "initWithDaemon:", a3);
  if (v3)
  {
    id v4 =  +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration");
    v5 = v3;
  }

  return v3;
}

- (void)updateWithMessage:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration",  a3));
  objc_msgSend(v3, "_debug_forceUpdate");
}

- (void)refreshDatasetWithMessage:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"datasetABStatus"]);

  id v4 = [[GEOPDDatasetABStatus alloc] initWithData:v6];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  [v5 refreshDatasetABStatus:v4];
}

- (void)setQuerySubstringWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"type"]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"placeRequestType"]);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"querySubstring"]);

  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
    objc_msgSend( v9,  "_debug_setCustomQuerySubstring:forExperimentType:dispatcherRequestType:",  v8,  objc_msgSend(v10, "integerValue"),  objc_msgSend(v6, "intValue"));
  }
}

- (void)setActiveBranchWithMessage:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"abdr"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  [v4 _setActiveExperimentBranchDictionaryRepresentation:v5];
}

- (void)setBucketIdWithMessage:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"bucketIdDR"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  objc_msgSend(v4, "_debug_setBucketIdDictionaryRepresentation:", v5);
}

- (void)fetchAllExperimentsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000175C0;
  v6[3] = &unk_1000598B0;
  id v7 = v3;
  id v5 = v3;
  [v4 _fetchAllAvailableExperimentsResponse:v6];
}

- (void)fetchAssignUUIDWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100017718;
  v6[3] = &unk_1000598D8;
  id v7 = v3;
  id v5 = v3;
  [v4 abAssignUUIDWithCompletionHandler:v6];
}

- (void)fetchAssignUUIDSyncWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000178D4;
  v6[3] = &unk_1000598D8;
  id v7 = v3;
  id v5 = v3;
  [v4 abAssignUUIDWithSyncCompletionHandler:v6];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v6 isEqualToString:GEOExperimentServerLocalProxyBackgroundTaskIdentifier])
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v8 = [v7 isEqualToString:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier];

    if (!v8)
    {
      v11.receiver = self;
      v11.super_class = (Class)&OBJC_CLASS___GEOExperimentServer;
      -[GEOExperimentServer runBackgroundTask:](&v11, "runBackgroundTask:", v4);
      goto LABEL_6;
    }
  }

  id v9 = v4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  [v10 forceUpdate:v9];

LABEL_6:
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[GEOExperimentConfiguration sharedConfiguration]( &OBJC_CLASS___GEOExperimentConfiguration,  "sharedConfiguration"));
  [v2 submitBackgroundTasksNeededDuringDaemonStart];
}

@end