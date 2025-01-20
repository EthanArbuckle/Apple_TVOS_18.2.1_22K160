@interface IDSFirewallNotificationCenter
- (BOOL)_notificationShouldRedirect;
- (IDSContactsUtilities)contactUtilities;
- (IDSFirewallNotificationCenter)init;
- (IDSFirewallNotificationCenter)initWithNotificationCenter:(id)a3 serverBag:(id)a4;
- (IDSRateLimiter)firewallAggressiveRateLimiter;
- (IDSRateLimiter)firewallRateLimiter;
- (IDSServerBag)serverBag;
- (IDSUserNotificationsCenter)notificationCenter;
- (id)_notificationBodyForService:(id)a3 URI:(id)a4;
- (id)_notificationIconIdentifierForService:(id)a3;
- (id)_notificationSupportURL;
- (id)_notificationTitleForService:(id)a3;
- (id)_rateLimiterForService:(id)a3;
- (id)_rateLimitingKeyForURI:(id)a3 service:(id)a4;
- (int64_t)_notificationAggressiveLimitPerPeriod;
- (int64_t)_notificationAggressiveLimitTimePeriod;
- (int64_t)_notificationLimitPerPeriod;
- (int64_t)_notificationLimitTimePeriod;
- (void)postNotificationForURI:(id)a3 onService:(id)a4 shouldRateLimit:(BOOL)a5 command:(id)a6;
- (void)setContactUtilities:(id)a3;
- (void)setFirewallAggressiveRateLimiter:(id)a3;
- (void)setFirewallRateLimiter:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setServerBag:(id)a3;
@end

@implementation IDSFirewallNotificationCenter

- (IDSFirewallNotificationCenter)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSUserNotificationsCenter sharedInstance]( &OBJC_CLASS___IDSUserNotificationsCenter,  "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  v5 = -[IDSFirewallNotificationCenter initWithNotificationCenter:serverBag:]( self,  "initWithNotificationCenter:serverBag:",  v3,  v4);

  return v5;
}

- (IDSFirewallNotificationCenter)initWithNotificationCenter:(id)a3 serverBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSFirewallNotificationCenter;
  v9 = -[IDSFirewallNotificationCenter init](&v18, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serverBag, a4);
    v11 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  -[IDSFirewallNotificationCenter _notificationLimitPerPeriod](v10, "_notificationLimitPerPeriod"),  (double)-[IDSFirewallNotificationCenter _notificationLimitTimePeriod](v10, "_notificationLimitTimePeriod"));
    firewallRateLimiter = v10->_firewallRateLimiter;
    v10->_firewallRateLimiter = v11;

    v13 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  -[IDSFirewallNotificationCenter _notificationAggressiveLimitPerPeriod]( v10,  "_notificationAggressiveLimitPerPeriod"),  (double)-[IDSFirewallNotificationCenter _notificationAggressiveLimitTimePeriod]( v10,  "_notificationAggressiveLimitTimePeriod"));
    firewallAggressiveRateLimiter = v10->_firewallAggressiveRateLimiter;
    v10->_firewallAggressiveRateLimiter = v13;

    objc_storeStrong((id *)&v10->_notificationCenter, a3);
    v15 = objc_alloc_init(&OBJC_CLASS___IDSContactsUtilities);
    contactUtilities = v10->_contactUtilities;
    v10->_contactUtilities = v15;
  }

  return v10;
}

- (int64_t)_notificationLimitPerPeriod
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"firewall-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    int64_t v6 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v6 = 1LL;
  }

  return v6;
}

- (int64_t)_notificationLimitTimePeriod
{
  int64_t v2 = 86400LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"firewall-time-period"]);

  if (v4)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
      int64_t v2 = (int64_t)[v4 integerValue];
    }
  }

  return v2;
}

- (int64_t)_notificationAggressiveLimitPerPeriod
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"firewall-aggressive-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    int64_t v6 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v6 = 1LL;
  }

  return v6;
}

