@interface BKHIDHapticFeedbackController
+ (id)sharedInstance;
- (BKHIDHapticFeedbackController)initWithHIDHapticFeedbackInterface:(id)a3;
- (BOOL)_validateHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4;
- (BOOL)_validatePencilHapticFeedbackRequest:(id)a3 forPID:(int)a4;
- (BOOL)_validateTrackpadHapticFeedbackRequest:(id)a3 forPID:(int)a4;
- (void)postHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4;
@end

@implementation BKHIDHapticFeedbackController

- (BKHIDHapticFeedbackController)initWithHIDHapticFeedbackInterface:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = [BKHIDHapticFeedbackController class];
  BKHIDHapticFeedbackController *v6 = [[BKHIDHapticFeedbackController alloc] init];
  v7 = v6;
  if (v6) {
    [v6 setHIDHapticFeedbackInterface:a3];
  }

  return v7;
}

- (void)postHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v5 = a3;
  if (-[BKHIDHapticFeedbackController _validateHapticFeedbackRequest:forAuditToken:]( self,  "_validateHapticFeedbackRequest:forAuditToken:"))
  {
    [self->_HIDHapticFeedbackInterface playHapticFeedbackRequest:v5];
  }
}

- (BOOL)_validateHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = BSPIDForAuditToken(a4);
  v8 = [v6 powerSourceID];
  id v9 = [v6 deviceType];
  BOOL v10 = [BKSecurityManager hasEntitlement:BKRequestHapticFeedbackEntitlement forAuditToken:a4];
  if (!v8)
  {
    if (v9)
    {
      if (v9 == (id)1
        && -[BKHIDHapticFeedbackController _validateTrackpadHapticFeedbackRequest:forPID:]( self,  "_validateTrackpadHapticFeedbackRequest:forPID:",  v6,  v7))
      {
        goto LABEL_3;
      }
    }

    else if (-[BKHIDHapticFeedbackController _validatePencilHapticFeedbackRequest:forPID:]( self,  "_validatePencilHapticFeedbackRequest:forPID:",  v6,  v7))
    {
      goto LABEL_3;
    }

    id v15 = sub_10003F3DC();
    v13 = [os_log logWithName:v15];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = v6;
      __int16 v19 = 1024;
      int v20 = v7;
      v14 = "Haptic feedback request %{public}@ from pid %d could not be validated due to destination mismatch";
      goto LABEL_15;
    }

- (BOOL)_validatePencilHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  uint64_t v4 = a4;
  genericGestureFocusObserver = self->_genericGestureFocusObserver;
  if (!genericGestureFocusObserver)
  {
    uint64_t v7 = [BKTouchDeliveryGenericGestureFocusObserver sharedInstance];
    v8 = self->_genericGestureFocusObserver;
    self->_genericGestureFocusObserver = v7;

    genericGestureFocusObserver = self->_genericGestureFocusObserver;
  }

  return [genericGestureFocusObserver destinationPIDMatchesHapticFeedbackRequestPID:v4];
}

- (BOOL)_validateTrackpadHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000460AC;
  block[3] = &unk_1000B7108;
  block[4] = a1;
  if (qword_1000DC168 != -1) {
    dispatch_once(&qword_1000DC168, block);
  }
  return (id)qword_1000DC170;
}

@end