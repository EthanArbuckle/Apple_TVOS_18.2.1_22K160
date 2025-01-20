@interface FudStateMachine
+ (BOOL)supportsSecureCoding;
+ (id)stepName:(int)a3;
+ (void)initialize;
- (AUDAccessory)accessory;
- (BOOL)conformsToAllowedValuesForKey:(id)a3 value:(id)a4;
- (BOOL)isActive;
- (BOOL)performStep:(int)a3 withOptions:(id)a4;
- (BOOL)pluginForcedSilentUpdate;
- (BOOL)showPersonalizationRequiredDialogAndGetResponse;
- (FudStateMachine)initWithCoder:(id)a3;
- (FudStateMachine)initWithPluginName:(id)a3 filterName:(id)a4 delegate:(id)a5 options:(id)a6;
- (FudStateMachineDelegate)delegate;
- (NSDictionary)pluginOptions;
- (NSString)stateMachineFilterName;
- (NSString)stateMachinePluginName;
- (NSString)stateMachineRevision;
- (id)createBeginningOfUpdateDictForEvent:(id)a3 info:(id)a4;
- (id)createEndOfUpdateDictForEvent:(id)a3 info:(id)a4;
- (id)exception;
- (id)getMatchingFilter;
- (id)loadPlugin;
- (int)nextStep:(id *)a3;
- (int)performNextStepWithOptions:(id)a3;
- (void)accessoryDisconnected:(id)a3;
- (void)clearException;
- (void)dealloc;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 error:(id)a6;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didRunStateWithInfo:(id)a3;
- (void)doneWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)issueNotification:(id)a3;
- (void)log:(int)a3 format:(id)a4;
- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5;
- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5;
- (void)personalizationRequest:(id)a3;
- (void)progress:(double)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)runState;
- (void)runStateDoApply;
- (void)runStateDoBootstrap;
- (void)runStateDoCheck;
- (void)runStateDoDownload;
- (void)runStateDoFinish;
- (void)runStateDoPrepare;
- (void)runStateEnd;
- (void)runStateQueryNeedsBootstrap;
- (void)runStateQueryNeedsRemoteCheck;
- (void)runStateStart;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setException:(id)a3;
- (void)setPluginOptions:(id)a3;
@end

@implementation FudStateMachine

+ (void)initialize
{
  qword_10008DDA0 = (uint64_t)"runStateStart";
  qword_10008DDC0 = (uint64_t)"runStateEnd";
  qword_10008DDE0 = (uint64_t)"runStateQueryNeedsBootstrap";
  qword_10008DE00 = (uint64_t)"runStateDoBootstrap";
  qword_10008DE20 = (uint64_t)"runStateQueryNeedsRemoteCheck";
  qword_10008DE40 = (uint64_t)"runStateDoCheck";
  qword_10008DE60 = (uint64_t)"runStateDoCheck";
  qword_10008DE80 = (uint64_t)"runStateDoDownload";
  qword_10008DEA0 = (uint64_t)"runStateDoPrepare";
  qword_10008DEC0 = (uint64_t)"runStateDoApply";
  qword_10008DEE0 = (uint64_t)"runStateDoFinish";
  qword_10008DF00 = (uint64_t)"runStateDoFinish";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stepName:(int)a3
{
  else {
    return +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (&off_100075788)[a3],  4LL);
  }
}

- (FudStateMachine)initWithPluginName:(id)a3 filterName:(id)a4 delegate:(id)a5 options:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___FudStateMachine;
  v11 = -[FudStateMachine init](&v20, "init", "-[FudStateMachine initWithPluginName:filterName:delegate:options:]");
  v12 = (FudStateMachine *)v11;
  if (a3 && a4)
  {
    if (v11)
    {
      v11[161] = 0;
      *(void *)(v11 + 164) = 0xFFFFFFFF00000002LL;
      *((void *)v11 + 1) = a3;
      v12->stateMachineFilterName = (NSString *)a4;
      v12->stateMachineRevision = 0LL;
      v12->plugin = 0LL;
      v12->pluginInfo = 0LL;
      v13 = (NSDictionary *)a6;
      v12->pluginOptions = 0LL;
      v12->defaultOptions = v13;
      v12->remoteCheck = 0;
      v12->pluginForcedSilentUpdate = 0;
      v12->exception = 0LL;
      v12->pluginProgressWeights = 0LL;
      v12->hasSleepAssertion = 0;
      if (qword_10008E350 != -1) {
        dispatch_once(&qword_10008E350, &stru_1000757E0);
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_10008E360, 0xFFFFFFFFFFFFFFFFLL);
      v14 = (OS_dispatch_queue *)[(id)qword_10008E358 objectForKey:v12->stateMachinePluginName];
      v12->workQueue = v14;
      if (!v14)
      {
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
        dispatch_queue_t v17 = dispatch_queue_create("com.apple.fud.statemachine", v16);
        v12->workQueue = (OS_dispatch_queue *)v17;
        [(id)qword_10008E358 setObject:v17 forKey:v12->stateMachinePluginName];
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)qword_10008E360);
      v12->validCallback = 0LL;
      v12->personalizer = 0LL;
      v12->accessory = 0LL;
      v12->needsDeviceList = 0;
      v12->accessoryModelNumber =  +[NSString stringWithString:]( &OBJC_CLASS___NSString,  "stringWithString:",  v12->stateMachineFilterName);
      v12->existingFWVersionOnAcc =  +[NSString stringWithString:]( &OBJC_CLASS___NSString,  "stringWithString:",  @"Unknown");
      v12->newFWVersionAvailable =  +[NSString stringWithString:]( &OBJC_CLASS___NSString,  "stringWithString:",  @"Unknown");
      v12->transportType =  +[NSString stringWithString:]( &OBJC_CLASS___NSString,  "stringWithString:",  @"Unknown");
      v12->resumePercent =  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL);
      v12->resumeCount =  +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL);
      -[FudStateMachine setDelegate:](v12, "setDelegate:", a5);
    }
  }

  else
  {
    FudLog(3LL, @"%s: Invalid arguments: pluginName=%@ filterName=%@");
    v18 = v12;
    return 0LL;
  }

  return v12;
}

- (void)dealloc
{
  stateMachinePluginName = self->stateMachinePluginName;
  stateMachineFilterName = self->stateMachineFilterName;
  FudLog(5LL, @"StateMachine Dealloc pluginName=%@ filterName=%@");
  -[FudStateMachine clearException](self, "clearException", stateMachinePluginName, stateMachineFilterName);
  plugin = self->plugin;
  if (plugin)
  {
    -[FudPlugin setDelegate:](plugin, "setDelegate:", 0LL);
  }

  accessory = self->accessory;
  if (accessory) {

  }
  personalizer = self->personalizer;
  if (personalizer) {

  }
  v6 = self->stateMachinePluginName;
  if (v6) {

  }
  v7 = self->stateMachineFilterName;
  if (v7) {

  }
  stateMachineRevision = self->stateMachineRevision;
  if (stateMachineRevision) {

  }
  pluginProgressWeights = self->pluginProgressWeights;
  if (pluginProgressWeights) {

  }
  pluginInfo = self->pluginInfo;
  if (pluginInfo) {

  }
  pluginOptions = self->pluginOptions;
  if (pluginOptions) {

  }
  defaultOptions = self->defaultOptions;
  if (defaultOptions) {

  }
  accessoryModelNumber = self->accessoryModelNumber;
  if (accessoryModelNumber) {

  }
  existingFWVersionOnAcc = self->existingFWVersionOnAcc;
  if (existingFWVersionOnAcc) {

  }
  newFWVersionAvailable = self->newFWVersionAvailable;
  if (newFWVersionAvailable) {

  }
  transportType = self->transportType;
  if (transportType) {

  }
  resumePercent = self->resumePercent;
  if (resumePercent) {

  }
  resumeCount = self->resumeCount;
  if (resumeCount) {

  }
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FudStateMachine;
  -[FudStateMachine dealloc](&v21, "dealloc");
}

