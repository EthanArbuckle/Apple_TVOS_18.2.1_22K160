@interface MISystemAppMigrationState
+ (id)defaultManager;
- (BOOL)systemAppMigrationComplete;
- (MISystemAppMigrationState)init;
- (NSMutableArray)blockArray;
- (OS_dispatch_queue)systemAppMigrationStateQueue;
- (void)setBlockArray:(id)a3;
- (void)setSystemAppMigrationComplete:(BOOL)a3;
- (void)waitForSystemAppMigrationToComplete:(id)a3;
@end

@implementation MISystemAppMigrationState

- (MISystemAppMigrationState)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MISystemAppMigrationState;
  v2 = -[MISystemAppMigrationState init](&v9, "init");
  if (!v2) {
    return v2;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.installd.SystemAppMigrationState", 0LL);
  systemAppMigrationStateQueue = v2->_systemAppMigrationStateQueue;
  v2->_systemAppMigrationStateQueue = (OS_dispatch_queue *)v3;

  if ((sub_100029B88() & 1) != 0) {
    goto LABEL_9;
  }
  if (!&_DMIsMigrationNeeded || (DMIsMigrationNeeded() & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 migrationPlistURL]);
    MIRecordCurrentBuildVersion(v7);

LABEL_9:
    v2->_systemAppMigrationComplete = 1;
    uint64_t v5 = qword_100095BF8;
    return v2;
  }

  v2->_systemAppMigrationComplete = 0;
  uint64_t v5 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5) {
LABEL_11:
  }
    MOLogWrite(v5);
  return v2;
}

+ (id)defaultManager
{
  if (qword_100095B40 != -1) {
    dispatch_once(&qword_100095B40, &stru_100081568);
  }
  return (id)qword_100095B48;
}

- (void)setSystemAppMigrationComplete:(BOOL)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MISystemAppMigrationState systemAppMigrationStateQueue]( self,  "systemAppMigrationStateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002ACC4;
  v6[3] = &unk_100081590;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)systemAppMigrationComplete
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MISystemAppMigrationState systemAppMigrationStateQueue]( self,  "systemAppMigrationStateQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002AF10;
  v5[3] = &unk_100080F48;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitForSystemAppMigrationToComplete:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MISystemAppMigrationState systemAppMigrationStateQueue]( self,  "systemAppMigrationStateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AFBC;
  block[3] = &unk_1000815B8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (NSMutableArray)blockArray
{
  return self->_blockArray;
}

- (void)setBlockArray:(id)a3
{
}

- (OS_dispatch_queue)systemAppMigrationStateQueue
{
  return self->_systemAppMigrationStateQueue;
}

- (void).cxx_destruct
{
}

@end