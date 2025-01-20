@interface IDSDataMigrationTracker
+ (id)sharedInstance;
- (BOOL)completedMigration;
- (BOOL)hasPerformedMigration;
- (CUTPromise)currentPromise;
- (IDSDataMigrationTracker)init;
- (id)performMigrationIfNeeded;
- (os_unfair_lock_s)lock;
- (void)setCompletedMigration:(BOOL)a3;
- (void)setCurrentPromise:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation IDSDataMigrationTracker

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001DBB88;
  block[3] = &unk_1008F6558;
  block[4] = a1;
  if (qword_1009BEE30 != -1) {
    dispatch_once(&qword_1009BEE30, block);
  }
  return (id)qword_1009BEE28;
}

- (IDSDataMigrationTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSDataMigrationTracker;
  result = -[IDSDataMigrationTracker init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)hasPerformedMigration
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_completedMigration;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)performMigrationIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_completedMigration)
  {
    os_unfair_lock_unlock(p_lock);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUTPromise fulfilledPromiseWithValue:](&OBJC_CLASS___CUTPromise, "fulfilledPromiseWithValue:", v4));

    return v5;
  }

  else
  {
    currentPromise = self->_currentPromise;
    if (!currentPromise)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      uint64_t v14 = 0LL;
      v15 = &v14;
      uint64_t v16 = 0x3032000000LL;
      v17 = sub_1001DBDA4;
      v18 = sub_1001DBDB4;
      v19 = (CUTPromiseSeal *)0xAAAAAAAAAAAAAAAALL;
      v19 = -[CUTPromiseSeal initWithQueue:](objc_alloc(&OBJC_CLASS___CUTPromiseSeal), "initWithQueue:", v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1001DBDBC;
      v13[3] = &unk_1008F7E58;
      v13[4] = self;
      v13[5] = &v14;
      dispatch_async(v9, v13);
      v10 = (CUTPromise *)objc_claimAutoreleasedReturnValue([(id)v15[5] promise]);
      v11 = self->_currentPromise;
      self->_currentPromise = v10;

      _Block_object_dispose(&v14, 8);
      currentPromise = self->_currentPromise;
    }

    v12 = currentPromise;
    os_unfair_lock_unlock(p_lock);
    return v12;
  }

- (BOOL)completedMigration
{
  return self->_completedMigration;
}

- (void)setCompletedMigration:(BOOL)a3
{
  self->_completedMigration = a3;
}

- (CUTPromise)currentPromise
{
  return self->_currentPromise;
}

- (void)setCurrentPromise:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end