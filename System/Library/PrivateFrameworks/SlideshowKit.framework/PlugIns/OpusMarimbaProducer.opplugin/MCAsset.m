@interface MCAsset
- (BOOL)isInUse;
- (MCAsset)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSString)path;
- (id)description;
- (id)imprint;
- (void)_copySelfToSnapshot:(id)a3;
- (void)demolish;
- (void)setPath:(id)a3;
@end

@implementation MCAsset

- (MCAsset)initWithImprint:(id)a3 andMontage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCAsset;
  v5 = -[MCObject initWithImprint:andMontage:](&v7, "initWithImprint:andMontage:", a3, a4);
  if (v5) {
    v5->mPath = (NSString *)[a3 objectForKey:@"path"];
  }
  return v5;
}

- (void)demolish
{
  self->mPath = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAsset;
  -[MCObject demolish](&v3, "demolish");
}

- (id)imprint
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCAsset;
  id v3 = -[MCObject imprint](&v7, "imprint");
  v4 = v3;
  mPath = self->mPath;
  if (mPath) {
    [v3 setObject:mPath forKey:@"path"];
  }
  return v4;
}

- (BOOL)isInUse
{
  return 0;
}

- (void)_copySelfToSnapshot:(id)a3
{
  *((void *)a3 + 1) = self->super.mMontage;
  mPath = self->mPath;
  if (mPath) {
    *((void *)a3 + 3) = -[NSString copy](mPath, "copy");
  }
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCAsset;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: '%@'",  -[MCAsset description](&v3, "description"),  self->mPath);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPath:(id)a3
{
}

@end