- (int)performNextStepWithOptions:(id)a3
{
  v11 = "-[FudStateMachine performNextStepWithOptions:]";
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->busy)
  {
    FudLog(4LL, @"%s: state machine is busy");
    objc_sync_exit(self);
    return -1;
  }

  int state = self->state;
  defaultOptions = self->defaultOptions;
  if (!a3)
  {
    if (!defaultOptions)
    {
      v8 = 0LL;
      goto LABEL_9;
    }

    goto LABEL_7;
  }

  if (defaultOptions)
  {
LABEL_7:
    v7 = (NSMutableDictionary *)-[NSDictionary mutableCopy]( defaultOptions,  "mutableCopy",  "-[FudStateMachine performNextStepWithOptions:]");
    goto LABEL_8;
  }

  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_8:
  v8 = v7;
  -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", a3, v11);
LABEL_9:
  self->busy = 1;
  -[FudStateMachine setPluginOptions:](self, "setPluginOptions:", v8, v11);

  objc_sync_exit(self);
  if (self->exception) {
    FudLog(4LL, @"%s: uncleared exception (%@)");
  }
  workQueue = (dispatch_queue_s *)self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AAFC;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
  FudLog(7LL, @"Exiting: %s");
  return state;
}

- (void)doneWithOptions:(id)a3
{
  workQueue = (dispatch_queue_s *)self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001ABA0;
  block[3] = &unk_100074F50;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
  FudLog(7LL, @"Exiting: %s");
}

- (id)exception
{
  return self->exception;
}

- (void)clearException
{
}

- (BOOL)performStep:(int)a3 withOptions:(id)a4
{
  if (a3 < 0xC)
  {
    uint64_t state = self->state;
    if ((_DWORD)state == a3 || LODWORD((&off_10008DD88)[4 * state + 2]) == a3) {
      return -[FudStateMachine performNextStepWithOptions:]( self,  "performNextStepWithOptions:",  a4,  "-[FudStateMachine performStep:withOptions:]") != -1;
    }
    +[FudStateMachine stepName:]( &OBJC_CLASS___FudStateMachine,  "stepName:",  LODWORD((&off_10008DD88)[4 * a3 + 2]),  "-[FudStateMachine performStep:withOptions:]");
    +[FudStateMachine stepName:]( &OBJC_CLASS___FudStateMachine,  "stepName:",  LODWORD((&off_10008DD88)[4 * self->state + 2]));
    v7 = @"%s: attempt to perform step '%@' which is invalid from step '%@'";
  }

  else
  {
    v7 = @"%s: invalid step requested: %d";
  }

  FudLog(3LL, v7);
  return 0;
}

- (int)nextStep:(id *)a3
{
  if (self->busy)
  {
    v10 = sub_10001AE14( self,  8u,  (uint64_t)@"%s: state machine is busy",  v5,  v6,  v7,  v8,  v9,  (uint64_t)"-[FudStateMachine nextStep:]");
    if (a3)
    {
      *a3 = v10;
    }

    else if (v10)
    {
    }

    int v11 = -1;
  }

  else
  {
    if (a3) {
      *a3 = 0LL;
    }
    int v11 = (int)(&off_10008DD88)[4 * self->state + 2];
  }

  objc_sync_exit(self);
  return v11;
}

- (void)setException:(id)a3
{
  exception = self->exception;
  if (exception)
  {

    self->exception = 0LL;
  }

  if (a3)
  {
    if ([a3 userInfo])
    {
      if (objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"PluginName")
        && objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"DeviceClassName"))
      {
        uint64_t v6 = (NSError *)a3;
LABEL_17:
        self->exception = v6;
        return;
      }

      uint64_t v8 = objc_opt_class([a3 userInfo]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
      v10 = (NSMutableDictionary *)[a3 userInfo];
      int v11 = v10;
      if (v8 == v9)
      {
LABEL_12:
        if (!-[NSMutableDictionary objectForKey:](v11, "objectForKey:", @"PluginName")) {
          -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  self->stateMachinePluginName,  @"PluginName");
        }
        if (!-[NSMutableDictionary objectForKey:](v11, "objectForKey:", @"DeviceClassName")) {
          -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  self->stateMachineFilterName,  @"DeviceClassName");
        }
        uint64_t v6 = -[NSError initWithDomain:code:userInfo:]( [NSError alloc],  "initWithDomain:code:userInfo:",  [a3 domain],  objc_msgSend(a3, "code"),  v11);
        goto LABEL_17;
      }

      uint64_t v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v10, "mutableCopy");
    }

    else
    {
      uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL);
    }

    int v11 = v7;
    goto LABEL_12;
  }

- (BOOL)isActive
{
  FudLog(5LL, @"%s: state=%d nextState=%d filter=%@");
  int state = self->state;
  BOOL needsDeviceList = (state - 2) < 9;
  if (!state) {
    BOOL needsDeviceList = self->needsDeviceList;
  }
  BOOL v5 = state == 2 && needsDeviceList;
  if (self->nextState == -1) {
    return v5;
  }
  else {
    return needsDeviceList;
  }
}

- (id)loadPlugin
{
  id result = self->plugin;
  if (!result)
  {
    stateMachineDelegate = self->stateMachineDelegate;
    if (stateMachineDelegate)
    {
      self->plugin = (FudPlugin *) -[FudStateMachineDelegate getPluginWithName:forFilter:delegate:info:options:]( stateMachineDelegate,  "getPluginWithName:forFilter:delegate:info:options:",  self->stateMachinePluginName,  self->stateMachineFilterName,  self,  &self->pluginInfo,  self->pluginOptions,  "-[FudStateMachine loadPlugin]");
      pluginInfo = self->pluginInfo;
      if (pluginInfo)
      {
        int v11 = pluginInfo;
        ProgressWeightsFromPluginInfo = (FudProgressWeights *)getProgressWeightsFromPluginInfo(self->pluginInfo);
        self->pluginProgressWeights = ProgressWeightsFromPluginInfo;
        if (ProgressWeightsFromPluginInfo) {
          v13 = ProgressWeightsFromPluginInfo;
        }
        if (-[NSDictionary objectForKey:](self->pluginInfo, "objectForKey:", @"AccessoryIdentifier"))
        {
          accessoryModelNumber = self->accessoryModelNumber;
          if (accessoryModelNumber)
          {

            self->accessoryModelNumber = 0LL;
          }

          self->accessoryModelNumber = (NSString *)objc_msgSend( -[NSDictionary objectForKey:]( self->pluginInfo,  "objectForKey:",  @"AccessoryIdentifier"),  "copy");
        }
      }

      FudLog(7LL, @"Progress weights are: %@");
    }

    else
    {
      -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  1u,  (uint64_t)@"%s: unable to load plugin. no state machine delegate set!",  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[FudStateMachine loadPlugin]"));
    }

    id result = self->plugin;
    if (!result)
    {
      -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  3u,  (uint64_t)@"%s: failed to get plugin from delegate",  v15,  v16,  v17,  v18,  v19,  (uint64_t)"-[FudStateMachine loadPlugin]"));
      return self->plugin;
    }
  }

  return result;
}

