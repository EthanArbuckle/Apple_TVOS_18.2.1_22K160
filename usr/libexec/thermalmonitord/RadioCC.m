@interface RadioCC
- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5;
- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)addRadioMitigations;
- (void)calculateAdditionalRadioMitigations;
- (void)calculateMitigation;
- (void)createConnectionToCT;
- (void)createServerConnection;
- (void)dealloc;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)initializeRadio;
- (void)sendRadioNotification;
- (void)setAdditionalRadioMitigations;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setMaxTransmitPower;
@end

@implementation RadioCC

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withParams:(__CFDictionary *)a4
{
  return -[RadioCC initWithRunLoopAndParams:withMitigationType:withParams:]( self,  "initWithRunLoopAndParams:withMitigationType:withParams:",  a3,  4LL,  a4);
}

- (RadioCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5
{
  uint64_t v6 = *(void *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RadioCC;
  v8 = -[ComponentControl initWithCC::](&v15, "initWithCC::", *(void *)&a4, a5);
  v9 = v8;
  if (!v8) {
    return (RadioCC *)v9;
  }
  *((_DWORD *)v8 + 45) = -1;
  *(void *)(v8 + 148) = dispatch_queue_create("com.apple.ThermalMonitor.radio", 0LL);
  *(void *)(v9 + 164) = a3;
  if (a5 && CFDictionaryContainsKey(a5, @"componentNameDetail"))
  {
    Value = CFDictionaryGetValue(a5, @"componentNameDetail");
    if (!Value)
    {
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A53C();
      }
      goto LABEL_8;
    }

    CFStringRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"%d Radio%@", v6, Value);
  }

  else
  {
    CFStringRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"%d Radio", v6);
  }

  *((void *)v9 + 6) = v11;
LABEL_8:
  *(void *)(v9 + 140) = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v12 = *(dispatch_queue_s **)(v9 + 148);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000151A0;
  block[3] = &unk_1000614D0;
  block[4] = v9;
  dispatch_async(v12, block);
  if (notify_register_check("com.apple.cltm.radioNotification", (int *)v9 + 44))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A510();
    }
  }

  else
  {
    [v9 sendRadioNotification];
  }

  [v9 updatePowerParameters:a5];
  if (sub_100020F6C(a5, @"expectsCPMSSupport", 0LL)) {
    [v9 setCPMSMitigationState:1];
  }
  return (RadioCC *)v9;
}

