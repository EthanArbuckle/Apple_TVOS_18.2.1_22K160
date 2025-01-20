@interface TVSSVPNConfiguration
+ (id)localizedConnectionStatus:(unint64_t)a3;
- (BOOL)enabled;
- (BOOL)isRelay;
- (NEConfiguration)neConfiguration;
- (NERelayConfiguration)relay;
- (NEVPN)vpn;
- (NSString)contentTitle;
- (NSString)displayName;
- (NSUUID)identifier;
- (TVSSVPNConfiguration)initWithNEConfiguration:(id)a3;
- (UIImage)contentImage1;
- (id)_displayNameFromConfigurationName:(id)a3;
- (int)sessionStatus;
- (unint64_t)connectionStatus;
- (void)_getConnectionStatus;
- (void)_setupEventHandler;
- (void)_updateConnectionStatus;
- (void)connect;
- (void)disconnect;
- (void)session;
- (void)setConnectionStatus:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setNeConfiguration:(id)a3;
- (void)setRelay:(id)a3;
- (void)setSession:(void *)a3;
- (void)setSessionStatus:(int)a3;
- (void)setVpn:(id)a3;
- (void)updateStatusForRelay;
- (void)updateWithNEConfiguration:(id)a3;
@end

@implementation TVSSVPNConfiguration

- (TVSSVPNConfiguration)initWithNEConfiguration:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v26;
  v26 = 0LL;
  v24.receiver = v3;
  v24.super_class = (Class)&OBJC_CLASS___TVSSVPNConfiguration;
  v26 = -[TVSSVPNConfiguration init](&v24, "init");
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    -[TVSSVPNConfiguration setNeConfiguration:](v26, "setNeConfiguration:", location[0]);
    id v11 = [location[0] VPN];
    -[TVSSVPNConfiguration setVpn:](v26, "setVpn:");

    id v12 = [location[0] relay];
    -[TVSSVPNConfiguration setRelay:](v26, "setRelay:");

    id v13 = [location[0] identifier];
    -[TVSSVPNConfiguration setIdentifier:](v26, "setIdentifier:");

    v14 = v26;
    id v16 = [location[0] name];
    id v15 = -[TVSSVPNConfiguration _displayNameFromConfigurationName:](v14, "_displayNameFromConfigurationName:");
    -[TVSSVPNConfiguration setDisplayName:](v26, "setDisplayName:");

    v4 = -[TVSSVPNConfiguration relay](v26, "relay");
    BOOL v17 = v4 == 0LL;

    if (v17)
    {
      v5 = -[TVSSVPNConfiguration vpn](v26, "vpn");
      BOOL v9 = v5 == 0LL;

      if (!v9)
      {
        -[TVSSVPNConfiguration setConnectionStatus:](v26, "setConnectionStatus:", 0LL);
        -[NSUUID getUUIDBytes:](v26->_identifier, "getUUIDBytes:");
        uint64_t v6 = ne_session_create(v27);
        -[TVSSVPNConfiguration setSession:](v26, "setSession:", v6);
        -[TVSSVPNConfiguration setSessionStatus:](v26, "setSessionStatus:", 1LL);
        -[TVSSVPNConfiguration _getConnectionStatus](v26, "_getConnectionStatus");
        -[TVSSVPNConfiguration _setupEventHandler](v26, "_setupEventHandler");
      }
    }

    else
    {
      queue = &_dispatch_main_q;
      v18 = _NSConcreteStackBlock;
      int v19 = -1073741824;
      int v20 = 0;
      v21 = sub_10002D380;
      v22 = &unk_1001B5A60;
      v23 = v26;
      dispatch_async(queue, &v18);

      objc_storeStrong((id *)&v23, 0LL);
    }
  }

  v8 = v26;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  return v8;
}