- (void)runState
{
  uint64_t state = self->state;
  if (state >= 0xC)
  {
    uint64_t v9 = sub_10001AE14( self,  9u,  (uint64_t)@"%s: invalid state: %d",  v3,  v4,  v5,  v6,  v7,  (uint64_t)"-[FudStateMachine runState]");
LABEL_8:
    -[FudStateMachine setException:](self, "setException:", v9);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
    goto LABEL_11;
  }

  char v10 = objc_opt_respondsToSelector(self, (&off_10008DD88)[4 * state + 3]);
  int v16 = self->state;
  if ((v10 & 1) == 0)
  {
    uint64_t v9 = sub_10001AE14( self,  0xAu,  (uint64_t)@"%s: invalid selector for state %s",  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[FudStateMachine runState]");
    goto LABEL_8;
  }

  self->nextState = v16;
  if (v16 == LODWORD((&off_10008DD88)[4 * v16 + 2]))
  {
    -[FudStateMachine clearException](self, "clearException", "-[FudStateMachine runState]");
    if ((objc_opt_respondsToSelector(self->stateMachineDelegate, "stepWillBegin:stateMachine:") & 1) != 0) {
      -[FudStateMachineDelegate stepWillBegin:stateMachine:]( self->stateMachineDelegate,  "stepWillBegin:stateMachine:",  self->state,  self);
    }
    else {
      FudLog(4LL, @"%s: cannot send stepWillBegin because delegate does not respond to it.");
    }
  }

  uint64_t v17 = self;
  dispatch_group_enter((dispatch_group_t)qword_10008F5A0);
  uint64_t v18 = (&off_10008DD88)[4 * self->state];
  FudLog(5LL, @"%s: invoking selector for state %s");
  -[FudStateMachine performSelector:]( self,  "performSelector:",  (&off_10008DD88)[4 * self->state + 3],  "-[FudStateMachine runState]",  v18);
LABEL_11:
  FudLog(7LL, @"Exiting: %s");
}

- (void)didRunStateWithInfo:(id)a3
{
  uint64_t state = self->state;
  uint64_t v17 = "-[FudStateMachine didRunStateWithInfo:]";
  FudLog(7LL, @"Entering: %s");
  if ((self->state - 5) <= 1)
  {
    if ((objc_opt_respondsToSelector(self->plugin, "shouldUpdateBeSilent:") & 1) != 0)
    {
      unsigned int pluginForcedSilentUpdate = -[FudPlugin shouldUpdateBeSilent:]( self->plugin,  "shouldUpdateBeSilent:",  0LL,  "-[FudStateMachine didRunStateWithInfo:]");
      self->unsigned int pluginForcedSilentUpdate = pluginForcedSilentUpdate;
    }

    else
    {
      unsigned int pluginForcedSilentUpdate = self->pluginForcedSilentUpdate;
    }

    uint64_t v17 = "-[FudStateMachine didRunStateWithInfo:]";
    uint64_t v18 = pluginForcedSilentUpdate;
    FudLog(5LL, @"%s(): unsigned int pluginForcedSilentUpdate = %d");
  }

  int nextState = self->nextState;
  if (nextState == -1) {
    int nextState = self->state;
  }
  else {
    self->uint64_t state = nextState;
  }
  self->busy = 0;
  uint64_t v8 = &(&off_10008DD88)[4 * state];
  int v10 = *((_DWORD *)v8 + 4);
  uint64_t v9 = (unsigned int *)(v8 + 2);
  if (v10 != LODWORD((&off_10008DD88)[4 * nextState + 2])
    || nextState != 11 && self->exception
    || (int v11 = 0, (_DWORD)state == 11) && nextState == 8)
  {
    id v19 = +[FudStateMachine stepName:]( &OBJC_CLASS___FudStateMachine,  "stepName:",  "-[FudStateMachine didRunStateWithInfo:]",  v18);
    FudLog(5LL, @"%s: reporting completion of step '%@' to delegate");
    -[FudStateMachineDelegate stepComplete:stateMachine:status:error:info:]( self->stateMachineDelegate,  "stepComplete:stateMachine:status:error:info:",  *v9,  self,  self->exception == 0LL,  "-[FudStateMachine didRunStateWithInfo:]",  v19);
    int v11 = 1;
  }

  if (a3)
  {
    uint64_t ProgressWeightsFromPluginInfo = getProgressWeightsFromPluginInfo(a3);
    if (ProgressWeightsFromPluginInfo)
    {
      uint64_t v13 = (void *)ProgressWeightsFromPluginInfo;

      self->pluginProgressWeights = (FudProgressWeights *)v13;
    }

    id v14 = objc_msgSend(a3, "objectForKey:", @"DeviceClassRevision", v17);
    if (v14)
    {
      uint64_t v15 = v14;

      self->stateMachineRevision = (NSString *)v15;
    }
  }

  dispatch_group_leave((dispatch_group_t)qword_10008F5A0);

  uint64_t v16 = self->state;
  if ((_DWORD)state == (_DWORD)v16)
  {
    FudLog(5LL, @"%s: staying in state %s");
  }

  else
  {
    objc_super v20 = (&off_10008DD88)[4 * state];
    objc_super v21 = (&off_10008DD88)[4 * v16];
    FudLog(5LL, @"%s: transition from state %s to %s");
    if (!v11 || self->state == 1) {
      -[FudStateMachine performNextStepWithOptions:]( self,  "performNextStepWithOptions:",  self->pluginOptions,  "-[FudStateMachine didRunStateWithInfo:]",  v20,  v21);
    }
  }

  FudLog(7LL, @"Exiting: %s");
}

- (id)getMatchingFilter
{
  id v3 = -[FudStateMachineDelegate getStorage](self->stateMachineDelegate, "getStorage");
  if (v3)
  {
    id v9 = [v3 getPolicyForFilterName:self->stateMachineFilterName];
    if (v9)
    {
      id result = [v9 getMatchingFilterWithName:self->stateMachineFilterName];
      if (result) {
        return result;
      }
      objc_super v21 = sub_10001AE14( self,  5u,  (uint64_t)@"%s: failed to get filter for %@ from policy",  v16,  v17,  v18,  v19,  v20,  (uint64_t)"-[FudStateMachine getMatchingFilter]");
    }

    else
    {
      objc_super v21 = sub_10001AE14( self,  4u,  (uint64_t)@"%s: failed to get policy for %@ from storage",  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[FudStateMachine getMatchingFilter]");
    }
  }

  else
  {
    objc_super v21 = sub_10001AE14( self,  2u,  (uint64_t)@"%s: failed to get storage from delegate",  v4,  v5,  v6,  v7,  v8,  (uint64_t)"-[FudStateMachine getMatchingFilter]");
  }

  -[FudStateMachine setException:](self, "setException:", v21);
  return 0LL;
}

- (void)runStateStart
{
  self->int nextState = (int)(&off_10008DD88)[4 * self->state + 1];
  -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
}

- (void)runStateEnd
{
}

- (void)runStateQueryNeedsBootstrap
{
  id v3 = -[FudStateMachine getMatchingFilter](self, "getMatchingFilter", "-[FudStateMachine runStateQueryNeedsBootstrap]");
  if (!v3) {
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  [v3 filterName],  @"updates.attempts",  0,  1);
  uint64_t v17 = [v4 needsQueryDevices];
  accessory = self->accessory;
  FudLog(6LL, @"%s: needsQuery=%d accessory=%p");
  if (objc_msgSend( v4,  "needsQueryDevices",  "-[FudStateMachine runStateQueryNeedsBootstrap]",  v17,  accessory))
  {
    uint64_t v5 = self->accessory;
    if (v5)
    {
LABEL_14:
      pluginOptions = self->pluginOptions;
      if (!pluginOptions)
      {
        pluginOptions = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        self->pluginOptions = pluginOptions;
        uint64_t v5 = self->accessory;
      }

      -[NSMutableDictionary setObject:forKey:](pluginOptions, "setObject:forKey:", v5, @"AccessoryOption");
      goto LABEL_17;
    }

    id v19 = 0LL;
    self->BOOL needsDeviceList = 1;
    self->int nextState = 1;
    if (-[FudStateMachine loadPlugin](self, "loadPlugin"))
    {
      if ((-[FudPlugin conformsToProtocol:]( self->plugin,  "conformsToProtocol:",  &OBJC_PROTOCOL___FudQueryPlugin) & 1) != 0)
      {
        -[FudPlugin queryDeviceList:](self->plugin, "queryDeviceList:", &v19);
        if (v19 && [v19 count])
        {
          id v6 = v19;
          uint64_t v7 = (AUDAccessory *)[v19 objectAtIndex:0];
          uint64_t v8 = objc_opt_class(&OBJC_CLASS___AUDAccessory);
          if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
          {
            self->accessory = v7;
            if ((unint64_t)[v19 count] >= 2)
            {
              uint64_t v9 = 1LL;
              int v10 = 1;
              do
              {
                -[FudStateMachineDelegate queueUpEventForAccessory:stateMachine:]( self->stateMachineDelegate,  "queueUpEventForAccessory:stateMachine:",  [v19 objectAtIndex:v9],  self);
                uint64_t v9 = (unsigned __int16)++v10;
              }

              while ((unint64_t)[v19 count] > (unsigned __int16)v10);
            }

            goto LABEL_13;
          }

          uint64_t v16 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
          uint64_t v15 = @"%s: List contains invalid device types";
        }

        else
        {
          uint64_t v16 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
          uint64_t v15 = @"%s: Plugin returned empty device list";
        }
      }

      else
      {
        uint64_t v16 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
        uint64_t v15 = @"%s: Plugin doesn't implement Query protocol";
      }
    }

    else
    {
      uint64_t v16 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
      uint64_t v15 = @"%s: Failed to load plugin";
    }

    FudLog(3LL, v15);
    goto LABEL_21;
  }

- (void)runStateDoBootstrap
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoBootstrap]"))
  {
    self->validCallback = "didBootstrap:info:error:";
    -[FudPlugin bootstrapWithOptions:](self->plugin, "bootstrapWithOptions:", self->pluginOptions);
  }

  else
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
  }

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->validCallback == "didBootstrap:info:error:")
  {
    self->validCallback = 0LL;
    objc_sync_exit(self);
    if (-[NSString containsString:]( self->stateMachineFilterName,  "containsString:",  @"AppleSTDP2700Bootstrap",  "-[FudStateMachine didBootstrap:info:error:]"))
    {
      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = !v7;
    }

    if (v9)
    {
      +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL);
      +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"error",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"bootstrap.%@.%ld",  [a5 domain],  objc_msgSend(a5, "code")),  1);
      if (-[FudStateMachine getMatchingFilter](self, "getMatchingFilter"))
      {
        self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
        if (a5)
        {
          -[FudStateMachine setException:](self, "setException:", a5);
          if (objc_msgSend( objc_msgSend(a5, "domain"),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
            && [a5 code] == (id)1)
          {
            uint64_t v18 = "-[FudStateMachine didBootstrap:info:error:]";
            id v19 = a5;
            FudLog(7LL, @"%s: plugin returned update Interrupted error: %@");
            uint64_t v15 = @"com.apple.fud.updateInterrupted";
          }

          else
          {
            uint64_t v15 = @"com.apple.fud.updateFailed";
          }

          uint64_t v16 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v15, v18, v19);
          id v20 = -[FudStateMachine createEndOfUpdateDictForEvent:info:]( self,  "createEndOfUpdateDictForEvent:info:",  v16,  a4);
          FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
          AnalyticsSendEvent(v16, v20);
          if (v16) {
        }
          }

        else
        {
          -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  7u,  (uint64_t)@"%s: unspecified error from plugin",  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[FudStateMachine didBootstrap:info:error:]"));
        }
      }
    }

    else
    {
      self->int nextState = (int)(&off_10008DD88)[4 * self->state + 1];
      if (a5) {
        FudLog(4LL, @"%s: error returned on success: %@");
      }
    }

    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001BD48;
    block[3] = &unk_1000754A8;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
    FudLog(7LL, @"Exiting: %s");
  }

  else
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
  }

