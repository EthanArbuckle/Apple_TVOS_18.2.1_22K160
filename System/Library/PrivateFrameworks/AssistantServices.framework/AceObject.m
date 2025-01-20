@interface AceObject
- (BOOL)_adui_shouldNotifyOthersOfArrival;
- (BOOL)ad_shouldUseExtendedFlowTimeout;
- (BOOL)ad_transcriptionResultRequiresAddressBook;
- (id)_ad_mediaRemoteOptions;
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
- (void)_ad_setPayloadOnRequestInfo:(id)a3;
- (void)_adui_notifyOthersOfArrival;
- (void)adClientConnection_enterRequestGroup:(id)a3;
- (void)adClientConnection_leaveRequestGroup;
@end

@implementation AceObject

- (id)_ad_mediaRemoteOptions
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 4LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject refId](self, "refId"));
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, kMRMediaRemoteOptionContextID);
  }
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  AFSiriMediaRemoteIdentifier,  kMRMediaRemoteOptionRemoteControlInterfaceIdentifier);

  return v3;
}

- (void)_ad_setPayloadOnRequestInfo:(id)a3
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[AceObject(AFRequestInfo) _ad_setPayloadOnRequestInfo:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Don't know how to set push off request payload",  (uint8_t *)&v4,  0xCu);
  }

- (BOOL)_adui_shouldNotifyOthersOfArrival
{
  return 0;
}

- (void)_adui_notifyOthersOfArrival
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    int v4 = "-[AceObject(ADUIService) _adui_notifyOthersOfArrival]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s This command is not supposed to notify others of arrival",  (uint8_t *)&v3,  0xCu);
  }

- (void)adClientConnection_enterRequestGroup:(id)a3
{
  int v4 = (dispatch_group_s *)a3;
  v5 = v4;
  if (v4)
  {
    dispatch_group_enter(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AceObject description](self, "description"));
    v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[AceObject(ADClientConnectionSupport) adClientConnection_enterRequestGroup:]";
      __int16 v16 = 2112;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v6;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Entered request group %@ for command %@.",  buf,  0x20u);
    }

    v8 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10030C808;
    v11[3] = &unk_1004FBA60;
    v12 = v5;
    id v13 = v6;
    id v9 = v6;
    v10 = -[AFSafetyBlock initWithBlock:](v8, "initWithBlock:", v11);
    objc_setAssociatedObject(self, off_100576900, v10, (void *)1);
  }
}

- (void)adClientConnection_leaveRequestGroup
{
  id AssociatedObject = objc_getAssociatedObject(self, off_100576900);
  int v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v4)
  {
    id v5 = v4;
    [v4 invokeWithSignal:0];
    objc_setAssociatedObject(self, off_100576900, 0LL, (void *)1);
    int v4 = v5;
  }
}

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  return 0LL;
}

- (BOOL)ad_transcriptionResultRequiresAddressBook
{
  return 0;
}

- (BOOL)ad_shouldUseExtendedFlowTimeout
{
  return 0;
}

@end