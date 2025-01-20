@interface _CPLProgress
- (BOOL)firstSyncForMainLibrary;
- (BOOL)isForeground;
- (CPLEngineSyncManager)syncManager;
- (NSString)identifier;
- (_CPLProgress)initWithIdentifier:(id)a3 firstSyncOfMainLibrary:(BOOL)a4;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)_publishRealProgressIfNecessary;
- (void)publish;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setForeground:(BOOL)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)unpublish;
@end

@implementation _CPLProgress

- (_CPLProgress)initWithIdentifier:(id)a3 firstSyncOfMainLibrary:(BOOL)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____CPLProgress;
  v7 = -[_CPLProgress init](&v16, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_firstSyncForMainLibrary = a4;
    v17[0] = NSProgressCategoryKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.cpl." stringByAppendingString:v6]);
    v17[1] = @"_CPLIsInitialSync";
    v18[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7->_firstSyncForMainLibrary));
    v18[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    userInfo = v7->_userInfo;
    v7->_userInfo = v13;
  }

  return v7;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
  progress = self->_progress;
  if (progress) {
    -[NSProgress setTotalUnitCount:](progress, "setTotalUnitCount:");
  }
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
  progress = self->_progress;
  if (progress) {
    -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
  }
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  userInfo = self->_userInfo;
  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](userInfo, "setObject:forKeyedSubscript:", v9, v6);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](userInfo, "removeObjectForKey:", v6);
  }
  progress = self->_progress;
  if (progress) {
    -[NSProgress setUserInfoObject:forKey:](progress, "setUserInfoObject:forKey:", v9, v6);
  }
}

- (void)_publishRealProgressIfNecessary
{
  if (self->_progress) {
    sub_10019A66C((uint64_t)a2, (uint64_t)self);
  }
  if (self->_foreground)
  {
    v3 = -[NSProgress initWithParent:userInfo:]( objc_alloc(&OBJC_CLASS___NSProgress),  "initWithParent:userInfo:",  0LL,  self->_userInfo);
    progress = self->_progress;
    self->_progress = v3;

    -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", self->_totalUnitCount);
    -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", self->_completedUnitCount);
    -[NSProgress setCancellable:](self->_progress, "setCancellable:", 0LL);
    -[NSProgress setPausable:](self->_progress, "setPausable:", 0LL);
    -[NSProgress _publish](self->_progress, "_publish");
  }

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
  BOOL publishing = self->_publishing;
  progress = self->_progress;
  if (!publishing || progress != 0LL || !a3)
  {
    if (progress)
    {
      if (!a3)
      {
        -[NSProgress _unpublish](progress, "_unpublish");
        v8 = self->_progress;
        self->_progress = 0LL;
      }
    }
  }

  else
  {
    -[_CPLProgress _publishRealProgressIfNecessary](self, "_publishRealProgressIfNecessary");
  }

- (void)publish
{
  if (!self->_publishing)
  {
    -[_CPLProgress _publishRealProgressIfNecessary](self, "_publishRealProgressIfNecessary");
    self->_BOOL publishing = 1;
  }

- (void)unpublish
{
  if (self->_publishing)
  {
    progress = self->_progress;
    if (progress)
    {
      -[NSProgress _unpublish](progress, "_unpublish");
      v4 = self->_progress;
      self->_progress = 0LL;
    }

    self->_BOOL publishing = 0;
  }

- (CPLEngineSyncManager)syncManager
{
  return self->_syncManager;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)firstSyncForMainLibrary
{
  return self->_firstSyncForMainLibrary;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void).cxx_destruct
{
}

@end