- (void)runStateQueryNeedsRemoteCheck
{
  id v3 = -[FudStateMachineDelegate getStorage]( self->stateMachineDelegate,  "getStorage",  "-[FudStateMachine runStateQueryNeedsRemoteCheck]");
  if (!v3)
  {
    id v20 = sub_10001AE14( self,  2u,  (uint64_t)@"%s: failed to get storage from delegate",  v4,  v5,  v6,  v7,  v8,  (uint64_t)"-[FudStateMachine runStateQueryNeedsRemoteCheck]");
LABEL_10:
    -[FudStateMachine setException:](self, "setException:", v20);
    goto LABEL_15;
  }

  BOOL v9 = v3;
  id v10 = [v3 getPolicyForPlugin:self->stateMachinePluginName];
  if (!v10)
  {
    id v20 = sub_10001AE14( self,  4u,  (uint64_t)@"%s: failed to get policy from storage",  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[FudStateMachine runStateQueryNeedsRemoteCheck]");
    goto LABEL_10;
  }

  self->remoteCheck = 0;
  self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
  if ([v9 policyAllowsRemoteFindNow:v10 filter:self->stateMachineFilterName revision:self->stateMachineRevision])
  {
    sockaddr address = (sockaddr)xmmword_100062B30;
    uint64_t v16 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
    if (v16)
    {
      uint64_t v17 = v16;
      if (SCNetworkReachabilityGetFlags(v16, &flags))
      {
        if ((flags & 2) != 0)
        {
          FudLog(5LL, @"Device is connected to network");
          CFRelease(v17);
          self->remoteCheck = 1;
          self->int nextState = (int)(&off_10008DD88)[4 * self->state + 1];
          goto LABEL_15;
        }

        uint64_t v18 = @"Device is not connected to network";
        uint64_t v19 = 5LL;
      }

      else
      {
        uint64_t v18 = @"Could not determine network reachability for INADDR_ANY";
        uint64_t v19 = 4LL;
      }

      FudLog(v19, v18);
      CFRelease(v17);
    }

    else
    {
      FudLog(4LL, @"Could not create network reachability object");
    }

    FudLog(5LL, @"Find will be local because device is not connected to the network");
  }

- (void)runStateDoCheck
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoCheck]"))
  {
    self->validCallback = "didFind:info:updateAvailable:needsDownload:error:";
    -[FudPlugin findFirmwareWithOptions:remote:]( self->plugin,  "findFirmwareWithOptions:remote:",  self->pluginOptions,  self->remoteCheck);
  }

  else
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
  }

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 error:(id)a6
{
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v11 = a3;
  v33 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->validCallback != "didFind:info:updateAvailable:needsDownload:error:")
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
    return;
  }

  self->validCallback = 0LL;
  objc_sync_exit(self);
  if (a7)
  {
    -[FudStateMachine setException:]( self,  "setException:",  a7,  "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]");
    if (!v11) {
      goto LABEL_23;
    }
LABEL_7:
    if (v9)
    {
      if (a4)
      {
        if ([a4 objectForKeyedSubscript:@"existingFWVersionOnAccessory"])
        {
          existingFWVersionOnAcc = self->existingFWVersionOnAcc;
          if (existingFWVersionOnAcc)
          {

            self->existingFWVersionOnAcc = 0LL;
          }

          self->existingFWVersionOnAcc = (NSString *)objc_msgSend( objc_msgSend( a4,  "objectForKeyedSubscript:",  @"existingFWVersionOnAccessory",  v33),  "copy");
        }

        if (objc_msgSend(a4, "objectForKeyedSubscript:", @"newFWVersion", v33))
        {
          newFWVersionAvailable = self->newFWVersionAvailable;
          if (newFWVersionAvailable)
          {

            self->newFWVersionAvailable = 0LL;
          }

          self->newFWVersionAvailable = (NSString *)objc_msgSend( objc_msgSend( a4,  "objectForKeyedSubscript:",  @"newFWVersion"),  "copy");
        }
      }

      stateMachinePluginName = self->stateMachinePluginName;
      v39[3] = @"newFWVersion";
      v40 = stateMachinePluginName;
      v39[0] = @"pluginName";
      v39[1] = @"modelName";
      __int128 v41 = *(_OWORD *)&self->accessoryModelNumber;
      v39[2] = @"existingFWVersionOnAccessory";
      v42 = self->newFWVersionAvailable;
      objc_super v21 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  v39,  4LL,  v33));
      if (v8)
      {
        v22 = (int *)&(&off_10008DD88)[4 * self->state + 1];
        v23 = @"mobileAsset";
      }

      else
      {
        FudLog(5LL, @"Skipping download upon plugin request");
        v23 = @"fileSystem";
        v22 = &dword_10008DE70;
      }

      self->int nextState = *v22;
      -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, @"sourceOfFirmware");
      FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
      AnalyticsSendEvent(@"com.apple.fud.updateAvailable", v21);
    }

    else
    {
      self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
      +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.current",  0LL,  1LL);
      if (self->remoteCheck)
      {
        id v24 = -[FudStateMachineDelegate getStorage](self->stateMachineDelegate, "getStorage");
        if (v24) {
          objc_msgSend( v24,  "recordSuccessfulRemoteFindForPolicy:filter:revision:date:",  objc_msgSend(v24, "getPolicyForPlugin:", self->stateMachinePluginName),  self->stateMachineFilterName,  self->stateMachineRevision,  0);
        }
        else {
          -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  2u,  (uint64_t)@"%s: failed to get storage from delegate",  v25,  v26,  v27,  v28,  v29,  (uint64_t)"-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]"));
        }
      }

      else
      {
        FudLog(6LL, @"%s: Local check performed so no update to history");
      }
    }

    goto LABEL_35;
  }

  if (v11) {
    goto LABEL_7;
  }
  -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  7u,  (uint64_t)@"%s: Unspecified error from plugin",  v13,  v14,  v15,  v16,  v17,  (uint64_t)"-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]"));
