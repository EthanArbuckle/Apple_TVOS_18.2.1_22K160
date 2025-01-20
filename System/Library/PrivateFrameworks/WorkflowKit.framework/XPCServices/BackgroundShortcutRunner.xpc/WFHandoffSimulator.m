@interface WFHandoffSimulator
+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6;
+ (id)temporaryFileURLBySerializingUserInfo:(id)a3;
+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4;
+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4;
+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4;
+ (void)registerHandoffURLRequestHandler:(id)a3;
@end

@implementation WFHandoffSimulator

+ (void)registerHandoffURLRequestHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 27, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](&OBJC_CLASS___ICManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100054B24;
  v9[3] = &unk_100066F28;
  id v10 = v5;
  id v11 = a1;
  id v7 = v5;
  [v6 registerHandler:v9 forIncomingRequestsWithAction:@"continue-user-activity" scheme:0];
}

+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v12 || !v14)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 41, @"Invalid parameter not satisfying: %@", @"userInfo && handoffSource" object file lineNumber description];
  }

  unsigned int v16 = [v11 isEqualToString:NSUserActivityTypeBrowsingWeb];
  if (!v13 || !v16)
  {
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"type",  v11));
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    if (v12)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([a1 temporaryFileURLBySerializingUserInfo:v12]);
      id v17 = v20;
      if (!v20)
      {
LABEL_12:

        goto LABEL_13;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 absoluteString]);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"userInfoURL",  v21));
      -[NSMutableArray addObject:](v18, "addObject:", v22);
    }

    if (v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"webpageURL",  v23));
      -[NSMutableArray addObject:](v18, "addObject:", v24);
    }

    v25 = objc_opt_new(&OBJC_CLASS___NSURLComponents);
    -[NSURLComponents setScheme:](v25, "setScheme:", WFWorkflowActiveURLScheme);
    -[NSURLComponents setHost:](v25, "setHost:", @"continue-user-activity");
    -[NSURLComponents setQueryItems:](v25, "setQueryItems:", v18);
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v25, "URL"));

    goto LABEL_12;
  }

  id v17 = v13;
LABEL_13:

  return v17;
}

+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, a1, @"WFHandoffSimulator.m", 70, @"Invalid parameter not satisfying: %@", @"state && handoffSource" object file lineNumber description];
  }

  v14[0] = WFHandoffWorkflowControllerStateKey;
  v14[1] = WFHandoffSourceKey;
  v15[0] = v7;
  v15[1] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 URLForSimulatingHandoffWithActivityType:WFHandoffContinueWorkflowActivityType userInfo:v10 webpageURL:0 fromSource:v9]);

  return v11;
}

+ (id)temporaryFileURLBySerializingUserInfo:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver wf_securelyArchivedDataWithRootObject:deletionResponsibility:]( &OBJC_CLASS___NSKeyedArchiver,  "wf_securelyArchivedDataWithRootObject:deletionResponsibility:",  a3,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[WFTemporaryFileManager proposedSharedTemporaryFileURLForFilename:]( &OBJC_CLASS___WFTemporaryFileManager,  "proposedSharedTemporaryFileURLForFilename:",  @"URLHandoffUserInfo.plist"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByDeletingLastPathComponent]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 path]);
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) != 0)
  {
    id v9 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = 0LL;
    [v10 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v9 = v16;
  }

  id v15 = v9;
  unsigned int v11 = [v3 writeToURL:v4 options:0 error:&v15];
  id v12 = v15;

  id v13 = 0LL;
  if (v11) {
    id v13 = v4;
  }

  return v13;
}

+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4
{
  id v20 = a3;
  id v5 = (void (**)(id, void))a4;
  if ([v20 isFileURL]
    && (v6 = (void *)objc_claimAutoreleasedReturnValue( +[WFTemporaryFileManager sharedAppGroupDirectoryURL]( WFTemporaryFileManager,  "sharedAppGroupDirectoryURL")),  unsigned __int8 v7 = objc_msgSend(v20, "wf_isContainedByDirectoryAtURL:", v6),  v6,  (v7 & 1) != 0))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[WFFileType typeWithUTType:](&OBJC_CLASS___WFFileType, "typeWithUTType:", UTTypePropertyList));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[WFFileRepresentation fileWithURL:options:ofType:]( &OBJC_CLASS___WFFileRepresentation,  "fileWithURL:options:ofType:",  v20,  1LL,  v8));

    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDate);
    id v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v11,  v12,  v13,  v14,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    id v17 = [v16 mutableCopy];

    [v17 addObject:objc_opt_class(NSURL)];
    [v17 addObject:objc_opt_class(WFWorkflowControllerState)];
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 mappedData]);
    id v19 =  +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:]( &OBJC_CLASS___NSKeyedUnarchiver,  "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:",  v18,  v17,  v5);
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = WFHandoffWorkflowControllerStateKey;
  v17[1] = WFHandoffSourceKey;
  v18[0] = v6;
  v18[1] = v7;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 temporaryFileURLBySerializingUserInfo:v8]);
  if (v9)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___NSUserActivity);
    uint64_t v11 = -[NSUserActivity initWithActivityType:](v10, "initWithActivityType:", WFHandoffContinueWorkflowActivityType);
    id v15 = @"userInfoURL";
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
    id v16 = v12;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    -[NSUserActivity setUserInfo:](v11, "setUserInfo:", v13);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 objectForKey:WFHandoffSourceKey]);
  id v9 = (void *)v8;
  uint64_t v10 = (void *)WFWorkflowRunSourceHandoff;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:WFHandoffWorkflowControllerStateKey]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 objectForKey:WFHandoffWorkflowControllerStateDataKey]);
  uint64_t v14 = (void *)v13;
  if (v12)
  {
    v7[2](v7, v12, v11);
  }

  else if (v13)
  {
    id v15 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___WFWorkflowControllerState));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100054A68;
    v22[3] = &unk_100066F50;
    v24 = v7;
    id v23 = v11;
    id v17 =  +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:]( &OBJC_CLASS___NSKeyedUnarchiver,  "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:",  v14,  v16,  v22);
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"userInfoURL"]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100054A78;
    v20[3] = &unk_100066F78;
    v21 = v7;
    [a1 deserializeUserInfoAtURL:v19 completionHandler:v20];
  }
}

@end