@interface PDWhatChangedTask
+ (BOOL)supportsSecureCoding;
+ (id)taskWithPassTypeIdentifier:(id)a3 subtasks:(id)a4;
- (BOOL)_matchesTask:(id)a3;
- (BOOL)coalescesWithTaskSubclass:(Class)a3;
- (BOOL)gotUpdates;
- (NSSet)subtasks;
- (NSString)description;
- (NSString)passTypeIdentifier;
- (PDWhatChangedTask)initWithCoder:(id)a3;
- (id)_initWithPassTypeIdentifier:(id)a3 subtasks:(id)a4;
- (int64_t)actionForActiveTask:(id)a3;
- (int64_t)actionForInactiveTask:(id)a3;
- (void)_addTask:(id)a3;
- (void)_commonInit;
- (void)_updateForTaskDeactivation:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performCancel;
- (void)performStart:(BOOL)a3;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)taskFailed:(id)a3;
- (void)taskFailedForAuthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
@end

@implementation PDWhatChangedTask

+ (id)taskWithPassTypeIdentifier:(id)a3 subtasks:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) _initWithPassTypeIdentifier:v7 subtasks:v6];

  return v8;
}

- (id)_initWithPassTypeIdentifier:(id)a3 subtasks:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PDWhatChangedTask;
  v9 = -[PDNetworkTask init](&v21, "init");
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    -[PDWhatChangedTask _commonInit](v9, "_commonInit");
    objc_storeStrong(p_isa + 12, a3);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(p_isa, "_addTask:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v15), (void)v17);
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v13);
    }
  }

  return p_isa;
}

- (NSSet)subtasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", self->_pendingTasks));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 setByAddingObjectsFromArray:self->_completedTasks]);

  return (NSSet *)v4;
}

- (void)performStart:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v5 = self->_pendingTasks;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        -[NSMutableArray addObject:](self->_activeTasks, "addObject:", v10, (void)v11);
        [v10 start:v3];
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }
}

- (void)performCancel
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_pendingTasks;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (BOOL)coalescesWithTaskSubclass:(Class)a3
{
  return -[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___PDWhatChangedTask, a2));
}

- (int64_t)actionForInactiveTask:(id)a3
{
  return -[PDWhatChangedTask _matchesTask:](self, "_matchesTask:", a3);
}

- (int64_t)actionForActiveTask:(id)a3
{
  if (-[PDWhatChangedTask _matchesTask:](self, "_matchesTask:", a3)) {
    return 5LL;
  }
  else {
    return 0LL;
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"'What changed?' task (%@)",  self->_passTypeIdentifier);
}

- (BOOL)_matchesTask:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 passTypeIdentifier]);
  LOBYTE(passTypeIdentifier) = -[NSString isEqualToString:](passTypeIdentifier, "isEqualToString:", v4);

  return (char)passTypeIdentifier;
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  __int128 v7 = v6;
  if (!self->_gotUpdates)
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumbers]);
    id v9 = [v8 count];

    if (v9)
    {
      self->_gotUpdates = 1;
      -[PDNetworkTask reportStateChange](self, "reportStateChange");
    }
  }

  -[PDNetworkTask deliverResult:forSubtask:](self, "deliverResult:forSubtask:", v7, v10);
}

- (void)taskSucceeded:(id)a3
{
  completedTasks = self->_completedTasks;
  id v5 = a3;
  -[NSMutableArray addObject:](completedTasks, "addObject:", v5);
  -[NSMutableArray removeObject:](self->_activeTasks, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_pendingTasks, "removeObject:", v5);

  -[PDWhatChangedTask _updateForTaskDeactivation:](self, "_updateForTaskDeactivation:", 1LL);
}

- (void)taskFailed:(id)a3
{
}

- (void)taskFailedForAuthentication:(id)a3
{
}

- (void)task:(id)a3 encounteredError:(id)a4
{
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWhatChangedTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___PDWhatChangedTask;
  id v5 = -[PDNetworkTask initWithCoder:](&v35, "initWithCoder:", v4);
  id v6 = v5;
  if (v5)
  {
    -[PDWhatChangedTask _commonInit](v5, "_commonInit");
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v7);
    id v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v8,  objc_opt_class(&OBJC_CLASS___PDGetSerialNumbersTask, v9),  0LL);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"pendingTasks"]);
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          -[PDWhatChangedTask _addTask:](v6, "_addTask:", *(void *)(*((void *)&v31 + 1) + 8LL * (void)v16));
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }

      while (v14);
    }

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"completedTasks"]);
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        objc_super v21 = 0LL;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NSMutableArray addObject:]( v6->_completedTasks,  "addObject:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v21));
          objc_super v21 = (char *)v21 + 1;
        }

        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }

      while (v19);
    }

    id v23 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v22),  @"passTypeIdentifier");
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    passTypeIdentifier = v6->_passTypeIdentifier;
    v6->_passTypeIdentifier = (NSString *)v24;

    v6->_gotUpdates = [v4 decodeBoolForKey:@"gotUpdates"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDWhatChangedTask;
  id v4 = a3;
  -[PDNetworkTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pendingTasks, @"pendingTasks", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_completedTasks forKey:@"completedTasks"];
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v4 encodeBool:self->_gotUpdates forKey:@"gotUpdates"];
}

- (void)_commonInit
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pendingTasks = self->_pendingTasks;
  self->_pendingTasks = v3;

  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  completedTasks = self->_completedTasks;
  self->_completedTasks = v5;

  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  activeTasks = self->_activeTasks;
  self->_activeTasks = v7;
}

- (void)_addTask:(id)a3
{
  id v4 = a3;
  [v4 setManager:self];
  -[NSMutableArray addObject:](self->_pendingTasks, "addObject:", v4);
}

- (void)_updateForTaskDeactivation:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSMutableArray count](self->_activeTasks, "count"))
  {
    if (v3) {
      -[PDNetworkTask reportStateChange](self, "reportStateChange");
    }
  }

  else if (-[NSMutableArray count](self->_pendingTasks, "count"))
  {
    -[PDNetworkTask fail](self, "fail");
  }

  else
  {
    -[PDNetworkTask succeed](self, "succeed");
  }

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (BOOL)gotUpdates
{
  return self->_gotUpdates;
}

- (void).cxx_destruct
{
}

@end