LABEL_23:
  v34 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
  exception = self->exception;
  FudLog(3LL, @"%s: find was not successful: %@");
  self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
  if (a7)
  {
    if (objc_msgSend( objc_msgSend( a7,  "domain",  "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]",  exception),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
      && [a7 code] == (id)1)
    {
      v35 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
      id v37 = a7;
      FudLog(7LL, @"%s: plugin returned update Interrupted error: %@");
      v30 = @"com.apple.fud.updateInterrupted";
    }

    else
    {
      v30 = @"com.apple.fud.updateFailed";
    }

    v31 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v30, v35, v37);
    v34 = (const char *)v31;
    exception = -[FudStateMachine createEndOfUpdateDictForEvent:info:]( self,  "createEndOfUpdateDictForEvent:info:",  v31,  a4);
    FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
    AnalyticsSendEvent(v31, exception);
    if (v31) {
  }
    }

  +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL,  v34,  exception);
  +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"error",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"find.%@.%ld",  [a7 domain],  objc_msgSend(a7, "code")),  1);
LABEL_35:
  workQueue = (dispatch_queue_s *)self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C4EC;
  block[3] = &unk_1000754A8;
  block[4] = self;
  void block[5] = a4;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
  FudLog(7LL, @"Exiting: %s");
}

- (void)runStateDoDownload
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoDownload]"))
  {
    self->validCallback = "didDownload:info:error:";
    -[FudPlugin downloadFirmwareWithOptions:](self->plugin, "downloadFirmwareWithOptions:", self->pluginOptions);
  }

  else
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
  }

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->validCallback != "didDownload:info:error:")
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
    return;
  }

  self->validCallback = 0LL;
  objc_sync_exit(self);
  if (!v7)
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    if (a5)
    {
      -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didDownload:info:error:]");
      if (objc_msgSend( objc_msgSend(a5, "domain"),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
        && [a5 code] == (id)1)
      {
        objc_super v21 = "-[FudStateMachine didDownload:info:error:]";
        id v23 = a5;
        FudLog(7LL, @"%s: plugin returned update Interrupted error: %@");
        uint64_t v17 = @"com.apple.fud.updateInterrupted";
      }

      else
      {
        uint64_t v17 = @"com.apple.fud.updateFailed";
      }

      uint64_t v18 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v17, v21, v23);
      v22 = v18;
      id v23 = -[FudStateMachine createEndOfUpdateDictForEvent:info:](self, "createEndOfUpdateDictForEvent:info:", v18, a4);
      FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
      AnalyticsSendEvent(v18, v23);
      if (v18) {
    }
      }

    else
    {
      -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  7u,  (uint64_t)@"%s: unspecified error from plugin",  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[FudStateMachine didDownload:info:error:]"));
    }

    +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL,  v22,  v23);
    +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"error",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"download.%@.%ld",  [a5 domain],  objc_msgSend(a5, "code")),  1);
    goto LABEL_21;
  }

  id v14 = -[FudStateMachineDelegate getStorage]( self->stateMachineDelegate,  "getStorage",  "-[FudStateMachine didDownload:info:error:]");
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = [v14 getPolicyForPlugin:self->stateMachinePluginName];
    if (v16)
    {
      [v15 recordSuccessfulRemoteFindForPolicy:v16 filter:self->stateMachineFilterName revision:self->stateMachineRevision date:0];
      goto LABEL_19;
    }

    uint64_t v19 = @"%s: failed to get policy from storage";
  }

  else
  {
    uint64_t v19 = @"%s: failed to get storage from delegate";
  }

  FudLog(3LL, v19);
LABEL_19:
  self->int nextState = (int)(&off_10008DD88)[4 * self->state + 1];
  if (a5) {
    FudLog(4LL, @"%s: error returned on success: %@");
  }
LABEL_21:
  workQueue = (dispatch_queue_s *)self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C8A0;
  block[3] = &unk_1000754A8;
  block[4] = self;
  void block[5] = a4;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
  FudLog(7LL, @"Exiting: %s");
}

- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine personalizationDone:response:error:]"))
  {
    if (!a5)
    {
      plugin = self->plugin;
      id v10 = a3;
      id v11 = a4;
      id v12 = 0LL;
      goto LABEL_7;
    }

    uint64_t v13 = "-[FudStateMachine personalizationDone:response:error:]";
    id v14 = a5;
    FudLog(3LL, @"%s: Error during personalization %@.");
    plugin = self->plugin;
LABEL_5:
    id v10 = a3;
    id v11 = 0LL;
    id v12 = a5;
LABEL_7:
    -[FudPlugin personalizationResponse:response:status:]( plugin,  "personalizationResponse:response:status:",  v10,  v11,  v12,  v13,  v14);
    goto LABEL_8;
  }

  uint64_t v13 = "-[FudStateMachine personalizationDone:response:error:]";
  FudLog(3LL, @"%s: Could not reload plugin.");
  plugin = self->plugin;
  if (plugin) {
    goto LABEL_5;
  }
LABEL_8:
  FudLog(7LL, @"Exiting: %s");
}

