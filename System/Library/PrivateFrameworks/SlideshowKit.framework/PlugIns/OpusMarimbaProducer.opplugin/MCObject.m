@interface MCObject
+ (id)objectWithImprint:(id)a3 andMontage:(id)a4;
- (BOOL)isSnapshot;
- (MCMontage)montage;
- (MCObject)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSString)objectID;
- (id)_initWithObjectID:(id)a3;
- (id)imprint;
- (id)initFromScratchWithMontage:(id)a3;
- (id)initSnapshot;
- (id)snapshot;
- (void)dealloc;
- (void)demolish;
@end

@implementation MCObject

+ (id)objectWithImprint:(id)a3 andMontage:(id)a4
{
  id result = NSClassFromString((NSString *)[a3 objectForKey:@"type"]);
  if (result) {
    return [objc_alloc((Class)result) initWithImprint:a3 andMontage:a4];
  }
  return result;
}

- (id)initFromScratchWithMontage:(id)a3
{
  v4 = -[MCObject init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->mMontage = (MCMontage *)a3;
    v6 = objc_alloc(&OBJC_CLASS___NSString);
    mMontage = v5->mMontage;
    if (mMontage) {
      v8 = -[MCMontage uuidSeed](mMontage, "uuidSeed");
    }
    else {
      v8 = v5;
    }
    v5->mObjectID = -[NSString initWithFormat:](v6, "initWithFormat:", @"/%llu", v8);
  }

  return v5;
}

- (MCObject)initWithImprint:(id)a3 andMontage:(id)a4
{
  v6 = -[MCObject initWithImprint:andMontage:](self, "initWithImprint:andMontage:");
  if (v6)
  {
    v6->mObjectID = (NSString *)[a3 objectForKey:@"id"];
    v6->mMontage = (MCMontage *)a4;
  }

  return v6;
}

- (id)initSnapshot
{
  v2 = -[MCObject init](self, "init");
  if (v2) {
    v2->mObjectID = (NSString *)@"Snapshot";
  }
  return v2;
}

- (id)_initWithObjectID:(id)a3
{
  v4 = -[MCObject init](self, "init");
  if (v4) {
    v4->mObjectID = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->mObjectID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCObject;
  -[MCObjectBase dealloc](&v3, "dealloc");
}

- (void)demolish
{
  self->mMontage = 0LL;
}

- (BOOL)isSnapshot
{
  return self->mObjectID == (NSString *)@"Snapshot";
}

- (id)imprint
{
  objc_super v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  NSStringFromClass(v3),  @"type",  self->mObjectID,  @"id",  0LL);
}

- (id)snapshot
{
  id v3 = objc_msgSend(objc_alloc((Class)objc_opt_class(self, a2)), "initSnapshot");
  -[MCObjectBase _copySelfToSnapshot:](self, "_copySelfToSnapshot:", v3);
  return v3;
}

- (NSString)objectID
{
  return self->mObjectID;
}

- (MCMontage)montage
{
  return self->mMontage;
}

@end