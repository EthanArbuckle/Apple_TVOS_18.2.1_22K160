@interface PDSetupAssistantCompleteMonitor
+ (BOOL)hasCompletedSetupAssistant;
+ (id)lastSetupAssistantExitDate;
- (PDSetupAssistantCompleteMonitor)init;
- (PDSetupAssistantCompleteMonitor)initWithNotificationStreamManager:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (void)_checkIfCompleteWithAdditionalCompletion:(id)a3;
- (void)_handleSetupCompleteStatusChangeEvent;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)waitForSetupAssistantCompletion:(id)a3;
@end

@implementation PDSetupAssistantCompleteMonitor

- (PDSetupAssistantCompleteMonitor)init
{
  return 0LL;
}

- (PDSetupAssistantCompleteMonitor)initWithNotificationStreamManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PDSetupAssistantCompleteMonitor;
  v6 = -[PDSetupAssistantCompleteMonitor init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationStreamManager, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completions = v7->_completions;
    v7->_completions = v8;

    unsigned __int8 v10 = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant]( &OBJC_CLASS___PDSetupAssistantCompleteMonitor,  "hasCompletedSetupAssistant");
    v7->_currentHasCompletedSetupAssistantState = v10;
    if ((v10 & 1) == 0) {
      -[PDNotificationStreamManager registerConsumer:](v7->_notificationStreamManager, "registerConsumer:", v7);
    }
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDSetupAssistantCompleteMonitor;
  -[PDSetupAssistantCompleteMonitor dealloc](&v3, "dealloc");
}

- (void)waitForSetupAssistantCompletion:(id)a3
{
}

- (void)_checkIfCompleteWithAdditionalCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (v4)
  {
    completions = self->_completions;
    id v6 = objc_retainBlock(v4);
    -[NSMutableArray addObject:](completions, "addObject:", v6);
  }

  if (self->_currentHasCompletedSetupAssistantState)
  {
    id v7 = -[NSMutableArray copy](self->_completions, "copy");
    -[NSMutableArray removeAllObjects](self->_completions, "removeAllObjects");
  }

  else
  {
    id v7 = 0LL;
  }

  os_unfair_lock_unlock(&self->_lock);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)i) + 16LL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)i));
      }

      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)_handleSetupCompleteStatusChangeEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_currentHasCompletedSetupAssistantState = +[PDSetupAssistantCompleteMonitor hasCompletedSetupAssistant]( &OBJC_CLASS___PDSetupAssistantCompleteMonitor,  "hasCompletedSetupAssistant");
  os_unfair_lock_unlock(p_lock);
  -[PDSetupAssistantCompleteMonitor _checkIfCompleteWithAdditionalCompletion:]( self,  "_checkIfCompleteWithAdditionalCompletion:",  0LL);
}

+ (BOOL)hasCompletedSetupAssistant
{
  return off_100705B78() ^ 1;
}

+ (id)lastSetupAssistantExitDate
{
  id v2 = -[objc_class current](off_100705B80(), "current");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
  id v5 = v4;
  if (v4) {
    CFPropertyListRef v6 = v4;
  }
  else {
    CFPropertyListRef v6 = CFPreferencesCopyValue( @"SetupLastExit",  @"com.apple.purplebuddy",  @"mobile",  kCFPreferencesAnyHost);
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)createCurrentNotificationRegistrationState
{
  id v2 = objc_alloc_init(&OBJC_CLASS___PDNotificationStreamRegistrationState);
  uint64_t v3 = off_100705B88();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    id v5 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v4, 0LL);
    -[PDNotificationStreamRegistrationState setNotificationNames:forStream:]( v2,  "setNotificationNames:forStream:",  v5,  0LL);
  }

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
}

- (void).cxx_destruct
{
}

@end