- (int64_t)_notificationAggressiveLimitTimePeriod
{
  int64_t v2 = 604800LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"firewall-aggressive-time-period"]);

  if (v4)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
      int64_t v2 = (int64_t)[v4 integerValue];
    }
  }

  return v2;
}

- (BOOL)_notificationShouldRedirect
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"firewall-should-redirect"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)_notificationSupportURL
{
  int64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter serverBag](self, "serverBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"firewall-support-url"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = v3;
  }
  else {
    unsigned __int8 v6 = @"https://support.apple.com";
  }

  return v6;
}

- (id)_rateLimitingKeyForURI:(id)a3 service:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([a3 unprefixedURI]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v6, v7));
  return v8;
}

- (id)_rateLimiterForService:(id)a3
{
  uint64_t v4 = (objc_class *)[a3 firewallNotificationRateLimitType];
  if (!(_DWORD)v4)
  {
    uint64_t v5 = 3LL;
    goto LABEL_5;
  }

  if ((_DWORD)v4 == 1)
  {
    uint64_t v5 = 4LL;
LABEL_5:
    uint64_t v4 = (&self->super.isa)[v5];
  }

  return v4;
}

- (id)_notificationTitleForService:(id)a3
{
  id v4 = a3;
  unsigned __int8 v6 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  switch([v4 firewallNotificationStyle])
  {
    case 0u:
      id v8 = @"Lockdown Mode";
      goto LABEL_8;
    case 1u:
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_1006998E8((uint64_t)v4, v10, v11, v12, v13, v14, v15, v16);
      }

      goto LABEL_7;
    case 2u:
      id v8 = @"Lockdown Mode blocked iCloud collaboration";
      v9 = @"Firewall iCloud alert title";
      goto LABEL_51;
    case 3u:
      id v8 = @"Lockdown Mode blocked Apple Pay request";
      v9 = @"Firewall ApplePay request alert title";
      goto LABEL_51;
    case 4u:
      id v8 = @"Lockdown Mode blocked Apple Card sharing";
      v9 = @"Firewall ApplePay sharing alert title";
      goto LABEL_51;
    case 5u:
      id v8 = @"Lockdown Mode blocked SharePlay";
      v9 = @"Firewall SharePlay alert title";
      goto LABEL_51;
    case 6u:
      id v8 = @"Lockdown Mode blocked FaceTime";
      v9 = @"Firewall FaceTime alert title";
      goto LABEL_51;
    case 7u:
      id v8 = @"Lockdown Mode blocked FaceTime Audio";
      v9 = @"Firewall FaceTime Audio alert title";
      goto LABEL_51;
    case 8u:
      id v8 = @"Lockdown Mode blocked FaceTime Video Message";
      v9 = @"Firewall FaceTime Messaging alert title";
      goto LABEL_51;
    case 9u:
      id v8 = @"Lockdown Mode blocked FaceTime Live Photo";
      v9 = @"Firewall FaceTime Live Photos alert title";
      goto LABEL_51;
    case 0xAu:
    case 0x16u:
      id v8 = @"Lockdown Mode blocked Intercom message";
      v9 = @"Firewall Intercom alert title";
      goto LABEL_51;
    case 0xBu:
      id v8 = @"Lockdown Mode blocked Screen Sharing";
      v9 = @"Firewall Screen Sharing alert title";
      goto LABEL_51;
    case 0xCu:
      id v8 = @"Lockdown Mode blocked Walkie-Talkie";
      v9 = @"Firewall Walkie-Talkie alert title";
      goto LABEL_51;
    case 0xDu:
      id v8 = @"Lockdown Mode blocked Classroom";
      v9 = @"Firewall Classroom alert title";
      goto LABEL_51;
    case 0xEu:
      id v8 = @"Lockdown Mode blocked purchase request";
      v9 = @"Firewall iTunes Purchase request alert title";
      goto LABEL_51;
    case 0xFu:
      id v8 = @"Lockdown Mode blocked Find My";
      v9 = @"Firewall Find My Device alert title";
      goto LABEL_51;
    case 0x10u:
      id v8 = @"Lockdown Mode blocked Location Sharing invitation";
      v9 = @"Firewall Location Sharing alert title";
      goto LABEL_51;
    case 0x11u:
      id v8 = @"Lockdown Mode blocked Find My Item sharing";
      v9 = @"Firewall Find My Item Sharing alert title";
      goto LABEL_51;
    case 0x12u:
      id v8 = @"Lockdown Mode blocked Sharing";
      v9 = @"Firewall GroupKit alert title";
      goto LABEL_51;
    case 0x13u:
      id v8 = @"Lockdown Mode blocked Home access";
      v9 = @"Firewall HomeKit alert title";
      goto LABEL_51;
    case 0x14u:
      id v8 = @"Lockdown Mode blocked camera access";
      v9 = @"Firewall HomeKit camera alert title";
      goto LABEL_51;
    case 0x15u:
      id v8 = @"Lockdown Mode blocked Home invitation";
      v9 = @"Firewall HomeKit Invite alert title";
      goto LABEL_51;
    case 0x17u:
      id v8 = @"Lockdown Mode blocked Activity Sharing invitation";
      v9 = @"Firewall Activity Sharing alert title";
      goto LABEL_51;
    case 0x18u:
      id v8 = @"Lockdown Mode blocked Game Center chat";
      v9 = @"Firewall Game Center chat alert title";
      goto LABEL_51;
    case 0x19u:
      id v8 = @"Lockdown Mode blocked Game Center invitation";
      v9 = @"Firewall Game Center Invite alert title";
      goto LABEL_51;
    case 0x1Au:
      id v8 = @"Lockdown Mode blocked Game Center multiplayer";
      v9 = @"Firewall Game Center multiplayer alert title";
      goto LABEL_51;
    case 0x1Bu:
      id v8 = @"Lockdown Mode blocked Health Sharing invitation";
      v9 = @"Firewall Health Sharing alert title";
      goto LABEL_51;
    case 0x1Cu:
      id v8 = @"Lockdown Mode blocked Car Key Sharing invitation";
      v9 = @"Firewall Car Key Sharing alert title";
      goto LABEL_51;
    case 0x1Du:
      id v8 = @"Lockdown Mode blocked ETA Sharing";
      v9 = @"Firewall ETA Sharing alert title";
      goto LABEL_51;
    case 0x1Eu:
      id v8 = @"Lockdown Mode blocked AirDrop";
      v9 = @"Firewall AirDrop alert title";
      goto LABEL_51;
    case 0x1Fu:
      id v8 = @"Lockdown Mode blocked Photo Stream Invitation";
      v9 = @"Firewall Photo Stream Invite alert title";
      goto LABEL_51;
    case 0x20u:
      id v8 = @"Lockdown Mode blocked Apple Support";
      v9 = @"Firewall AppleCare Screen Share alert title";
      goto LABEL_51;
    case 0x21u:
      id v8 = @"Lockdown Mode blocked a Device Inquiry";
      v9 = @"Firewall AppleCare Settings Share alert title";
      goto LABEL_51;
    case 0x22u:
      id v8 = @"Lockdown Mode blocked Focus Sharing";
      v9 = @"Firewall StatusKit alert title";
      goto LABEL_51;
    case 0x23u:
      id v8 = @"Lockdown Mode blocked ScreenTime Sharing";
      v9 = @"Firewall ScreenTime alert title";
      goto LABEL_51;
    case 0x24u:
      id v8 = @"Lockdown Mode blocked Freeform";
      v9 = @"Firewall Freeform alert title";
      goto LABEL_51;
    case 0x25u:
      id v8 = @"Lockdown Mode blocked Notes";
      v9 = @"Firewall Notes alert title";
      goto LABEL_51;
    case 0x26u:
      id v8 = @"Lockdown Mode blocked password sharing";
      v9 = @"Firewall Password Sharing alert title";
      goto LABEL_51;
    case 0x27u:
      id v8 = @"Lockdown Mode blocked Safari Tab Group sharing";
      v9 = @"Firewall Safari tab group Sharing alert title";
      goto LABEL_51;
    case 0x28u:
      id v8 = @"Lockdown Mode blocked a shared Apple Music session";
      v9 = @"Firewall Music sharing alert title";
      goto LABEL_51;
    case 0x29u:
      id v8 = @"Lockdown Mode blocked Check In";
      v9 = @"Firewall Check In alert title";
      goto LABEL_51;
    case 0x2Au:
      id v8 = @"Lockdown Mode blocked Name and Photo sharing";
      v9 = @"Firewall Name and Photo sharing alert title";
      goto LABEL_51;
    case 0x2Bu:
      id v8 = @"Lockdown Mode blocked Remote Alarms";
      v9 = @"Firewall Remote Alarm alert title";
      goto LABEL_51;
    case 0x2Cu:
      id v8 = @"Lockdown Mode blocked Contact Key Verification";
      v9 = @"Firewall Key Transparency alert title";
      goto LABEL_51;
    case 0x2Du:
      id v8 = @"Lockdown Mode blocked iMessage";
      v9 = @"Firewall Key iMessage alert title";
      goto LABEL_51;
    default:
LABEL_7:
      id v8 = @"Unknown Communication";
LABEL_8:
      v9 = @"Firewall alert title";
LABEL_51:
      uint64_t v17 = IMLocalizedStringFromTableInBundle(v8, @"IDSFirewallLocalizable", v7, v9);
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      return v18;
  }

