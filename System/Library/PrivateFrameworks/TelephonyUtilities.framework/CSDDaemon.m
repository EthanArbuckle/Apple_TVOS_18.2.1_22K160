@interface CSDDaemon
- (CHManager)chManager;
- (CPApplicationPolicyManager)applicationPolicyManager;
- (CSDAudioController)audioController;
- (CSDCallStateController)callStateController;
- (CSDCallStateMonitor)callStateMonitor;
- (CSDConversationProviderManager)conversationProviderManager;
- (CSDConversationProviderManagerXPCServer)conversationProviderManagerXPCServer;
- (CSDDaemon)init;
- (CSDHandoffAudioController)handoffAudioController;
- (CSDRelayClientController)relayClientController;
- (CSDRelayCommonController)relayCommonController;
- (CSDRelayHostController)relayHostController;
- (CSDRelayMessagingController)relayMessagingController;
- (CSDUserNotificationController)userNotificationController;
- (CSDVoIPApplicationController)voipApplicationController;
- (CSDVoiceOverObserver)voiceOverObserver;
- (NSMutableArray)signalHandlerDispatchSources;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUUserConfiguration)userConfiguration;
- (id)_setUpTemporaryDirectory;
- (void)_observeSignal:(int)a3 usingHandler:(id)a4;
- (void)_setUpLanguageChangeListener;
- (void)_setUpSandbox;
- (void)dealloc;
- (void)propertiesDidChangeForConfiguration:(id)a3;
- (void)setApplicationPolicyManager:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setCallStateController:(id)a3;
- (void)setCallStateMonitor:(id)a3;
- (void)setChManager:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandoffAudioController:(id)a3;
- (void)setRelayClientController:(id)a3;
- (void)setRelayCommonController:(id)a3;
- (void)setRelayHostController:(id)a3;
- (void)setRelayMessagingController:(id)a3;
- (void)setSignalHandlerDispatchSources:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)setUserNotificationController:(id)a3;
- (void)setVoiceOverObserver:(id)a3;
- (void)setVoipApplicationController:(id)a3;
@end

@implementation CSDDaemon

- (CSDDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDDaemon;
  id v2 = -[CSDDaemon init](&v12, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100085014;
    v9[3] = &unk_1003D7DF0;
    objc_copyWeak(&v10, &location);
    v3 = objc_retainBlock(v9);
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.calls", v5);
    v7 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v6;

    dispatch_sync(*((dispatch_queue_t *)v2 + 18), v3);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return (CSDDaemon *)v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDaemon signalHandlerDispatchSources](self, "signalHandlerDispatchSources"));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v10 + 1) + 8LL * (void)v8));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSDDaemon;
  -[CSDDaemon dealloc](&v9, "dealloc");
}

- (void)_observeSignal:(int)a3 usingHandler:(id)a4
{
  id v6 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CSDDaemon queue](self, "queue"));
  source = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0LL, v7);

  dispatch_source_set_event_handler(source, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDaemon signalHandlerDispatchSources](self, "signalHandlerDispatchSources"));
  [v8 addObject:source];

  dispatch_resume(source);
}

- (NSString)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 debugDescription]);
  [v3 appendFormat:@"%@\n", v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCapabilities debugDescription](&OBJC_CLASS___TUCallCapabilities, "debugDescription"));
  [v3 appendFormat:@"%@\n", v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSDCallCapabilities sharedInstance](&OBJC_CLASS___CSDCallCapabilities, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 debugDescription]);
  [v3 appendFormat:@"%@\n", v8];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSDRelayIDSService sharedInstance](&OBJC_CLASS___CSDRelayIDSService, "sharedInstance"));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 debugDescription]);
  [v3 appendFormat:@"%@\n", v10];

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDaemon relayMessagingController](self, "relayMessagingController"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 debugDescription]);
  [v3 appendFormat:@"%@\n", v12];

  return (NSString *)v3;
}

- (void)_setUpLanguageChangeListener
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  notify_register_dispatch("com.apple.language.changed", &out_token, v3, &stru_1003D8C60);
}

- (id)_setUpTemporaryDirectory
{
  if (!_set_user_dir_suffix([TUBundleIdentifierTelephonyUtilitiesFramework UTF8String])
    || !confstr(65537, v7, 0x400uLL)
    || mkdir(v7, 0x1C0u) && *__error() != 17)
  {
    id v3 = sub_1001704C4();
    dispatch_queue_attr_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1002B3E48();
    }
LABEL_11:

    exit(1);
  }

  bzero(v6, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v7, v6))
  {
    id v5 = sub_1001704C4();
    dispatch_queue_attr_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1002B3EC4();
    }
    goto LABEL_11;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v6));
}

- (void)_setUpSandbox
{
  id v2 = -[CSDDaemon _setUpTemporaryDirectory](self, "_setUpTemporaryDirectory");
}

- (void)propertiesDidChangeForConfiguration:(id)a3
{
  id v4 = sub_1001704C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User configuration changed", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDDaemon userConfiguration](self, "userConfiguration"));
  [v6 synchronize];
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (CSDConversationProviderManagerXPCServer)conversationProviderManagerXPCServer
{
  return self->_conversationProviderManagerXPCServer;
}

- (CSDConversationProviderManager)conversationProviderManager
{
  return self->_conversationProviderManager;
}

- (CHManager)chManager
{
  return self->_chManager;
}

- (void)setChManager:(id)a3
{
}

- (CSDCallStateController)callStateController
{
  return self->_callStateController;
}

- (void)setCallStateController:(id)a3
{
}

- (CSDCallStateMonitor)callStateMonitor
{
  return self->_callStateMonitor;
}

- (void)setCallStateMonitor:(id)a3
{
}

- (CSDRelayMessagingController)relayMessagingController
{
  return self->_relayMessagingController;
}

- (void)setRelayMessagingController:(id)a3
{
}

- (CSDRelayClientController)relayClientController
{
  return self->_relayClientController;
}

- (void)setRelayClientController:(id)a3
{
}

- (CSDRelayHostController)relayHostController
{
  return self->_relayHostController;
}

- (void)setRelayHostController:(id)a3
{
}

- (CSDRelayCommonController)relayCommonController
{
  return self->_relayCommonController;
}

- (void)setRelayCommonController:(id)a3
{
}

- (CSDVoIPApplicationController)voipApplicationController
{
  return self->_voipApplicationController;
}

- (void)setVoipApplicationController:(id)a3
{
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (void)setUserConfiguration:(id)a3
{
}

- (CSDUserNotificationController)userNotificationController
{
  return self->_userNotificationController;
}

- (void)setUserNotificationController:(id)a3
{
}

- (CSDVoiceOverObserver)voiceOverObserver
{
  return self->_voiceOverObserver;
}

- (void)setVoiceOverObserver:(id)a3
{
}

- (NSMutableArray)signalHandlerDispatchSources
{
  return self->_signalHandlerDispatchSources;
}

- (void)setSignalHandlerDispatchSources:(id)a3
{
}

- (CSDAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (CSDHandoffAudioController)handoffAudioController
{
  return self->_handoffAudioController;
}

- (void)setHandoffAudioController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CPApplicationPolicyManager)applicationPolicyManager
{
  return self->_applicationPolicyManager;
}

- (void)setApplicationPolicyManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end