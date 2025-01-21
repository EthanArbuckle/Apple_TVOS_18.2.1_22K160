@interface BKTouchDeliveryGenericGestureFocusObserver
+ (id)sharedInstance;
- (BKHIDSystemInterface)HIDSystem;
- (BKTouchDeliveryGenericGestureFocusObserver)initWithHIDSystem:(id)a3;
- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5;
- (id)eventDestinationForDisplayUUID:(id)a3;
- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4;
- (void)setEventDestination:(id)a3 forDisplayUUID:(id)a4;
- (void)setHIDSystem:(id)a3;
@end

@implementation BKTouchDeliveryGenericGestureFocusObserver

- (BKTouchDeliveryGenericGestureFocusObserver)initWithHIDSystem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = [BKTouchDeliveryGenericGestureFocusObserver class];
  BKTouchDeliveryGenericGestureFocusObserver *v6 = [[BKTouchDeliveryGenericGestureFocusObserver alloc] init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_HIDSystem = a3;
    NSMutableDictionary *v8 = [[NSMutableDictionary alloc] init];
    lock_destinationPerDisplayUUID = v7->_lock_destinationPerDisplayUUID;
    v7->_lock_destinationPerDisplayUUID = v8;
  }

  return v7;
}

- (id)eventDestinationForDisplayUUID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  v6 = (void *)BKSDisplayUUIDMainKey;
  if (v5) {
    v6 = v4;
  }
  id v7 = v6;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v9 = [self->_lock_destinationPerDisplayUUID objectForKey:v7];
  id v10 = [v9 copy];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)setEventDestination:(id)a3 forDisplayUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8) {
    v9 = v7;
  }
  id v10 = v9;

  uint64_t v13 = BKLogTouchEvents(v11, v12);
  v14 = v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "set focus-follows-touch destination:%{public}@ for display:%{public}@",  (uint8_t *)&v15,  0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  [self->_lock_destinationPerDisplayUUID setObject:v6 forKey:v10];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_destinationPerDisplayUUID = self->_lock_destinationPerDisplayUUID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100044AA8;
  v8[3] = &unk_1000B6FE8;
  int v9 = a3;
  v8[4] = &v10;
  [lock_destinationPerDisplayUUID enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return [self destinationsForEvent:a3 fromSender:a4 overrideSenderDescriptor:0];
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v10 = [v8 displayUUID];
  id v11 = [v10 length];
  uint64_t v12 = (void *)BKSDisplayUUIDMainKey;
  if (v11) {
    uint64_t v12 = v10;
  }
  id v13 = v12;

  v14 = -[self->_lock_destinationPerDisplayUUID objectForKey:v13];
  else {
    uint64_t v16 = [self->_HIDSystem destinationsForEvent:a3 fromSender:v8 overrideSenderDescriptor:v9];
  }
  __int16 v17 = (void *)v16;
  os_unfair_lock_unlock(&self->_lock);

  return v17;
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v6 = [self destinationsForEvent:a3 fromSender:a4];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [self postEvent:a3 toDestination:[BKTouchDeliveryGenericGestureFocusObserver destinationForGesture:v10]];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BKHIDSystemInterface)HIDSystem
{
  return self->_HIDSystem;
}

- (void)setHIDSystem:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC130 != -1) {
    dispatch_once(&qword_1000DC130, &stru_1000B6FC0);
  }
  return (id)qword_1000DC138;
}

@end