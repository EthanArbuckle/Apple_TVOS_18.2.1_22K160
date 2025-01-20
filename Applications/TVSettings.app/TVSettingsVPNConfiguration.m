@interface TVSettingsVPNConfiguration
- (BOOL)enabled;
- (BOOL)isProfileBacked;
- (BOOL)onDemandCapable;
- (BOOL)onDemandEnabled;
- (NEConfiguration)neConfiguration;
- (NERelayConfiguration)relay;
- (NEVPN)vpn;
- (NSArray)domains;
- (NSArray)ipAddresses;
- (NSNumber)sessionConnectTime;
- (NSString)applicationIdentifier;
- (NSString)applicationName;
- (NSString)displayName;
- (NSString)localizedElapsedTime;
- (NSString)organization;
- (NSString)remoteAddress;
- (NSString)server;
- (NSUUID)identifier;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)connectionTimer;
- (TVSettingsVPNConfiguration)initWithNEConfiguration:(id)a3;
- (id)_convertTimeToString:(unint64_t)a3;
- (id)_displayNameFromConfigurationName:(id)a3;
- (id)description;
- (int)sessionStatus;
- (unint64_t)_elapsedTimeSinceStartTime:(id)a3;
- (unint64_t)connectionStatus;
- (unint64_t)connectionType;
- (unint64_t)grade;
- (void)_cancelConnectionTimer;
- (void)_getConnectionStatus;
- (void)_setupEventHandler;
- (void)_startConnectionTimer;
- (void)_updateConnectTimeString;
- (void)_updateConnectionStatus;
- (void)_updateExtendedStatusValues;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)session;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setConnectionStatus:(unint64_t)a3;
- (void)setConnectionTimer:(id)a3;
- (void)setConnectionType:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomains:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGrade:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIpAddresses:(id)a3;
- (void)setLocalizedElapsedTime:(id)a3;
- (void)setNeConfiguration:(id)a3;
- (void)setOnDemandCapable:(BOOL)a3;
- (void)setOnDemandEnabled:(BOOL)a3;
- (void)setOrganization:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelay:(id)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setServer:(id)a3;
- (void)setSession:(void *)a3;
- (void)setSessionConnectTime:(id)a3;
- (void)setSessionStatus:(int)a3;
- (void)setVpn:(id)a3;
- (void)updateStatusForRelay;
- (void)updateWithNEConfiguration:(id)a3;
@end

@implementation TVSettingsVPNConfiguration

- (TVSettingsVPNConfiguration)initWithNEConfiguration:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___TVSettingsVPNConfiguration;
  v5 = -[TVSettingsVPNConfiguration init](&v31, "init");
  v6 = v5;
  if (v5)
  {
    -[TVSettingsVPNConfiguration setNeConfiguration:](v5, "setNeConfiguration:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 VPN]);
    -[TVSettingsVPNConfiguration setVpn:](v6, "setVpn:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 relay]);
    -[TVSettingsVPNConfiguration setRelay:](v6, "setRelay:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 VPN]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 relay]);
    if (v10)
    {
      -[TVSettingsVPNConfiguration setConnectionType:](v6, "setConnectionType:", 5LL);
      uint64_t v11 = 2LL;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 protocol]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NEVPNProtocolIKEv2);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v15 = 4LL;
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v9 protocol]);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NEVPNProtocolIPSec);
        char v18 = objc_opt_isKindOfClass(v16, v17);

        if ((v18 & 1) != 0)
        {
          uint64_t v15 = 2LL;
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v9 protocol]);
          uint64_t v20 = objc_opt_class(&OBJC_CLASS___NEVPNProtocolL2TP);
          char v21 = objc_opt_isKindOfClass(v19, v20);

          if ((v21 & 1) != 0) {
            uint64_t v15 = 0LL;
          }
          else {
            uint64_t v15 = 3LL;
          }
        }
      }

      -[TVSettingsVPNConfiguration setConnectionType:](v6, "setConnectionType:", v15);
      uint64_t v11 = [v4 grade] != (id)1;
    }

    -[TVSettingsVPNConfiguration setGrade:](v6, "setGrade:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    -[TVSettingsVPNConfiguration setIdentifier:](v6, "setIdentifier:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    v24 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsVPNConfiguration _displayNameFromConfigurationName:]( v6,  "_displayNameFromConfigurationName:",  v23));
    -[TVSettingsVPNConfiguration setDisplayName:](v6, "setDisplayName:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadInfo]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 payloadOrganization]);
    -[TVSettingsVPNConfiguration setOrganization:](v6, "setOrganization:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationName]);
    -[TVSettingsVPNConfiguration setApplicationName:](v6, "setApplicationName:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationIdentifier]);
    -[TVSettingsVPNConfiguration setApplicationIdentifier:](v6, "setApplicationIdentifier:", v28);

    if (v10)
    {
      -[TVSettingsVPNConfiguration updateStatusForRelay](v6, "updateStatusForRelay");
    }

    else if (v9)
    {
      -[NSUUID getUUIDBytes:](v6->_identifier, "getUUIDBytes:", v32);
      -[TVSettingsVPNConfiguration setSessionStatus:](v6, "setSessionStatus:", 1LL);
      -[TVSettingsVPNConfiguration setSession:](v6, "setSession:", ne_session_create(v32, 1LL));
      dispatch_queue_t v29 = dispatch_queue_create("VPNConnection", 0LL);
      -[TVSettingsVPNConfiguration setQueue:](v6, "setQueue:", v29);

      -[TVSettingsVPNConfiguration _getConnectionStatus](v6, "_getConnectionStatus");
      -[TVSettingsVPNConfiguration _setupEventHandler](v6, "_setupEventHandler");
    }
  }

  return v6;
}

- (void)dealloc
{
  if (-[TVSettingsVPNConfiguration session](self, "session"))
  {
    ne_session_cancel(-[TVSettingsVPNConfiguration session](self, "session"));
    -[TVSettingsVPNConfiguration setSession:](self, "setSession:", 0LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsVPNConfiguration;
  -[TVSettingsVPNConfiguration dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration identifier](self, "identifier"));
  id v5 = [v3 appendObject:v4 withName:@"identifier"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration displayName](self, "displayName"));
  [v3 appendString:v6 withName:@"displayName"];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));

    if (!v7) {
      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
  }

  id v8 = v6;
  [v6 setEnabled:v3];
}

