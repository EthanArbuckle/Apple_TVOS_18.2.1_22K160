@interface PBMRSupportedCommandsTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)shouldWatchdog:(id *)a3;
- (NSArray)supportedCommands;
- (PBMRSupportedCommandsTransaction)initWithClient:(id)a3 playerPath:(void *)a4;
- (PBMRSupportedCommandsTransaction)initWithPlayerPath:(void *)a3;
- (void)_begin;
- (void)_receiveSupportedCommands:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)playerPath;
@end

@implementation PBMRSupportedCommandsTransaction

- (PBMRSupportedCommandsTransaction)initWithClient:(id)a3 playerPath:(void *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBMRSupportedCommandsTransaction;
  v5 = -[PBMediaRemoteTransaction initWithClient:](&v9, "initWithClient:", a3);
  if (v5)
  {
    v5->_playerPath = (void *)CFRetain(a4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    supportedCommands = v5->_supportedCommands;
    v5->_supportedCommands = (NSArray *)v6;
  }

  return v5;
}

- (PBMRSupportedCommandsTransaction)initWithPlayerPath:(void *)a3
{
  id v5 = [(id)objc_opt_class(self) _defaultClient];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[PBMRSupportedCommandsTransaction initWithClient:playerPath:](self, "initWithClient:playerPath:", v6, a3);

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMRSupportedCommandsTransaction;
  -[PBMRSupportedCommandsTransaction dealloc](&v3, "dealloc");
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBMRSupportedCommandsTransaction;
  -[PBMediaRemoteTransaction _begin](&v8, "_begin");
  -[PBMRSupportedCommandsTransaction addMilestone:](self, "addMilestone:", @"kPBMRGetSupportedCommandsMilestone");
  objc_initWeak(&location, self);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteTransaction client](self, "client"));
  playerPath = self->_playerPath;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10006CF68;
  v5[3] = &unk_1003D2B08;
  objc_copyWeak(&v6, &location);
  [v3 getSupportedCommandsForPlayer:playerPath completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)shouldWatchdog:(id *)a3
{
  return 1;
}

- (void)_receiveSupportedCommands:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[PBMediaRemoteTransaction _failWithMediaRemoteError:](self, "_failWithMediaRemoteError:", v7);
  }

  else if (v6)
  {
    objc_super v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
    supportedCommands = self->_supportedCommands;
    self->_supportedCommands = v8;
  }
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
}

@end