- (BOOL)showPersonalizationRequiredDialogAndGetResponse
{
  id v4 = -[FudStateMachine getMatchingFilter]( self,  "getMatchingFilter",  "-[FudStateMachine showPersonalizationRequiredDialogAndGetResponse]");
  uint64_t v5 = [v4 filterReadableName]
     ? +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"New Firmware available for %@. This requires Personalization, you will be prompted for your credentials.",  [v4 filterReadableName])
     : +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"New Firmware available for %@. This requires Personalization, you will be prompted for your credentials.",  @"your accessory");
  uint64_t v6 = v5;
  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  [v7 setObject:@"*** INTERNAL ONLY ***" forKey:kCFUserNotificationAlertHeaderKey];
  [v7 setObject:v6 forKey:kCFUserNotificationAlertMessageKey];
  [v7 setObject:@"OK" forKey:kCFUserNotificationDefaultButtonTitleKey];
  [v7 setObject:@"Cancel" forKey:kCFUserNotificationAlternateButtonTitleKey];
  SInt32 error = 0;
  BOOL v8 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x21uLL, &error, (CFDictionaryRef)v7);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  CFOptionFlags responseFlags = 0LL;
  CFUserNotificationReceiveResponse(v8, 0.0, &responseFlags);
  BOOL v10 = responseFlags == 0;
  CFRelease(v9);
  return v10;
}

- (void)personalizationRequest:(id)a3
{
  personalizer = self->personalizer;
  if (!personalizer)
  {
    personalizer = -[FudPersonalizer initWithDelegate:]( objc_alloc(&OBJC_CLASS___FudPersonalizer),  "initWithDelegate:",  self,  "-[FudStateMachine personalizationRequest:]");
    self->personalizer = personalizer;
  }

  -[FudPersonalizer doPersonalization:](personalizer, "doPersonalization:", a3);
}

- (void)runStateDoPrepare
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoPrepare]"))
  {
    self->validCallback = "didPrepare:info:error:";
    -[FudPlugin prepareFirmwareWithOptions:](self->plugin, "prepareFirmwareWithOptions:", self->pluginOptions);
  }

  else
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
  }

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->validCallback == "didPrepare:info:error:")
  {
    self->validCallback = 0LL;
    objc_sync_exit(self);
    id v14 = &(&off_10008DD88)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v14 + 2);
      if (a5) {
        FudLog(4LL, @"%s: error returned on success: %@");
      }
    }

    else
    {
      self->int nextState = *((_DWORD *)v14 + 3);
      if (a5)
      {
        -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didPrepare:info:error:]");
        if (objc_msgSend( objc_msgSend(a5, "domain"),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
          && [a5 code] == (id)1)
        {
          uint64_t v18 = "-[FudStateMachine didPrepare:info:error:]";
          id v20 = a5;
          FudLog(7LL, @"%s: plugin returned update Interrupted error: %@");
          uint64_t v15 = @"com.apple.fud.updateInterrupted";
        }

        else
        {
          uint64_t v15 = @"com.apple.fud.updateFailed";
        }

        id v16 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v15, v18, v20);
        uint64_t v19 = v16;
        id v20 = -[FudStateMachine createEndOfUpdateDictForEvent:info:]( self,  "createEndOfUpdateDictForEvent:info:",  v16,  a4);
        FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
        AnalyticsSendEvent(v16, v20);
        if (v16) {
      }
        }

      else
      {
        -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  7u,  (uint64_t)@"%s: unspecified error from plugin",  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[FudStateMachine didPrepare:info:error:]"));
      }

      +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL,  v19,  v20);
      +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"error",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"prepare.%@.%ld",  [a5 domain],  objc_msgSend(a5, "code")),  1);
    }

    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CEA0;
    block[3] = &unk_1000754A8;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
    FudLog(7LL, @"Exiting: %s");
  }

  else
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
  }

- (void)runStateDoApply
{
  if (!-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoApply]"))
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
    return;
  }

  self->validCallback = "didApply:info:error:";
  id v3 = -[FudStateMachine getMatchingFilter](self, "getMatchingFilter");
  if ([v3 noPowerAssertion])
  {
    [v3 filterName];
    id v4 = @"%s: Accessory %@ does not need power assertion";
  }

  else if (self->hasSleepAssertion)
  {
    id v4 = @"%s: Already holding Sleep Assertion id=%@ sleepAssertionId=%d";
  }

  else
  {
    if (IOPMAssertionCreateWithName( @"PreventUserIdleSystemSleep",  0xFFu,  @"com.apple.MobileAccessoryUpdater.SleepAssertionID",  &self->sleepAssertionId))
    {
      id v4 = @"%s: Sleep Assertion Error=%d id=%@";
      uint64_t v5 = 3LL;
      goto LABEL_8;
    }

    self->hasSleepAssertion = 1;
    id v4 = @"%s: Held Sleep Assertion id=%@ sleepAssertionId=%d";
  }

  uint64_t v5 = 5LL;
LABEL_8:
  FudLog(v5, v4);
  -[FudPlugin applyFirmwareWithOptions:](self->plugin, "applyFirmwareWithOptions:", self->pluginOptions);
}

- (id)createEndOfUpdateDictForEvent:(id)a3 info:(id)a4
{
  if (!a3
    || (objc_msgSend( a3,  "isEqualToString:",  @"com.apple.fud.updateCompleted",  "-[FudStateMachine createEndOfUpdateDictForEvent:info:]") & 1) == 0 && (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateInterrupted") & 1) == 0 && (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateFailed") & 1) == 0)
  {
    FudLog(3LL, @"Unsupported event %@");
    return 0LL;
  }

  stateMachinePluginName = self->stateMachinePluginName;
  v33[0] = @"pluginName";
  v33[1] = @"modelName";
  accessoryModelNumber = self->accessoryModelNumber;
  v34[0] = stateMachinePluginName;
  v34[1] = accessoryModelNumber;
  resumePercent = self->resumePercent;
  v34[2] = self->transportType;
  v33[2] = @"transportType";
  v33[3] = @"existingFWVersionOnAccessory";
  __int128 v35 = *(_OWORD *)&self->existingFWVersionOnAcc;
  v33[4] = @"newFWVersion";
  v33[5] = @"resumedFromPercent";
  v36 = resumePercent;
  uint64_t v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  6LL));
  id v32 = a3;
  if (a4)
  {
    if ([a4 objectForKeyedSubscript:@"cumulativeProgressPercent"]) {
      uint64_t v11 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeProgressPercent"];
    }
    else {
      uint64_t v11 = &off_10007E778;
    }
    if ([a4 objectForKeyedSubscript:@"currentSessionTimeTaken"]) {
      uint64_t v19 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"currentSessionTimeTaken"];
    }
    else {
      uint64_t v19 = &off_10007E778;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeTimeTaken"]) {
      id v20 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeTimeTaken"];
    }
    else {
      id v20 = &off_10007E778;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeCalendarTimeTaken"]) {
      objc_super v21 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeCalendarTimeTaken"];
    }
    else {
      objc_super v21 = &off_10007E778;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeCloakingTime"]) {
      v22 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeCloakingTime"];
    }
    else {
      v22 = &off_10007E778;
    }
    id v16 = v22;
    if ([a4 objectForKeyedSubscript:@"averageBitRate"]) {
      uint64_t v17 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"averageBitRate"];
    }
    else {
      uint64_t v17 = &off_10007E778;
    }
    uint64_t v15 = v21;
    id v14 = v20;
    if ([a4 objectForKeyedSubscript:@"totalSessionCount"]) {
      v30 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"totalSessionCount"];
    }
    else {
      v30 = &off_10007E778;
    }
    uint64_t v13 = v19;
    if ([a4 objectForKeyedSubscript:@"error"]) {
      uint64_t v12 = (const __CFString *)[a4 objectForKeyedSubscript:@"error"];
    }
    else {
      uint64_t v12 = @"Unknown";
    }
    else {
      v31 = @"Unknown";
    }
    if ([a4 objectForKeyedSubscript:@"failureState"]) {
      uint64_t v29 = (const __CFString *)[a4 objectForKeyedSubscript:@"failureState"];
    }
    else {
      uint64_t v29 = @"Unknown";
    }
    uint64_t v18 = v30;
  }

  else
  {
    uint64_t v12 = @"Unknown";
    uint64_t v11 = &off_10007E778;
    uint64_t v13 = &off_10007E778;
    id v14 = &off_10007E778;
    uint64_t v15 = &off_10007E778;
    id v16 = &off_10007E778;
    uint64_t v17 = &off_10007E778;
    uint64_t v18 = &off_10007E778;
    v31 = @"Unknown";
    uint64_t v29 = @"Unknown";
  }

  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, @"cumulativeProgressPercent");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, @"currentSessionTimeTaken");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v14, @"cumulativeTimeTaken");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v15, @"cumulativeCalendarTimeTaken");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v16, @"cumulativeCloakingTime");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v17, @"averageBitRate");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v18, @"totalSessionCount");
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, @"error");
  if (([v32 isEqualToString:@"com.apple.fud.updateCompleted"] & 1) == 0)
  {
    unsigned int v23 = [v32 isEqualToString:@"com.apple.fud.updateInterrupted"];
    if (a4 && v23)
    {
      id v24 = @"interruptedState";
      uint64_t v25 = v10;
      uint64_t v26 = v31;
LABEL_45:
      -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, v24);
      return v10;
    }

    unsigned int v27 = [v32 isEqualToString:@"com.apple.fud.updateFailed"];
    if (a4 && v27)
    {
      id v24 = @"failureState";
      uint64_t v25 = v10;
      uint64_t v26 = v29;
      goto LABEL_45;
    }
  }

  return v10;
}