- (BOOL)enabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
LABEL_5:
    v6 = v4;
    unsigned __int8 v7 = [v4 isEnabled];

    return v7;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));

  if (v5)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
    goto LABEL_5;
  }

  return 0;
}

- (BOOL)onDemandCapable
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 onDemandRules]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
  [v5 setOnDemandEnabled:v3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSettingsVPNFacade sharedInstance](&OBJC_CLASS___TVSettingsVPNFacade, "sharedInstance"));
  [v6 saveConfiguration:self];
}

- (BOOL)onDemandEnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 onDemandRules]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
    unsigned __int8 v6 = [v5 isOnDemandEnabled];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isProfileBacked
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration neConfiguration](self, "neConfiguration"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 payloadInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profileIdentifier]);

  if (!v5) {
    return 0;
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration neConfiguration](self, "neConfiguration"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 payloadInfo]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 profileIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 installedProfileWithIdentifier:v9]);

  BOOL v11 = v10 != 0LL;
  return v11;
}

- (NSString)server
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));

  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 relays]);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 HTTP3RelayURL]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 relays]);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 HTTP2RelayURL]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);

LABEL_6:
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration vpn](self, "vpn"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 protocol]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 serverAddress]);
      goto LABEL_6;
    }
  }

  return (NSString *)v8;
}

- (void)connect
{
  if (-[TVSettingsVPNConfiguration session](self, "session")) {
    ne_session_start(-[TVSettingsVPNConfiguration session](self, "session"));
  }
}

- (void)disconnect
{
  if (-[TVSettingsVPNConfiguration session](self, "session")) {
    ne_session_stop(-[TVSettingsVPNConfiguration session](self, "session"));
  }
}

- (void)updateWithNEConfiguration:(id)a3
{
  id v4 = a3;
  -[TVSettingsVPNConfiguration setNeConfiguration:](self, "setNeConfiguration:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 VPN]);
  -[TVSettingsVPNConfiguration setVpn:](self, "setVpn:", v5);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 relay]);
  -[TVSettingsVPNConfiguration setRelay:](self, "setRelay:", v6);

  -[TVSettingsVPNConfiguration updateStatusForRelay](self, "updateStatusForRelay");
}

- (void)updateStatusForRelay
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
    unsigned int v5 = [v4 isEnabled];

    if (v5) {
      uint64_t v6 = 5LL;
    }
    else {
      uint64_t v6 = 0LL;
    }
    -[TVSettingsVPNConfiguration setConnectionStatus:](self, "setConnectionStatus:", v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration relay](self, "relay"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v8 matchDomains]);
    -[TVSettingsVPNConfiguration setDomains:](self, "setDomains:", v7);
  }

- (void)_setupEventHandler
{
  if (-[TVSettingsVPNConfiguration session](self, "session"))
  {
    objc_initWeak(&location, self);
    BOOL v3 = -[TVSettingsVPNConfiguration session](self, "session");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration queue](self, "queue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000A9218;
    v5[3] = &unk_1001931E0;
    objc_copyWeak(&v6, &location);
    ne_session_set_event_handler(v3, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (void)_updateConnectTimeString
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration sessionConnectTime](self, "sessionConnectTime"));
  unint64_t v4 = -[TVSettingsVPNConfiguration _elapsedTimeSinceStartTime:](self, "_elapsedTimeSinceStartTime:", v3);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration _convertTimeToString:](self, "_convertTimeToString:", v4));
  -[TVSettingsVPNConfiguration setLocalizedElapsedTime:](self, "setLocalizedElapsedTime:", v5);
}

- (void)_updateConnectionStatus
{
  unsigned int v3 = -[TVSettingsVPNConfiguration sessionStatus](self, "sessionStatus") - 1;
  if (v3 > 4) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = qword_10012A330[v3];
  }
  -[TVSettingsVPNConfiguration setConnectionStatus:](self, "setConnectionStatus:", v4);
}