- (BOOL)isRelay
{
  v2 = -[TVSSVPNConfiguration relay](self, "relay");
  BOOL v4 = v2 != 0LL;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v9 = a3;
  v3 = -[TVSSVPNConfiguration relay](self, "relay");
  BOOL v8 = v3 == 0LL;

  if (v8)
  {
    BOOL v4 = -[TVSSVPNConfiguration vpn](self, "vpn");
    BOOL v6 = v4 == 0LL;

    if (!v6)
    {
      v5 = -[TVSSVPNConfiguration vpn](self, "vpn");
      -[NEVPN setEnabled:](v5, "setEnabled:", v9);
    }
  }

  else
  {
    v7 = -[TVSSVPNConfiguration relay](self, "relay");
    -[NERelayConfiguration setEnabled:](v7, "setEnabled:", v9);
  }

- (BOOL)enabled
{
  v2 = -[TVSSVPNConfiguration relay](self, "relay");
  BOOL v8 = v2 == 0LL;

  if (v8)
  {
    v3 = -[TVSSVPNConfiguration vpn](self, "vpn");
    BOOL v6 = v3 == 0LL;

    if (v6)
    {
      return 0;
    }

    else
    {
      v5 = -[TVSSVPNConfiguration vpn](self, "vpn");
      BOOL v10 = -[NEVPN isEnabled](v5, "isEnabled") & 1;
    }
  }

  else
  {
    v7 = -[TVSSVPNConfiguration relay](self, "relay");
    BOOL v10 = -[NERelayConfiguration isEnabled](v7, "isEnabled") & 1;
  }

  return v10;
}

- (void)connect
{
  if (-[TVSSVPNConfiguration session](self, "session")) {
    ne_session_start(-[TVSSVPNConfiguration session](self, "session"));
  }
}

- (void)disconnect
{
  if (-[TVSSVPNConfiguration session](self, "session")) {
    ne_session_stop(-[TVSSVPNConfiguration session](self, "session"));
  }
}

- (void)updateWithNEConfiguration:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSVPNConfiguration setNeConfiguration:](v6, "setNeConfiguration:", location[0]);
  id v3 = [location[0] VPN];
  -[TVSSVPNConfiguration setVpn:](v6, "setVpn:");

  id v4 = [location[0] relay];
  -[TVSSVPNConfiguration setRelay:](v6, "setRelay:");

  -[TVSSVPNConfiguration updateStatusForRelay](v6, "updateStatusForRelay");
  objc_storeStrong(location, 0LL);
}

- (void)updateStatusForRelay
{
  v2 = -[TVSSVPNConfiguration relay](self, "relay");
  BOOL v5 = v2 == 0LL;

  if (!v5)
  {
    id v3 = -[TVSSVPNConfiguration relay](self, "relay");
    unsigned __int8 v4 = -[NERelayConfiguration isEnabled](v3, "isEnabled");

    if ((v4 & 1) != 0) {
      -[TVSSVPNConfiguration setConnectionStatus:](self, "setConnectionStatus:", 5LL);
    }
    else {
      -[TVSSVPNConfiguration setConnectionStatus:](self, "setConnectionStatus:", 0LL);
    }
  }

+ (id)localizedConnectionStatus:(unint64_t)a3
{
  if (a3 <= 5) {
    __asm { BR              X8 }
  }

  return TVSSLocString(@"TVSSVPNInvalidTitle");
}

- (void)_setupEventHandler
{
  id v11 = self;
  location[1] = (id)a2;
  if (-[TVSSVPNConfiguration session](self, "session"))
  {
    objc_initWeak(location, v11);
    id v3 = -[TVSSVPNConfiguration session](v11, "session");
    v2 = &_dispatch_main_q;
    unsigned __int8 v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_10002DAA8;
    BOOL v8 = &unk_1001B6AD0;
    objc_copyWeak(&v9, location);
    ne_session_set_event_handler(v3, v2, &v4);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }

- (void)_updateConnectionStatus
{
  unint64_t v2 = -[TVSSVPNConfiguration sessionStatus](self, "sessionStatus");
  if (v2 <= 5) {
    __asm { BR              X8 }
  }

  -[TVSSVPNConfiguration setConnectionStatus:](self, "setConnectionStatus:", 0LL);
}

- (void)_getConnectionStatus
{
  id v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v3 = -[TVSSVPNConfiguration session](v11, "session");
  unint64_t v2 = &_dispatch_main_q;
  unsigned __int8 v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10002DD38;
  BOOL v8 = &unk_1001B6AF8;
  objc_copyWeak(v9, location);
  ne_session_get_status(v3, v2, &v4);

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
}

- (id)_displayNameFromConfigurationName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  else {
    int v5 = (__CFString *)location[0];
  }
  objc_storeStrong(location, 0LL);
  return v5;
}

- (NEConfiguration)neConfiguration
{
  return self->_neConfiguration;
}

- (void)setNeConfiguration:(id)a3
{
}

- (unint64_t)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(unint64_t)a3
{
  self->_connectionStatus = a3;
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

- (void).cxx_destruct
{
}

- (NSString)contentTitle
{
  return -[TVSSVPNConfiguration displayName](self, "displayName", a2, self);
}

- (UIImage)contentImage1
{
  char v6 = 0;
  char v4 = 0;
  if (-[TVSSVPNConfiguration enabled](self, "enabled"))
  {
    id v7 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"checkmark.circle.fill");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"circle");
    char v4 = 1;
    id v2 = v5;
  }

  BOOL v8 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  return (UIImage *)v8;
  }
}

@end