@interface PBSystemGestureRecognizerManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)mainDisplayManager;
- (FBSDisplayIdentity)displayIdentity;
- (NSHashTable)gestureRecognizers;
- (PBSystemGestureRecognizerManager)initWithDisplayIdentity:(id)a3;
- (UIWindow)windowForSystemGestures;
- (void)addGestureRecognizer:(id)a3;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)removeGestureRecognizer:(id)a3;
@end

@implementation PBSystemGestureRecognizerManager

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002A798;
  v5[3] = &unk_1003CFF78;
  v5[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v5);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBPowerManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v3);

  return v2;
}

+ (id)mainDisplayManager
{
  return (id)objc_claimAutoreleasedReturnValue( +[PBMainDisplaySystemGestureRecognizerManager sharedInstance]( &OBJC_CLASS___PBMainDisplaySystemGestureRecognizerManager,  "sharedInstance"));
}

- (PBSystemGestureRecognizerManager)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecognizerManager;
  uint64_t v6 = -[PBSystemGestureRecognizerManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayIdentity, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](&OBJC_CLASS___NSHashTable, "hashTableWithOptions:", 261LL));
    gestureRecognizers = v7->_gestureRecognizers;
    v7->_gestureRecognizers = (NSHashTable *)v8;

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002A8C0;
    v11[3] = &unk_1003D0FA8;
    v12 = v7;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v12,  v11);
  }

  return v7;
}

- (void)addGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_UISystemGestureManager sharedInstance](&OBJC_CLASS____UISystemGestureManager, "sharedInstance"));
  [v5 addGestureRecognizer:v4 recognitionEvent:2 toDisplayWithIdentity:self->_displayIdentity];

  -[NSHashTable addObject:](self->_gestureRecognizers, "addObject:", v4);
}

- (void)removeGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_UISystemGestureManager sharedInstance](&OBJC_CLASS____UISystemGestureManager, "sharedInstance"));
  [v5 removeGestureRecognizer:v4 fromDisplayWithIdentity:self->_displayIdentity];

  -[NSHashTable removeObject:](self->_gestureRecognizers, "removeObject:", v4);
}

- (UIWindow)windowForSystemGestures
{
  if (self->_displayIdentity)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[_UISystemGestureManager sharedInstance](&OBJC_CLASS____UISystemGestureManager, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForSystemGesturesForDisplayWithIdentity:self->_displayIdentity]);
  }

  else
  {
    id v4 = 0LL;
  }

  return (UIWindow *)v4;
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  uint64_t v6 = (void (**)(void))a5;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v7 = self->_gestureRecognizers;
  id v8 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "pb_cancel", (void)v12);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v9);
  }

  v6[2](v6);
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (NSHashTable)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void).cxx_destruct
{
}

@end