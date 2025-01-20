@interface CLDaemonSettingsManager
- (CLDaemonSettingsManager)init;
- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5;
- (void)beginService;
- (void)endService;
- (void)flush;
- (void)refresh;
@end

@implementation CLDaemonSettingsManager

- (CLDaemonSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonSettingsManager;
  return -[CLDaemonSettingsManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSettingsManagerProtocol,  &OBJC_PROTOCOL___CLSettingsManagerClientProtocol);
}

- (void)beginService
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLDaemonSettingsManager;
  -[CLDaemonSettingsManager beginService](&v5, "beginService");
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100397AD8;
  handler[3] = &unk_10182D2A0;
  handler[4] = self;
  notify_register_dispatch( (const char *)[@"com.apple.locationd/Prefs" UTF8String],  &self->_fDaemonPreferencesChangedNotificationToken,  (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo"), "queue"),  handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100397AE0;
  v3[3] = &unk_10182D2A0;
  v3[4] = self;
  notify_register_dispatch( (const char *)[@"com.apple.ManagedConfiguration.profileListChanged" UTF8String],  &self->_fMCProfileListChangedForDaemonSettingsNotificationToken,  (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLDaemonSettingsManager universe](self, "universe"), "silo"), "queue"),  v3);
  -[CLDaemonSettingsManager refresh](self, "refresh");
}

- (void)endService
{
  self->_fDaemonPreferencesChangedNotificationToken = -1;
  notify_cancel(self->_fMCProfileListChangedForDaemonSettingsNotificationToken);
  self->_fMCProfileListChangedForDaemonSettingsNotificationToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonSettingsManager;
  -[CLDaemonSettingsManager endService](&v3, "endService");
}

- (void)refresh
{
  objc_super v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  -[CLDaemonSettingsManager updateClientsWithDictionary:]( self,  "updateClientsWithDictionary:",  +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  -[CLDaemonSettingsManager settingsDictionary](self, "settingsDictionary")));
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  v9 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLDaemonSettingsManager;
  return -[CLDaemonSettingsManager syncgetSetValue:forKey:withoutNotifying:]( &v13,  "syncgetSetValue:forKey:withoutNotifying:",  a3,  a4,  a5);
}

- (void)flush
{
  objc_super v3 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  -[CLDaemonSettingsManager refresh](self, "refresh");
}

@end