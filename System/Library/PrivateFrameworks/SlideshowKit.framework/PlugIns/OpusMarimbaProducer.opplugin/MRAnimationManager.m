@interface MRAnimationManager
+ (id)sharedManager;
+ (void)initialize;
+ (void)loadAnimationManagerWithPaths:(id)a3;
- (MRAnimationManager)initWithPaths:(id)a3;
- (void)cleanup;
- (void)dealloc;
@end

@implementation MRAnimationManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRAnimationManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_2B0618) {
    qword_2B0618 = -[MRAnimationManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MRAnimationManager),  "initWithPaths:",  0LL);
  }
}

+ (id)sharedManager
{
  return (id)qword_2B0618;
}

+ (void)loadAnimationManagerWithPaths:(id)a3
{
  if (qword_2B0618)
  {

    qword_2B0618 = 0LL;
  }

  qword_2B0618 = -[MRAnimationManager initWithPaths:]( objc_alloc(&OBJC_CLASS___MRAnimationManager),  "initWithPaths:",  a3);
}

- (MRAnimationManager)initWithPaths:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MRAnimationManager;
  v4 = -[MRAnimationManager init](&v19, "init");
  if (v4)
  {
    v4->mAnimations = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    v7 = v5;
    if (a3) {
      [v5 addObjectsFromArray:a3];
    }
    else {
      objc_msgSend( v5,  "addObject:",  -[NSString stringByAppendingPathComponent:]( -[NSBundle resourcePath]( +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(MRAnimationManager, v6)),  "resourcePath"),  "stringByAppendingPathComponent:",  @"Content"));
    }
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) stringByAppendingPathComponent:@"AnimationDescriptions.plist"]);
          if (v12)
          {
            id v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  2LL,  0LL,  0LL);
            if (v13) {
              -[NSMutableDictionary addEntriesFromDictionary:](v4->mAnimations, "addEntriesFromDictionary:", v13);
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }

      while (v9);
    }
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAnimationManager;
  -[MRAnimationManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  self->mAnimations = 0LL;
}

@end