@interface MPAnimationManager
+ (id)sharedManager;
+ (void)loadAnimationManagerWithPaths:(id)a3;
+ (void)releaseSharedManager;
- (MPAnimationManager)initWithPaths:(id)a3;
- (id)animationDescriptionForAnimationID:(id)a3;
- (id)animationDescriptionForAnimationSetID:(id)a3;
- (void)dealloc;
@end

@implementation MPAnimationManager

+ (id)sharedManager
{
  id result = (id)qword_2B0568;
  if (!qword_2B0568)
  {
    objc_sync_enter(a1);
    if (!qword_2B0568) {
      qword_2B0568 = -[MPAnimationManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MPAnimationManager),  "initWithPaths:",  0LL);
    }
    objc_sync_exit(a1);
    return (id)qword_2B0568;
  }

  return result;
}

+ (void)releaseSharedManager
{
  if (qword_2B0568)
  {
    objc_sync_enter(a1);

    qword_2B0568 = 0LL;
    objc_sync_exit(a1);
  }

- (void)dealloc
{
  self->mAnimationSets = 0LL;
  self->mAnimations = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MPAnimationManager;
  -[MPAnimationManager dealloc](&v3, "dealloc");
}

- (id)animationDescriptionForAnimationSetID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mAnimationSets, "objectForKey:", a3);
}

- (id)animationDescriptionForAnimationID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mAnimations, "objectForKey:", a3);
}

+ (void)loadAnimationManagerWithPaths:(id)a3
{
  if (qword_2B0568)
  {

    qword_2B0568 = 0LL;
  }

  qword_2B0568 = -[MPAnimationManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MPAnimationManager),  "initWithPaths:",  a3);
}

- (MPAnimationManager)initWithPaths:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MPAnimationManager;
  v17 = -[MPAnimationManager init](&v22, "init");
  if (v17)
  {
    v17->mAnimations = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v17->mAnimationSets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    v6 = v4;
    if (a3) {
      [v4 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v4,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MPAnimationManager, v5)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          v12 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v11 stringByAppendingPathComponent:@"AnimationDescriptions.plist"]);
          if (v12)
          {
            id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  2LL,  0LL,  0LL);
            if (v13) {
              -[NSMutableDictionary addEntriesFromDictionary:](v17->mAnimations, "addEntriesFromDictionary:", v13);
            }
          }

          v14 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [v11 stringByAppendingPathComponent:@"AnimatedSets.plist"]);
          if (v14)
          {
            id v15 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v14,  2LL,  0LL,  0LL);
            if (v15) {
              -[NSMutableDictionary addEntriesFromDictionary:](v17->mAnimationSets, "addEntriesFromDictionary:", v15);
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }

      while (v8);
    }
  }

  return v17;
}

@end