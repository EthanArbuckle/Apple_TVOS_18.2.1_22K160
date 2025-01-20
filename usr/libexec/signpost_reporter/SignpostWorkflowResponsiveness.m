@interface SignpostWorkflowResponsiveness
+ (id)allWorkflows;
+ (id)workflowWithName:(id)a3;
- (BOOL)signpostInAllowList:(id)a3;
- (SignpostWorkflowResponsiveness)initWithWorkflowEventTracker:(id)a3;
- (WRWorkflowEventTracker)workflowEventTracker;
- (id)newConfiguredExtractor;
- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3;
- (void)handleDeviceReboot;
- (void)handleSignpostEmitEvent:(id)a3;
- (void)handleSignpostInterval:(id)a3;
- (void)handleSignpostIntervalBegin:(id)a3;
@end

@implementation SignpostWorkflowResponsiveness

- (SignpostWorkflowResponsiveness)initWithWorkflowEventTracker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SignpostWorkflowResponsiveness;
  v6 = -[SignpostWorkflowResponsiveness init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workflowEventTracker, a3);
  }

  return v7;
}

+ (id)allWorkflows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WRWorkflow allWorkflows](&OBJC_CLASS___WRWorkflow, "allWorkflows"));
  if ([v2 count])
  {
    v3 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v2 count]);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v13 = v2;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        v8 = 0LL;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = -[WRWorkflowEventTracker initForReadbackWithWorkflow:eventCompletionCallback:]( objc_alloc(&OBJC_CLASS___WRWorkflowEventTracker),  "initForReadbackWithWorkflow:eventCompletionCallback:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8),  &stru_1000103B0);
          v10 = -[SignpostWorkflowResponsiveness initWithWorkflowEventTracker:]( objc_alloc(&OBJC_CLASS___SignpostWorkflowResponsiveness),  "initWithWorkflowEventTracker:",  v9);
          if (v10) {
            -[NSMutableArray addObject:](v3, "addObject:", v10);
          }

          v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v6);
    }

    id v11 = -[NSMutableArray copy](v3, "copy");
    v2 = v13;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (id)workflowWithName:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WRWorkflow workflowWithName:](&OBJC_CLASS___WRWorkflow, "workflowWithName:", a3));
  if (v3)
  {
    id v4 = -[WRWorkflowEventTracker initForReadbackWithWorkflow:eventCompletionCallback:]( objc_alloc(&OBJC_CLASS___WRWorkflowEventTracker),  "initForReadbackWithWorkflow:eventCompletionCallback:",  v3,  &stru_1000103D0);
    id v5 = -[SignpostWorkflowResponsiveness initWithWorkflowEventTracker:]( objc_alloc(&OBJC_CLASS___SignpostWorkflowResponsiveness),  "initWithWorkflowEventTracker:",  v4);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 workflow]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allowListForAllSignposts]);
  [v4 addAllowlist:v6];
}

- (BOOL)signpostInAllowList:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 workflow]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allowListForAllSignposts]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 subsystem]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);

  LOBYTE(v4) = [v7 passesSubsystem:v8 category:v9];
  return (char)v4;
}

- (void)handleDeviceReboot
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  [v2 reset];
}

- (void)handleSignpostIntervalBegin:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    [v4 handleSignpost:v5];
  }
}

- (void)handleSignpostEmitEvent:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    [v4 handleSignpost:v5];
  }
}

- (void)handleSignpostInterval:(id)a3
{
  id v5 = a3;
  if (-[SignpostWorkflowResponsiveness signpostInAllowList:](self, "signpostInAllowList:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
    [v4 handleSignpost:v5];
  }
}

- (id)newConfiguredExtractor
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SignpostSupportObjectExtractor);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostWorkflowResponsiveness workflowEventTracker](self, "workflowEventTracker"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 workflow]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allowListForAllSignposts]);
  [v3 setSubsystemCategoryFilter:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100003450;
  v11[3] = &unk_1000103F8;
  v11[4] = self;
  [v3 setIntervalCompletionProcessingBlock:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003470;
  v10[3] = &unk_100010420;
  v10[4] = self;
  [v3 setBeginEventProcessingBlock:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100003490;
  v9[3] = &unk_100010420;
  v9[4] = self;
  [v3 setEmitEventProcessingBlock:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000034B0;
  v8[3] = &unk_100010448;
  v8[4] = self;
  [v3 setDeviceRebootProcessingBlock:v8];
  return v3;
}

- (WRWorkflowEventTracker)workflowEventTracker
{
  return self->_workflowEventTracker;
}

- (void).cxx_destruct
{
}

@end