- (id)createBeginningOfUpdateDictForEvent:(id)a3 info:(id)a4
{
  if (a4)
  {
    if (a3
      && ((objc_msgSend( a3,  "isEqualToString:",  @"com.apple.fud.updateStarted",  "-[FudStateMachine createBeginningOfUpdateDictForEvent:info:]") & 1) != 0 || (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateResumed") & 1) != 0))
    {
      if ([a4 objectForKeyedSubscript:@"transportType"]
        && -[FudStateMachine conformsToAllowedValuesForKey:value:]( self,  "conformsToAllowedValuesForKey:value:",  @"transportType",  [a4 objectForKeyedSubscript:@"transportType"]))
      {
        transportType = self->transportType;
        if (transportType)
        {

          self->transportType = 0LL;
        }

        self->transportType = (NSString *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"transportType"),  "copy");
      }

      if ([a4 objectForKeyedSubscript:@"resumingFromPercent"])
      {
        resumePercent = self->resumePercent;
        if (resumePercent)
        {

          self->resumePercent = 0LL;
        }

        self->resumePercent = (NSNumber *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"resumingFromPercent"),  "copy");
      }

      if ([a4 objectForKeyedSubscript:@"resumeCount"])
      {
        resumeCount = self->resumeCount;
        if (resumeCount)
        {

          self->resumeCount = 0LL;
        }

        self->resumeCount = (NSNumber *)objc_msgSend( objc_msgSend(a4, "objectForKeyedSubscript:", @"resumeCount"),  "copy");
      }

      stateMachinePluginName = self->stateMachinePluginName;
      v13[0] = @"pluginName";
      v13[1] = @"modelName";
      accessoryModelNumber = self->accessoryModelNumber;
      v14[0] = stateMachinePluginName;
      v14[1] = accessoryModelNumber;
      v14[2] = self->transportType;
      v13[2] = @"transportType";
      v13[3] = @"existingFWVersionOnAccessory";
      v13[4] = @"newFWVersion";
      __int128 v15 = *(_OWORD *)&self->existingFWVersionOnAcc;
      a4 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  5LL));
      if (([a3 isEqualToString:@"com.apple.fud.updateStarted"] & 1) == 0
        && [a3 isEqualToString:@"com.apple.fud.updateResumed"])
      {
        [a4 setObject:self->resumePercent forKey:@"resumingFromPercent"];
        [a4 setObject:self->resumeCount forKey:@"resumeCount"];
      }
    }

    else
    {
      FudLog(3LL, @"Unsupported event");
      return 0LL;
    }
  }

  else
  {
    FudLog(3LL, @"Invalid info");
  }

  return a4;
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog(7LL, @"Entering: %s");
  if (self->hasSleepAssertion)
  {
    uint64_t v9 = (void *)IOPMAssertionRelease(self->sleepAssertionId);
    uint64_t v25 = @"com.apple.MobileAccessoryUpdater.SleepAssertionID";
    uint64_t sleepAssertionId = self->sleepAssertionId;
    id v23 = v9;
    FudLog(5LL, @"%s: Released sleep assertion ret=%d id=%@ sleepAssertionId=%d");
    self->hasSleepAssertion = 0;
  }

  else
  {
    FudLog(4LL, @"%s: No Sleep Assertion to release.");
  }

  objc_sync_enter(self);
  if (self->validCallback == "didApply:info:error:")
  {
    self->validCallback = 0LL;
    objc_sync_exit(self);
    __int128 v15 = &(&off_10008DD88)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v15 + 2);
      id v16 = -[FudStateMachine createEndOfUpdateDictForEvent:info:]( self,  "createEndOfUpdateDictForEvent:info:",  @"com.apple.fud.updateCompleted",  a4,  "-[FudStateMachine didApply:info:error:]");
      FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
      AnalyticsSendEvent(@"com.apple.fud.updateCompleted", v16);
      if (a5) {
        FudLog(4LL, @"%s: error returned on success: %@");
      }
    }

    else
    {
      self->int nextState = *((_DWORD *)v15 + 3);
      if (a5)
      {
        -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didApply:info:error:]");
        if (objc_msgSend( objc_msgSend(a5, "domain"),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
          && [a5 code] == (id)-1)
        {
          id v20 = "-[FudStateMachine didApply:info:error:]";
          id v23 = a5;
          FudLog(4LL, @"%s: plugin returned low battery error: %@");
          self->int nextState = 9;
        }

        if (objc_msgSend( objc_msgSend(a5, "domain", v20, v23, v25, sleepAssertionId),  "isEqualToString:",  @"com.apple.MobileAccessoryUpdater.ErrorDomain")
          && [a5 code] == (id)1)
        {
          objc_super v21 = "-[FudStateMachine didApply:info:error:]";
          id v24 = a5;
          FudLog(7LL, @"%s: plugin returned update Interrupted error: %@");
          uint64_t v17 = @"com.apple.fud.updateInterrupted";
        }

        else
        {
          uint64_t v17 = @"com.apple.fud.updateFailed";
        }

        uint64_t v18 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v17, v21, v24);
        v22 = v18;
        id v23 = -[FudStateMachine createEndOfUpdateDictForEvent:info:]( self,  "createEndOfUpdateDictForEvent:info:",  v18,  a4);
        FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
        AnalyticsSendEvent(v18, v23);
        if (v18) {
      }
        }

      else
      {
        -[FudStateMachine setException:]( self,  "setException:",  sub_10001AE14( self,  7u,  (uint64_t)@"%s: unspecified error from plugin",  v10,  v11,  v12,  v13,  v14,  (uint64_t)"-[FudStateMachine didApply:info:error:]"));
      }

      +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL,  v22,  v23);
      +[FudUtilities logFudAggd:status:info:value:]( FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"error",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"apply.%@.%ld",  [a5 domain],  objc_msgSend(a5, "code")),  1);
    }

    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001DAFC;
    block[3] = &unk_1000754A8;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
    FudLog(7LL, @"Exiting: %s");
  }

  else
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
  }