- (id)_notificationBodyForService:(id)a3 URI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  switch([v6 firewallNotificationStyle])
  {
    case 0u:
      uint64_t v11 = @"an unknown contact";
      uint64_t v12 = @"Firewall alert body";
      uint64_t v13 = @"Lockdown Mode blocked %@ from contacting you.";
      goto LABEL_55;
    case 1u:
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_1006998E8((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
      }

      uint64_t v21 = IMLocalizedStringFromTableInBundle( @"%@ is trying to contact you on %@. Communication was dropped.",  @"IDSFirewallLocalizable",  v10,  @"Firewall alert body");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v7 unprefixedURI]);
      uint64_t v24 = IMFormattedDisplayStringForID(v23, 0LL);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v22,  v25,  v26));

      goto LABEL_65;
    case 2u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall iCloud alert body";
      uint64_t v13 = @"%@ attempted to collaborate using iCloud.";
      goto LABEL_55;
    case 3u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall ApplePay request alert body";
      uint64_t v13 = @"%@ attempted to request or send a payment.";
      goto LABEL_55;
    case 4u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall ApplePay sharing alert body";
      uint64_t v13 = @"%@ attempted to share Apple Card or transaction information.";
      goto LABEL_55;
    case 5u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall SharePlay alert body";
      uint64_t v13 = @"%@ attempted to SharePlay Music.";
      goto LABEL_55;
    case 6u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Firewall FaceTime alert body";
      uint64_t v13 = @"%@ attempted to FaceTime.";
      goto LABEL_55;
    case 7u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall FaceTime Audio alert body";
      uint64_t v13 = @"%@ attempted to FaceTime Audio call.";
      goto LABEL_55;
    case 8u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall FaceTime Messaging alert body";
      uint64_t v13 = @"%@ attempted to send a FaceTime Video Message.";
      goto LABEL_55;
    case 9u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall FaceTime Live Photos alert body";
      uint64_t v13 = @"%@ attempted to share a FaceTime Live Photo.";
      goto LABEL_55;
    case 0xAu:
      v28 = @"Someone attempted to send Intercom message from HomePod.";
      v29 = @"Firewall HomePod Drop-In alert body";
      goto LABEL_44;
    case 0xBu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Screen Sharing alert body";
      uint64_t v13 = @"%@ attempted to screen share with you.";
      goto LABEL_55;
    case 0xCu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Firewall Walkie-Talkie alert body";
      uint64_t v13 = @"%@ invited you to Walkie-Talkie.";
      goto LABEL_55;
    case 0xDu:
      v28 = @"A teacher attempted to send a command using Classroom.";
      v29 = @"Firewall Classroom alert body";
      goto LABEL_44;
    case 0xEu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall iTunes Purchase Request alert body";
      uint64_t v13 = @"%@ attempted to request purchase authorization.";
      goto LABEL_55;
    case 0xFu:
      v28 = @"Someone attempted to use FindMy to locate an AirTag near you.";
      v29 = @"Firewall Find My Device alert body";
      goto LABEL_44;
    case 0x10u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Location Sharing alert body";
      uint64_t v13 = @"%@ invited you to share your location.";
      goto LABEL_55;
    case 0x11u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall FindMy Item Sharing alert body";
      uint64_t v13 = @"%@ attempted to share an item using Find My.";
      goto LABEL_55;
    case 0x12u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall GroupKit alert body";
      uint64_t v13 = @"%@ attempted to set up a share with you.";
      goto LABEL_55;
    case 0x13u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall HomeKit alert body";
      uint64_t v13 = @"%@ attempted to access a Home.";
      goto LABEL_55;
    case 0x14u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall HomeKit camera alert body";
      uint64_t v13 = @"%@ attempted to access a camera.";
      goto LABEL_55;
    case 0x15u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall HomeKit Invite alert body";
      uint64_t v13 = @"%@ attempted to invite you to a Home.";
      goto LABEL_55;
    case 0x16u:
      v28 = @"Someone attempted to send Intercom message from HomePod.";
      v29 = @"Firewall Intercom alert body";
      goto LABEL_44;
    case 0x17u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Activity Sharing alert body";
      uint64_t v13 = @"%@ invited you to share your Fitness Activity.";
      goto LABEL_55;
    case 0x18u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Game Center chat alert body";
      uint64_t v13 = @"%@ attempted to start a Game Center chat.";
      goto LABEL_55;
    case 0x19u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Game Center Invite alert body";
      uint64_t v13 = @"%@ invited you to play a game.";
      goto LABEL_55;
    case 0x1Au:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Game Center multiplayer alert body";
      uint64_t v13 = @"%@ attempted to start a Game Center multiplayer game";
      goto LABEL_55;
    case 0x1Bu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Health Sharing alert body";
      uint64_t v13 = @"%@ invited you to share your health data.";
      goto LABEL_55;
    case 0x1Cu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Car Key Sharing alert body";
      uint64_t v13 = @"%@ invited you to share your Car Key.";
      goto LABEL_55;
    case 0x1Du:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall ETA Sharing alert body";
      uint64_t v13 = @"%@ attempted to share their ETA with you.";
      goto LABEL_55;
    case 0x1Eu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall AirDrop alert body";
      uint64_t v13 = @"%@ attempted to share something using AirDrop.";
      goto LABEL_55;
    case 0x1Fu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Photo Stream Invite alert body";
      uint64_t v13 = @"%@ invited you to a Shared Photo Stream.";
      goto LABEL_55;
    case 0x20u:
      v28 = @"An Apple Support Advisor tried to gather your settings or view your screen at your request.";
      v29 = @"Firewall AppleCare Screen Share alert body";
      goto LABEL_44;
    case 0x21u:
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[FTDeviceSupport sharedInstance](&OBJC_CLASS___FTDeviceSupport, "sharedInstance"));
      id v31 = [v30 deviceType];

      if (v31 == (id)4)
      {
        v28 = @"An AppleCare advisor attempted to gather information about your iPad.";
        v29 = @"Firewall AppleCare Settings Share alert body for iPad";
      }

      else if (v31 == (id)2)
      {
        v28 = @"An AppleCare advisor attempted to gather information about your iPhone.";
        v29 = @"Firewall AppleCare Settings Share alert body for iPhone";
      }

      else if (v31 == (id)1)
      {
        v28 = @"An AppleCare advisor attempted to gather information about your Mac.";
        v29 = @"Firewall AppleCare Settings Share alert body for Mac";
      }

      else
      {
        v28 = @"An AppleCare advisor attempted to gather information about your device.";
        v29 = @"Firewall AppleCare Settings Share alert body default";
      }

      goto LABEL_44;
    case 0x22u:
      v28 = @"Your Focus is not visible to people who contact you or in apps while Lockdown Mode is turned on.";
      v29 = @"Firewall StatusKit alert body";
      goto LABEL_44;
    case 0x23u:
      v28 = @"Your ScreenTime details won’t be shared with other people because Lockdown Mode is enabled.";
      v29 = @"Firewall ScreenTime alert body";
