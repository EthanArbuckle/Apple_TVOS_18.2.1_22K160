@interface ADCarPlayAnnouncementRequestCapabilityProvider
- (void)_updateForCarPlaySessionConnected:(BOOL)a3;
@end

@implementation ADCarPlayAnnouncementRequestCapabilityProvider

- (void)_updateForCarPlaySessionConnected:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADCarPlayAnnouncementRequestCapabilityProvider;
  id v4 = -[AFCarPlayAnnouncementRequestCapabilityProvider _updateForCarPlaySessionConnected:]( &v13,  "_updateForCarPlaySessionConnected:");
  if (v3)
  {
    uint64_t v6 = _AFPreferencesAnnounceNotificationsInCarPlayType(v4, v5);
    switch(_AFPreferencesAnnounceNotificationsInCarPlayType(v6, v7))
    {
      case 0LL:
      case 1LL:
      case 4LL:
        v8 = @"Not resetting announce notifications.";
        break;
      case 2LL:
        _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled(0LL);
        v8 = @"Resetting announce notifications in CarPlay to unmuted.";
        break;
      case 3LL:
        _AFPreferencesSetAnnounceNotificationsInCarPlayTemporarilyDisabled(1LL);
        v8 = @"Resetting announce notifications in CarPlay to muted.";
        break;
      default:
        v8 = 0LL;
        break;
    }

    v9 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      uint64_t Name = AFSiriCarPlayAnnounceEnablementTypeGetName(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(Name);
      *(_DWORD *)buf = 136315650;
      v15 = "-[ADCarPlayAnnouncementRequestCapabilityProvider _updateForCarPlaySessionConnected:]";
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s New CarPlay connection with setting %@. %@",  buf,  0x20u);
    }
  }

@end