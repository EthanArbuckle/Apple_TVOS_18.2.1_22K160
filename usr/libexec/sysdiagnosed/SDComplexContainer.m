@interface SDComplexContainer
+ (id)complexContainerWithBlock:(id)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6;
+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6;
+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6 withIntermediateDirectory:(id)a7;
+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7;
+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7 isConcurrent:(BOOL)a8;
- (BOOL)_executeFromCallback:(BOOL)a3;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (SDLogCollectionContainer)collectionContainer;
- (SDTaskContainer)taskContainer;
- (id)name;
- (void)applyContainerOverride:(id)a3;
- (void)setCollectionContainer:(id)a3;
- (void)setName:(id)a3;
- (void)setTaskContainer:(id)a3;
@end

@implementation SDComplexContainer

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7
{
  return +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:",  a3,  a5,  a6,  a7,  0LL,  a4);
}

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7 isConcurrent:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = sub_100024C0C(v15, @"unnamed_tasks");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = sub_100025C9C(v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v20)
  {
    v22 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDComplexContainer),  "initWithName:andDestination:withDelegate:",  v18,  v15,  v16);
    if (v22)
    {
      id v46 = v13;
      v47 = v14;
      id v23 = sub_100024C94(v18, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  v24,  v15,  v16));

      if (v25)
      {
        -[SDComplexContainer setCollectionContainer:](v22, "setCollectionContainer:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v22, "collectionContainer"));
        [v27 setResolveHomeDirs:0];

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v22, "collectionContainer"));
        BOOL v29 = v8;
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  v20));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v47 arrayByAddingObject:v30]);
        [v28 addRules:v31];

        BOOL v8 = v29;
      }

      id v32 = sub_100024C88(v18, v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_100025F78;
      v48[3] = &unk_100088EA8;
      id v49 = v25;
      id v34 = v25;
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:]( &OBJC_CLASS___SDTaskDepotContainer,  "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:",  v33,  v15,  v8,  v16,  v48,  a4));

      id v13 = v46;
      if (v35)
      {
        [v35 addSDTasksToContainer:v46 withTmpOutputDir:v20];
        -[SDComplexContainer setTaskContainer:](v22, "setTaskContainer:", v35);
      }

      v22 = v22;

      v36 = v22;
      id v14 = v47;
    }

    else
    {
      v36 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055098((uint64_t)v18, v37, v38, v39, v40, v41, v42, v43);
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v44 stderrWrite:@"Tasks container %@ has invalid temporary directory", v18];

    v22 = (SDComplexContainer *)objc_claimAutoreleasedReturnValue( +[SDResourceManager sharedResourceManager]( &OBJC_CLASS___SDResourceManager,  "sharedResourceManager"));
    -[SDComplexContainer log:](v22, "log:", @"Tasks container %@ has invalid temporary directory", v18);
    v36 = 0LL;
  }

  return v36;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6 withIntermediateDirectory:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    id v14 = sub_10003F784(v10);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = sub_100024C0C(v11, v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    id v19 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDComplexContainer),  "initWithName:andDestination:withDelegate:",  v17,  v11,  v12);
    if (v19)
    {
      id v20 = sub_100024C94(v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogAgentCollectionContainer,  "containerWithName:destination:withDelegate:",  v21,  v11,  v12));

      if (v22)
      {
        -[SDComplexContainer setCollectionContainer:](v19, "setCollectionContainer:", v22);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v19, "collectionContainer"));
        [v23 setResolveHomeDirs:0];

        [v22 setFlattenReturnedDirectoryPaths:1];
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v19, "collectionContainer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  v13));
        uint64_t v41 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
        [v24 addRules:v26];
      }

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100026258;
      v39[3] = &unk_100089798;
      id v40 = v22;
      id v27 = v22;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:]( &OBJC_CLASS___SDLogAgentContainer,  "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:",  v13,  v10,  v12,  0LL,  v39,  a4));
      if (v28) {
        -[SDComplexContainer setTaskContainer:](v19, "setTaskContainer:", v28);
      }
      BOOL v29 = v19;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055218((uint64_t)v11, v30, v31, v32, v33, v34, v35, v36);
    }
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v37 stderrWrite:@"Task %@ has invalid temporary directory", v11];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](&OBJC_CLASS___SDResourceManager, "sharedResourceManager"));
    [v17 log:@"Task %@ has invalid temporary directory", v11];
    id v19 = 0LL;
  }

  return v19;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = sub_10003F784(v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_100024C0C(v10, v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  id v15 = sub_100025C9C(v9, v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:]( &OBJC_CLASS___SDComplexContainer,  "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:",  v8,  v10,  v9,  v16,  a4));

  return v17;
}