LABEL_44:
      uint64_t v32 = IMLocalizedStringFromTableInBundle(v28, @"IDSFirewallLocalizable", v10, v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v32);
      goto LABEL_65;
    case 0x24u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Freeform alert body";
      uint64_t v13 = @"%@ attempted to collaborate with you using Freeform.";
      goto LABEL_55;
    case 0x25u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Notes alert body";
      uint64_t v13 = @"%@ attempted to collaborate with you using Notes.";
      goto LABEL_55;
    case 0x26u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Password Sharing alert body";
      uint64_t v13 = @"%@ attempted to share a password or passkey.";
      goto LABEL_55;
    case 0x27u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Safari tab group Sharing alert body";
      uint64_t v13 = @"%@ attempted to share a Safari Tab Group.";
      goto LABEL_55;
    case 0x28u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Music Sharing alert body";
      uint64_t v13 = @"%@ attempted to share control of Apple Music.";
      goto LABEL_55;
    case 0x29u:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Check In alert body";
      uint64_t v13 = @"%@ attempted to start a Check In.";
      goto LABEL_55;
    case 0x2Au:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Name and Photo sharing alert body";
      uint64_t v13 = @"%@ attempted to share their Name and Photo.";
      goto LABEL_55;
    case 0x2Bu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Remote Alarms alert body";
      uint64_t v13 = @"%@ attempted to access an alarm or timer.";
      goto LABEL_55;
    case 0x2Cu:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Key Transparency alert body";
      uint64_t v13 = @"%@ attempted to share a Contact Key Verification.";
      goto LABEL_55;
    case 0x2Du:
      uint64_t v11 = @"An unknown contact";
      uint64_t v12 = @"Firewall Key iMessage alert body";
      uint64_t v13 = @"%@ attempted to send an iMessage.";
      goto LABEL_55;
    default:
      uint64_t v13 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v11 = @"An unknown contact";