- (void)dealloc
{
  v3 = *(const void **)(&self->super.currentPower + 1);
  if (v3) {
    CFRelease(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RadioCC;
  -[PidComponent dealloc](&v4, "dealloc");
}

- (void)defaultAction
{
  if (dword_1000747F8 != self->super.previousValue)
  {
    -[RadioCC calculateMitigation](self, "calculateMitigation");
    -[RadioCC setMaxTransmitPower](self, "setMaxTransmitPower");
    unsigned int previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      -[RadioCC sendRadioNotification](self, "sendRadioNotification");
      unsigned int previousValue = self->super.previousValue;
    }

    dword_1000747F8 = previousValue;
  }

- (void)defaultCPMSAction
{
  if (self->radioNotificationToken != self->super.previousValue)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___RadioCC;
    -[ComponentControl defaultCPMSAction](&v4, "defaultCPMSAction");
    unsigned int previousValue = self->super.previousValue;
    if (previousValue - 100 <= 0xFFFFFF9C)
    {
      -[RadioCC sendRadioNotification](self, "sendRadioNotification");
      unsigned int previousValue = self->super.previousValue;
    }

    self->radioNotificationToken = previousValue;
  }

- (void)sendRadioNotification
{
  unsigned int previousValue = self->super.previousValue;
  if (previousValue <= 1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = previousValue;
  }
  if (notify_set_state(self->txPowerLimit, v3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003A594();
  }
  if (notify_post("com.apple.cltm.radioNotification"))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A568();
    }
  }

- (void)calculateMitigation
{
  v2 = *(dispatch_queue_s **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001541C;
  block[3] = &unk_1000614D0;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)createServerConnection
{
  v11[0] = 0LL;
  __int128 v12 = 0u;
  uint64_t v13 = 0LL;
  v11[1] = self;
  uint64_t v3 = *(OS_dispatch_queue **)((char *)&self->radioQueue + 4);
  if (v3) {
    CFRelease(v3);
  }
  objc_super v4 = (OS_dispatch_queue *)_CTServerConnectionCreateWithIdentifier( kCFAllocatorDefault,  @"CLTM_Radio",  sub_1000155F8,  v11);
  *(OS_dispatch_queue **)((char *)&self->radioQueue + 4) = v4;
  if (v4)
  {
    if (byte_10007CB30)
    {
      v5 = v4;
      uint64_t v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        objc_super v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> CT connection %p", buf, 0xCu);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
  {
    sub_10003A62C();
  }

  _CTServerConnectionAddToRunLoop( *(OS_dispatch_queue **)((char *)&self->radioQueue + 4),  *(__CTServerConnection **)((char *)&self->serverConnection + 4),  kCFRunLoopCommonModes);
  uint64_t v7 = *(uint64_t *)((char *)&self->radioQueue + 4);
  uint64_t v8 = kCTDaemonReadyNotification;
  if (_CTServerConnectionRegisterForNotification(v7, kCTDaemonReadyNotification))
  {
    v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A5C0(v8, v9, v10);
    }
  }

- (void)createConnectionToCT
{
  if (!-[ComponentControl isCPMSControlEnabled](self, "isCPMSControlEnabled"))
  {
    -[RadioCC createServerConnection](self, "createServerConnection");
    -[RadioCC initializeRadio](self, "initializeRadio");
  }

- (void)initializeRadio
{
  if (_CTServerConnectionSetMaxTemperature( *(OS_dispatch_queue **)((char *)&self->radioQueue + 4),  6200LL))
  {
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
      sub_10003A6C4();
    }
  }

  else
  {
    -[RadioCC setMaxTransmitPower](self, "setMaxTransmitPower");
  }

- (void)setMaxTransmitPower
{
  v2 = *(dispatch_queue_s **)((char *)&self->radioPowerConfiguration + 4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000157CC;
  block[3] = &unk_1000614D0;
  block[4] = self;
  dispatch_async(v2, block);
}

- (void)addRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003A788();
  }
}

- (void)calculateAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003A788();
  }
}

- (void)setAdditionalRadioMitigations
{
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003A788();
  }
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RadioCC;
  -[ComponentControl setCPMSMitigationState:](&v4, "setCPMSMitigationState:", a3);
  -[RadioCC createConnectionToCT](self, "createConnectionToCT");
}

- (int)numberOfFields
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___RadioPowerCC, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___RadioCC;
    return -[ComponentControl numberOfFields](&v6, "numberOfFields");
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___RadioCC;
    return -[ComponentControl numberOfFields](&v5, "numberOfFields") + 1;
  }

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RadioCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") > a3
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___RadioPowerCC, v5), (objc_opt_isKindOfClass(self, v6) & 1) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___RadioCC;
    return -[ComponentControl copyHeaderForIndex:](&v9, "copyHeaderForIndex:", v3);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___RadioCC;
    if (-[ComponentControl numberOfFields](&v8, "numberOfFields") == (_DWORD)v3) {
      return @"Radio - txPowerLimit/10";
    }
    else {
      return 0LL;
    }
  }

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RadioCC;
  if (-[ComponentControl numberOfFields](&v10, "numberOfFields") > a3
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___RadioPowerCC, v5), (objc_opt_isKindOfClass(self, v6) & 1) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___RadioCC;
    return -[ComponentControl copyFieldCurrentValueForIndex:](&v9, "copyFieldCurrentValueForIndex:", v3);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___RadioCC;
    if (-[ComponentControl numberOfFields](&v8, "numberOfFields") == (_DWORD)v3) {
      return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%d",  (SHIDWORD(self->runLoop) / 10));
    }
    else {
      return 0LL;
    }
  }

@end