- (void)runStateDoFinish
{
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoFinish]"))
  {
    self->validCallback = "didFinish:info:error:";
    -[FudPlugin finishWithOptions:](self->plugin, "finishWithOptions:", self->pluginOptions);
  }

  else
  {
    self->int nextState = *((_DWORD *)&off_10008DD88 + 8 * self->state + 3);
    -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0LL);
  }

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v22 = (id)a3;
  FudLog(4LL, @"%s: successful=%d info=%@");
  objc_super v21 = "-[FudStateMachine didFinish:info:error:]";
  FudLog(7LL, @"Entering: %s");
  objc_sync_enter(self);
  if (self->validCallback == "didFinish:info:error:")
  {
    self->validCallback = 0LL;
    objc_sync_exit(self);
    uint64_t v14 = &(&off_10008DD88)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v14 + 2);
      if (a5)
      {
        objc_super v21 = "-[FudStateMachine didFinish:info:error:]";
        id v22 = a5;
        FudLog(4LL, @"%s: error returned on success: %@");
      }

      stateMachineFilterName = self->stateMachineFilterName;
      id v16 = @"updates.success";
      uint64_t v17 = 0LL;
    }

    else
    {
      self->int nextState = *((_DWORD *)v14 + 3);
      if (a5)
      {
        uint64_t v18 = self;
        uint64_t v19 = a5;
      }

      else
      {
        uint64_t v19 = sub_10001AE14( self,  7u,  (uint64_t)@"%s: unspecified error from plugin",  v9,  v10,  v11,  v12,  v13,  (uint64_t)"-[FudStateMachine didFinish:info:error:]");
        uint64_t v18 = self;
      }

      -[FudStateMachine setException:](v18, "setException:", v19, v21, v22, a4);
      +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  self->stateMachineFilterName,  @"updates.failure",  0LL,  1LL);
      uint64_t v17 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"finish.%@.%ld",  [a5 domain],  objc_msgSend(a5, "code"));
      stateMachineFilterName = self->stateMachineFilterName;
      id v16 = @"error";
    }

    +[FudUtilities logFudAggd:status:info:value:]( &OBJC_CLASS___FudUtilities,  "logFudAggd:status:info:value:",  stateMachineFilterName,  v16,  v17,  1LL,  v21,  v22);
    workQueue = (dispatch_queue_s *)self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001DDDC;
    block[3] = &unk_1000754A8;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, block);
    FudLog(7LL, @"Exiting: %s");
  }

  else
  {
    FudLog(4LL, @"%s: SPI violation: unexpected callback!");
    objc_sync_exit(self);
  }

- (void)reportAnalytics:(id)a3 info:(id)a4
{
  if (!a3 || !a4)
  {
    uint64_t v10 = @"%s: Invalid arguments passed";
    goto LABEL_8;
  }

  BOOL v7 = @"com.apple.fud.updateStarted";
  if ((objc_msgSend( a3,  "isEqualToString:",  @"com.apple.fud.updateStarted",  "-[FudStateMachine reportAnalytics:info:]") & 1) == 0 && (BOOL v7 = @"com.apple.fud.updateResumed",  !objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateResumed"))
    || (id v8 = -[FudStateMachine createBeginningOfUpdateDictForEvent:info:]( self,  "createBeginningOfUpdateDictForEvent:info:",  v7,  a4)) == 0LL)
  {
    uint64_t v10 = @"Unsupported event %@ not logged to CoreAnalytics";
LABEL_8:
    FudLog(3LL, v10);
    goto LABEL_9;
  }

  id v9 = v8;
  FudLog(7LL, @"CoreAnalytics event: %@\neventDict: %@");
  AnalyticsSendEvent(a3, v9);
LABEL_9:
  FudLog(7LL, @"Exiting: %s");
}

- (BOOL)conformsToAllowedValuesForKey:(id)a3 value:(id)a4
{
  unsigned int v5 = [a3 isEqualToString:@"transportType"];
  if (v5)
  {
    if (([a4 isEqualToString:@"USB"] & 1) != 0
      || ([a4 isEqualToString:@"UART"] & 1) != 0
      || ([a4 isEqualToString:@"BT"] & 1) != 0
      || ([a4 isEqualToString:@"AirPlay"] & 1) != 0
      || ([a4 isEqualToString:@"AIDBus"] & 1) != 0
      || ([a4 isEqualToString:@"Scorpius"] & 1) != 0
      || ([a4 isEqualToString:@"EATransport"] & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      LOBYTE(v5) = [a4 isEqualToString:@"Generic"];
    }
  }

  return v5;
}

- (void)progress:(double)a3
{
  pluginProgressWeights = self->pluginProgressWeights;
  double v6 = -1.0;
  if (pluginProgressWeights && (self->state - 8) <= 2)
  {
    -[FudProgressWeights calculateOverallProgressWithStepProgress:step:]( pluginProgressWeights,  "calculateOverallProgressWithStepProgress:step:",  a3,  -1.0);
    double v6 = v7;
  }

  -[FudStateMachineDelegate stepProgress:stateMachine:progress:overallProgress:]( self->stateMachineDelegate,  "stepProgress:stateMachine:progress:overallProgress:",  LODWORD((&off_10008DD88)[4 * self->state + 2]),  self,  a3,  v6);
}

- (void)log:(int)a3 format:(id)a4
{
}

- (void)accessoryDisconnected:(id)a3
{
  workQueue = (dispatch_queue_s *)self->workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E0BC;
  v4[3] = &unk_1000754A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_async((dispatch_group_t)qword_10008F5A0, workQueue, v4);
}

- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5
{
  uint64_t v7 = *(void *)&a3;
  stateMachineFilterName = self->stateMachineFilterName;
  uint64_t v10 = pthread_self();
  uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%d] %p>: ",  stateMachineFilterName,  pthread_mach_thread_np(v10),  self->plugin);
  FudLog(v7, v11);
  FudLogv(v7, a4, a5);
}

- (void)encodeWithCoder:(id)a3
{
  if (self->personalizer || self->needsDeviceList) {
    uint64_t state = 1LL;
  }
  else {
    uint64_t state = self->state;
  }
  [a3 encodeInt:state forKey:@"StateNumber"];
}

- (FudStateMachine)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FudStateMachine;
  uint64_t v4 = -[FudStateMachine init](&v9, "init");
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"PluginName"];
    if (-[FudStateMachine initWithPluginName:filterName:delegate:options:]( v4,  "initWithPluginName:filterName:delegate:options:",  v5,  [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"FilterName"],  0,  0))
    {
      unsigned int v6 = [a3 decodeIntForKey:@"StateNumber"];
      v4->uint64_t state = v6;
      if (v6 < 0xC)
      {
        FudLog(5LL, @"Persisted state machine restored to state %s");
        return v4;
      }

      FudLog(3LL, @"%s: Invalide persisted state machine state: %d");
      uint64_t v7 = v4;
    }

    return 0LL;
  }

  return v4;
}

- (void)issueNotification:(id)a3
{
  if ((objc_opt_respondsToSelector(self->stateMachineDelegate, "issueNotification:request:") & 1) != 0) {
    -[FudStateMachineDelegate issueNotification:request:]( self->stateMachineDelegate,  "issueNotification:request:",  self,  a3);
  }
}

- (NSString)stateMachinePluginName
{
  return self->stateMachinePluginName;
}

- (NSString)stateMachineFilterName
{
  return self->stateMachineFilterName;
}

- (NSString)stateMachineRevision
{
  return self->stateMachineRevision;
}

- (NSDictionary)pluginOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setPluginOptions:(id)a3
{
}

- (FudStateMachineDelegate)delegate
{
  return self->stateMachineDelegate;
}

- (void)setDelegate:(id)a3
{
  self->stateMachineDelegate = (FudStateMachineDelegate *)a3;
}

- (BOOL)pluginForcedSilentUpdate
{
  return self->pluginForcedSilentUpdate;
}

- (AUDAccessory)accessory
{
  return (AUDAccessory *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setAccessory:(id)a3
{
}

@end