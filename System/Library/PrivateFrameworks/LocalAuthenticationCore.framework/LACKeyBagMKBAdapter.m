@interface LACKeyBagMKBAdapter
- (LACKeyBagMKBAdapter)initWithKeyBagStateProvider:(id)a3 notificationCenter:(id)a4;
- (LACKeyBagMKBAdapter)initWithUserId:(unsigned int)a3;
- (int64_t)state;
- (void)_addKeybagStatusObserver;
- (void)_removeKeybagStatusObserver;
- (void)_updateKeybagState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4;
- (void)removeObserver:(id)a3;
@end

@implementation LACKeyBagMKBAdapter

- (LACKeyBagMKBAdapter)initWithUserId:(unsigned int)a3
{
  v4 = -[LACKeyBagStateProviderMKBAdapter initWithUserId:]( objc_alloc(&OBJC_CLASS___LACKeyBagStateProviderMKBAdapter),  "initWithUserId:",  *(void *)&a3);
  v5 = +[LACDarwinNotificationCenter sharedInstance](&OBJC_CLASS___LACDarwinNotificationCenter, "sharedInstance");
  v6 = -[LACKeyBagMKBAdapter initWithKeyBagStateProvider:notificationCenter:]( self,  "initWithKeyBagStateProvider:notificationCenter:",  v4,  v5);

  return v6;
}

- (LACKeyBagMKBAdapter)initWithKeyBagStateProvider:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___LACKeyBagMKBAdapter;
  v9 = -[LACKeyBagMKBAdapter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBagStateProvider, a3);
    v10->_state = -[LACKeyBagStateProviderMKBAdapter state](v10->_keyBagStateProvider, "state");
    v11 = -[LACKeyBagObserverCollection initWithState:]( objc_alloc(&OBJC_CLASS___LACKeyBagObserverCollection),  "initWithState:",  v10->_state);
    observers = v10->_observers;
    v10->_observers = v11;

    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    -[LACKeyBagMKBAdapter _addKeybagStatusObserver](v10, "_addKeybagStatusObserver");
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LACKeyBagMKBAdapter;
  -[LACKeyBagMKBAdapter dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  return self->_state;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  if (LACDarwinNotificationsEqual(a4, @"com.apple.mobile.keybagd.lock_status")) {
    -[LACKeyBagMKBAdapter _updateKeybagState](self, "_updateKeybagState");
  }
}

- (void)_addKeybagStatusObserver
{
}

- (void)_removeKeybagStatusObserver
{
}

- (void)_updateKeybagState
{
  int64_t v3 = -[LACKeyBagStateProviderMKBAdapter state](self->_keyBagStateProvider, "state");
  self->_state = v3;
  -[LACKeyBagObserverCollection publishKeybagStateUpdate:state:]( self->_observers,  "publishKeybagStateUpdate:state:",  self,  v3);
}

- (void).cxx_destruct
{
}

@end