+ (id)complexContainerWithBlock:(id)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_100024C0C(v10, @"unnamed_block");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v15 = -[SDContainer initWithName:andDestination:withDelegate:]( objc_alloc(&OBJC_CLASS___SDComplexContainer),  "initWithName:andDestination:withDelegate:",  v13,  v10,  v11);
  if (v15)
  {
    id v16 = sub_100024C94(v13, v14);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SDLogCollectionContainer containerWithName:destination:withDelegate:]( &OBJC_CLASS___SDLogCollectionContainer,  "containerWithName:destination:withDelegate:",  v17,  v10,  v11));

    if (v18)
    {
      -[SDComplexContainer setCollectionContainer:](v15, "setCollectionContainer:", v18);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v15, "collectionContainer"));
      [v20 setResolveHomeDirs:0];
    }

    id v21 = sub_100024C88(v13, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100026510;
    v27[3] = &unk_1000897C0;
    id v28 = v18;
    id v23 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[SDBlockContainer containerWithName:forBlock:withTimeout:withDelegate:withCompletionBlock:]( &OBJC_CLASS___SDBlockContainer,  "containerWithName:forBlock:withTimeout:withDelegate:withCompletionBlock:",  v22,  v9,  v11,  v27,  a4));

    if (v24) {
      -[SDComplexContainer setTaskContainer:](v15, "setTaskContainer:", v24);
    }
    v25 = v15;
  }

  return v15;
}

- (void)setName:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_name, a3);
  if (self->_taskContainer)
  {
    id v6 = sub_100024C88(v10, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[SDContainer setName:](self->_taskContainer, "setName:", v7);
  }

  if (self->_collectionContainer)
  {
    id v8 = sub_100024C94(v10, v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDContainer setName:](self->_collectionContainer, "setName:", v9);
  }
}

- (BOOL)_executeFromCallback:(BOOL)a3
{
  BOOL v3 = a3;
  -[SDContainer updateContainerWithOverride](self, "updateContainerWithOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));

  if (v5)
  {
    unint64_t v6 = -[SDContainer runtimeChecks](self, "runtimeChecks");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));
    [v7 setRuntimeChecks:v6];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));

  if (v8)
  {
    unint64_t v9 = -[SDContainer runtimeChecks](self, "runtimeChecks");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
    [v10 setRuntimeChecks:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
    id v12 = v11;
    if (v3) {
      [v11 executeFromCallback];
    }
    else {
      [v11 execute];
    }
  }

  return 1;
}

- (BOOL)executeFromCallback
{
  return -[SDComplexContainer _executeFromCallback:](self, "_executeFromCallback:", 1LL);
}

- (BOOL)execute
{
  return -[SDComplexContainer _executeFromCallback:](self, "_executeFromCallback:", 0LL);
}

- (void)applyContainerOverride:(id)a3
{
  id v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"timeout"]);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));

    if (v5)
    {
      [v4 doubleValue];
      double v7 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
      [v8 setTimeout:v7];
    }
  }

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"maxSizeMB"]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));

    if (v10)
    {
      id v11 = [v9 unsignedIntegerValue];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));
      [v12 setMaximumSizeMB:v11];
    }
  }
}

- (id)name
{
  return self->_name;
}

- (SDTaskContainer)taskContainer
{
  return self->_taskContainer;
}

- (void)setTaskContainer:(id)a3
{
}

- (SDLogCollectionContainer)collectionContainer
{
  return self->_collectionContainer;
}

- (void)setCollectionContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end