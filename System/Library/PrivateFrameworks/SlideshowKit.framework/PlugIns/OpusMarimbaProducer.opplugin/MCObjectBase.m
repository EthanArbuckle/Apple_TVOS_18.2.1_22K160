@interface MCObjectBase
+ (void)initialize;
- (BOOL)isSnapshot;
- (id)imprint;
- (id)snapshot;
- (void)dealloc;
@end

@implementation MCObjectBase

+ (void)initialize
{
  if (!sEmptySet) {
    sEmptySet = objc_alloc_init(&OBJC_CLASS___NSSet);
  }
  if (!sEmptyArray) {
    sEmptyArray = objc_alloc_init(&OBJC_CLASS___NSArray);
  }
  if (!sEmptyDictionary) {
    sEmptyDictionary = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCObjectBase;
  -[MCObjectBase dealloc](&v3, "dealloc");
}

- (BOOL)isSnapshot
{
  return 0;
}

- (id)imprint
{
  return 0LL;
}

- (id)snapshot
{
  id v3 = objc_alloc_init((Class)objc_opt_class(self, a2));
  -[MCObjectBase _copySelfToSnapshot:](self, "_copySelfToSnapshot:", v3);
  return v3;
}

@end