LABEL_55:
      if ([v7 FZIDType] == (id)5)
      {
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Overriding URI %@ for pseudonym",  buf,  0xCu);
        }

        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v13,  v11));
        uint64_t v34 = IMLocalizedStringFromTableInBundle(v13, @"IDSFirewallLocalizable", v10, v12);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v34);
      }

      else
      {
        uint64_t v35 = objc_claimAutoreleasedReturnValue( -[IDSContactsUtilities nameForContactMatchingURI:]( self->_contactUtilities,  "nameForContactMatchingURI:",  v7));
        if (v35)
        {
          v36 = (void *)v35;
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v43 = v7;
            __int16 v44 = 2112;
            v45 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Overriding URI %@ with contact name %@",  buf,  0x16u);
          }
        }

        else
        {
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 unprefixedURI]);
          uint64_t v38 = IMFormattedDisplayStringForID(v37, 0LL);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v38);
        }

        uint64_t v39 = IMLocalizedStringFromTableInBundle(v13, @"IDSFirewallLocalizable", v10, v12);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v40,  v36));
      }

LABEL_65:
      return v27;
  }

- (id)_notificationIconIdentifierForService:(id)a3
{
  id v3 = a3;
  id v4 = @"com.apple.Preferences";
  switch([v3 firewallNotificationStyle])
  {
    case 1u:
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_1006998E8((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
      }

      id v4 = @"com.apple.Preferences";
      break;
    case 2u:
      id v4 = @"Collaboration%@";
      break;
    case 3u:
    case 4u:
    case 0x1Cu:
      id v4 = @"com.apple.Passbook";
      break;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      id v4 = @"com.apple.facetime";
      break;
    case 0xAu:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x2Bu:
      id v4 = @"com.apple.Home";
      break;
    case 0xBu:
    case 0x20u:
      id v4 = @"Screen Sharing%@";
      break;
    case 0xDu:
      id v4 = @"Classroom%@";
      break;
    case 0xEu:
      id v4 = @"com.apple.MobileStore";
      break;
    case 0xFu:
    case 0x10u:
    case 0x11u:
      id v4 = @"com.apple.findmy";
      break;
    case 0x17u:
      id v4 = @"Fitness%@";
      break;
    case 0x18u:
    case 0x19u:
    case 0x1Au:
      id v4 = @"Game Center%@";
      break;
    case 0x1Bu:
      id v4 = @"Health%@";
      break;
    case 0x1Du:
      id v4 = @"com.apple.Maps";
      break;
    case 0x1Eu:
      id v4 = @"com.apple.AirDropUIRemoteNotification";
      break;
    case 0x1Fu:
      id v4 = @"Photos%@";
      break;
    case 0x21u:
      id v4 = @"Apple Care%@";
      break;
    case 0x22u:
      id v4 = @"Focus%@";
      break;
    case 0x23u:
      id v4 = @"Screen Time%@";
      break;
    case 0x24u:
      id v4 = @"Freeform%@";
      break;
    case 0x25u:
      id v4 = @"Notes%@";
      break;
    case 0x27u:
      id v4 = @"Safari%@";
      break;
    case 0x28u:
      id v4 = @"Music%@";
      break;
    case 0x2Du:
      id v4 = @"com.apple.MobileSMS";
      break;
    default:
      break;
  }

  return (id)v4;
}

- (void)postNotificationForURI:(id)a3 onService:(id)a4 shouldRateLimit:(BOOL)a5 command:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Told to post firewall notification {uri: %@}",  buf,  0xCu);
  }

  if ([v11 firewallNotificationStyle] == 1)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not posting firewall notification because service has a notification style of none {uri: %@, service: %@}",  buf,  0x16u);
    }
  }

  else if ((IDSCommandIsUserInteractiveCommand(v12) & 1) != 0)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSFirewallNotificationCenter _rateLimitingKeyForURI:service:]( self,  "_rateLimitingKeyForURI:service:",  v10,  v11));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter _rateLimiterForService:](self, "_rateLimiterForService:", v11));
    uint64_t v17 = v16;
    if (v7 && ([v16 underLimitForItem:v14] & 1) == 0)
    {
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Not posting firewall notification because we are over limit {uri: %@}",  buf,  0xCu);
      }
    }

    else
    {
      uint64_t v24 = v17;
      if (-[IDSFirewallNotificationCenter _notificationShouldRedirect](self, "_notificationShouldRedirect"))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter _notificationSupportURL](self, "_notificationSupportURL"));
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v18));
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSFirewallNotificationCenter notificationCenter](self, "notificationCenter"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSFirewallNotificationCenter _notificationTitleForService:]( self,  "_notificationTitleForService:",  v11));
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSFirewallNotificationCenter _notificationBodyForService:URI:]( self,  "_notificationBodyForService:URI:",  v11,  v10));
      v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSFirewallNotificationCenter _notificationIconIdentifierForService:]( self,  "_notificationIconIdentifierForService:",  v11));
      [v20 postNotificationWithTitle:v21 body:v22 iconIdentifier:v23 shouldShowSubordinateIcon:1 actionURL:v19];

      uint64_t v17 = v24;
      if (v7) {
        [v24 noteItem:v14];
      }
    }
  }

  else
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Not posting firewall notification because command is not initiated by the user {uri: %@, command: %@}",  buf,  0x16u);
    }
  }
}

- (IDSUserNotificationsCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (IDSContactsUtilities)contactUtilities
{
  return self->_contactUtilities;
}

- (void)setContactUtilities:(id)a3
{
}

- (IDSRateLimiter)firewallRateLimiter
{
  return self->_firewallRateLimiter;
}

- (void)setFirewallRateLimiter:(id)a3
{
}

- (IDSRateLimiter)firewallAggressiveRateLimiter
{
  return self->_firewallAggressiveRateLimiter;
}

- (void)setFirewallAggressiveRateLimiter:(id)a3
{
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end