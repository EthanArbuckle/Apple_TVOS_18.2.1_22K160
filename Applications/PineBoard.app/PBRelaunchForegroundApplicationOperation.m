@interface PBRelaunchForegroundApplicationOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSSet)updatingApplicationIdentifiers;
- (PBRelaunchForegroundApplicationOperation)initWithUpdatingApplicationIdentifiers:(id)a3;
- (void)start;
@end

@implementation PBRelaunchForegroundApplicationOperation

- (PBRelaunchForegroundApplicationOperation)initWithUpdatingApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBRelaunchForegroundApplicationOperation;
  v5 = -[PBRelaunchForegroundApplicationOperation init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = *(void **)&v5->super._private1;
    *(void *)&v5->super._private1 = v6;
  }

  return v5;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (char)v2->super._private;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE1(v2->super._private);
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  unsigned int v3 = -[PBRelaunchForegroundApplicationOperation isCancelled](self, "isCancelled");
  id v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    -[PBRelaunchForegroundApplicationOperation willChangeValueForKey:](v4, "willChangeValueForKey:", @"finished");
    BYTE1(v4->super._private) = 1;
    -[PBRelaunchForegroundApplicationOperation didChangeValueForKey:](v4, "didChangeValueForKey:", @"finished");
    objc_sync_exit(v4);
  }

  else
  {
    -[PBRelaunchForegroundApplicationOperation willChangeValueForKey:](v4, "willChangeValueForKey:", @"executing");
    LOBYTE(v4->super._private) = 1;
    -[PBRelaunchForegroundApplicationOperation didChangeValueForKey:](v4, "didChangeValueForKey:", @"executing");
    objc_sync_exit(v4);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018778;
    block[3] = &unk_1003CFF08;
    block[4] = v4;
    dispatch_async(&_dispatch_main_q, block);
  }

- (NSSet)updatingApplicationIdentifiers
{
  return *(NSSet **)&self->super._private1;
}

- (void).cxx_destruct
{
}

@end