- (void)_updateExtendedStatusValues
{
  unsigned int v3 = -[TVSettingsVPNConfiguration session](self, "session");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A94CC;
  v5[3] = &unk_100193230;
  objc_copyWeak(&v6, &location);
  ne_session_get_info(v3, 2LL, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_cancelConnectionTimer
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration connectionTimer](self, "connectionTimer"));

  if (v3)
  {
    uint64_t v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration connectionTimer](self, "connectionTimer"));
    dispatch_source_cancel(v4);

    -[TVSettingsVPNConfiguration setConnectionTimer:](self, "setConnectionTimer:", 0LL);
    -[TVSettingsVPNConfiguration setLocalizedElapsedTime:](self, "setLocalizedElapsedTime:", 0LL);
  }

- (void)_startConnectionTimer
{
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  -[TVSettingsVPNConfiguration setConnectionTimer:](self, "setConnectionTimer:", v3);

  uint64_t v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration connectionTimer](self, "connectionTimer"));
  dispatch_source_set_timer(v4, 0LL, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

  objc_initWeak(&location, self);
  id v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration connectionTimer](self, "connectionTimer"));
  unsigned __int8 v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_1000A9BAC;
  v10 = &unk_10018E810;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler(v5, &v7);

  id v6 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration connectionTimer](self, "connectionTimer", v7, v8, v9, v10));
  dispatch_resume(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_getConnectionStatus
{
  dispatch_source_t v3 = -[TVSettingsVPNConfiguration session](self, "session");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsVPNConfiguration queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A9CB4;
  v5[3] = &unk_10018E540;
  objc_copyWeak(&v6, &location);
  ne_session_get_status(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (unint64_t)_elapsedTimeSinceStartTime:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  [v3 unsignedLongLongValue];
  if (qword_1001E1A58 != -1) {
    dispatch_once(&qword_1001E1A58, &stru_100193250);
  }
  unint64_t v4 = (unint64_t)(*(double *)&qword_1001E1A50 * (double)mach_absolute_time());
  id v5 = [v3 unsignedLongLongValue];

  return v4 - (void)v5;
}

- (id)_convertTimeToString:(unint64_t)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  unint64_t v3 = a3 % 0x3C;
  unsigned int v5 = a3 + 3599;
  if ((a3 + 3599) <= 0x1C1E && !(_DWORD)v4)
  {
    uint64_t v6 = TSKLocString(@"VPNTimeS");
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v3, v16, v17);
    goto LABEL_16;
  }

  if (v5 <= 0x1C1E && v4 <= 9)
  {
    v9 = @"VPNTimeMS";
LABEL_11:
    uint64_t v10 = TSKLocString(v9);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v4, v3, v17);
    goto LABEL_16;
  }

  if (v5 <= 0x1C1E && v4 >= 0xA)
  {
    v9 = @"VPNTimeMMS";
    goto LABEL_11;
  }

  uint64_t v11 = ((int)a3 / 3600);
  else {
    v12 = @"VPNTimeHMS";
  }
  uint64_t v13 = TSKLocString(v12);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v11, v4, v3);
LABEL_16:
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);

  if (!-[__CFString length](v14, "length"))
  {

LABEL_18:
    v14 = &stru_100195DD8;
  }

  return v14;
}

- (id)_displayNameFromConfigurationName:(id)a3
{
  id v3 = a3;
  else {
    uint64_t v4 = (__CFString *)v3;
  }

  return v4;
}

- (NEConfiguration)neConfiguration
{
  return self->_neConfiguration;
}

- (void)setNeConfiguration:(id)a3
{
}

- (void)setOnDemandCapable:(BOOL)a3
{
  self->_onDemandCapable = a3;
}

- (unint64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(unint64_t)a3
{
  self->_connectionType = a3;
}

- (unint64_t)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(unint64_t)a3
{
  self->_connectionStatus = a3;
}

- (unint64_t)grade
{
  return self->_grade;
}

- (void)setGrade:(unint64_t)a3
{
  self->_grade = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (void)setServer:(id)a3
{
}

- (NSString)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
}

- (NSArray)ipAddresses
{
  return self->_ipAddresses;
}

- (void)setIpAddresses:(id)a3
{
}

- (NSString)localizedElapsedTime
{
  return self->_localizedElapsedTime;
}

- (void)setLocalizedElapsedTime:(id)a3
{
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NEVPN)vpn
{
  return self->_vpn;
}

- (void)setVpn:(id)a3
{
}

- (NERelayConfiguration)relay
{
  return self->_relay;
}

- (void)setRelay:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)session
{
  return self->_session;
}

- (void)setSession:(void *)a3
{
  self->_session = a3;
}

- (int)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(int)a3
{
  self->_sessionStatus = a3;
}

- (OS_dispatch_source)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
}

- (NSNumber)sessionConnectTime
{
  return self->_sessionConnectTime;
}

- (void)setSessionConnectTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end