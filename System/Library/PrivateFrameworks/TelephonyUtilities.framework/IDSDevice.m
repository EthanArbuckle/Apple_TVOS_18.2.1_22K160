@interface IDSDevice
+ (BOOL)isDeviceInAltMode;
+ (BOOL)pairedDeviceUniqueIDOverrideExists;
+ (id)pairedDeviceUniqueIDOverride;
- (BOOL)canReceiveMessagesForCallProvider:(id)a3;
- (BOOL)canReceiveRelayedCalls;
- (BOOL)canReceiveRelayedGFTCalls;
- (BOOL)isAudioAccessoryDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPairedDevice;
- (BOOL)isWatchDevice;
- (BOOL)supportsRelayCallingWithoutLocalRelayCallingEnabled;
- (BOOL)supportsRestrictingSecondaryCalling;
- (NSArray)csd_aliasStrings;
- (NSString)csd_localizedDeviceCategory;
- (id)csd_destinationForAlias:(id)a3;
- (id)normalizedDeviceType;
@end

@implementation IDSDevice

- (id)normalizedDeviceType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](self, "modelIdentifier"));
  if ([v2 rangeOfString:@"iPod"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v2 rangeOfString:@"iPad"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v2 rangeOfString:@"iPhone"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v2 rangeOfString:@"Mac"] == (id)0x7FFFFFFFFFFFFFFFLL) {
          v3 = &stru_1003E7718;
        }
        else {
          v3 = @"MAC";
        }
      }

      else
      {
        v3 = @"IPHONE";
      }
    }

    else
    {
      v3 = @"IPAD";
    }
  }

  else
  {
    v3 = @"IPOD";
  }

  if (!-[__CFString length](v3, "length"))
  {
    id v4 = sub_1001704C4();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[WARN] Couldn't identify device type based on model identifier (%@)",  (uint8_t *)&v7,  0xCu);
    }
  }

  return v3;
}

- (NSString)csd_localizedDeviceCategory
{
  id v2 = -[IDSDevice deviceType](self, "deviceType");
  id v4 = 0LL;
  switch((unint64_t)v2)
  {
    case 1uLL:
      uint64_t v5 = TUBundle(v2, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      int v7 = v6;
      v8 = @"MAC";
      goto LABEL_7;
    case 2uLL:
      uint64_t v9 = TUBundle(v2, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v7 = v6;
      v8 = @"IPHONE";
      goto LABEL_7;
    case 3uLL:
      uint64_t v10 = TUBundle(v2, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v7 = v6;
      v8 = @"IPOD";
      goto LABEL_7;
    case 4uLL:
      uint64_t v11 = TUBundle(v2, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v7 = v6;
      v8 = @"IPAD";
      goto LABEL_7;
    case 9uLL:
      uint64_t v12 = TUBundle(v2, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v7 = v6;
      v8 = @"VISIONPRO";
LABEL_7:
      id v4 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:v8 value:&stru_1003E7718 table:@"TelephonyUtilities"]);

      break;
    default:
      return (NSString *)v4;
  }

  return (NSString *)v4;
}

- (NSArray)csd_aliasStrings
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice identities](self, "identities"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "__imArrayByApplyingBlock:", &stru_1003DBB10));

  return (NSArray *)v3;
}

- (id)csd_destinationForAlias:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice pushToken](self, "pushToken"));
  v6 = (void *)IDSCopyBestGuessIDForID(v4);

  int v7 = (void *)IDSCopyIDForTokenWithID(v5, v6);
  return v7;
}

+ (id)pairedDeviceUniqueIDOverride
{
  if (qword_10044D150 != -1) {
    dispatch_once(&qword_10044D150, &stru_1003DC1B8);
  }
  return (id)qword_10044D148;
}

+ (BOOL)pairedDeviceUniqueIDOverrideExists
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 pairedDeviceUniqueIDOverride]);
  BOOL v3 = v2 != 0LL;

  return v3;
}

+ (BOOL)isDeviceInAltMode
{
  return 0;
}

- (BOOL)isPairedDevice
{
  if (-[IDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice")
    && (-[IDSDevice isConnected](self, "isConnected") & 1) != 0)
  {
    return 1;
  }

  id v5 = objc_msgSend((id)objc_opt_class(self, v3), "pairedDeviceUniqueIDOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self, "uniqueIDOverride"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (BOOL)isWatchDevice
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](self, "modelIdentifier"));
  unsigned __int8 v3 = [v2 hasPrefix:@"Watch"];

  return v3;
}

- (BOOL)isAudioAccessoryDevice
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice modelIdentifier](self, "modelIdentifier"));
  unsigned __int8 v3 = [v2 hasPrefix:@"AudioAccessory"];

  return v3;
}

- (BOOL)supportsRestrictingSecondaryCalling
{
  if (-[IDSDevice isWatchDevice](self, "isWatchDevice")) {
    return 0;
  }
  else {
    return !-[IDSDevice isAudioAccessoryDevice](self, "isAudioAccessoryDevice");
  }
}

- (BOOL)supportsRelayCallingWithoutLocalRelayCallingEnabled
{
  if (-[IDSDevice isPairedDevice](self, "isPairedDevice")) {
    return 1;
  }
  else {
    return -[IDSDevice isAudioAccessoryDevice](self, "isAudioAccessoryDevice");
  }
}

- (BOOL)canReceiveRelayedCalls
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self, "uniqueIDOverride"));
  if ((+[TUCallCapabilities isRelayCallingEnabledForDeviceWithID:]( &OBJC_CLASS___TUCallCapabilities,  "isRelayCallingEnabledForDeviceWithID:",  v3) & 1) != 0) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = !-[IDSDevice supportsRestrictingSecondaryCalling](self, "supportsRestrictingSecondaryCalling");
  }

  if (-[IDSDevice supportsRelayCallingWithoutLocalRelayCallingEnabled]( self,  "supportsRelayCallingWithoutLocalRelayCallingEnabled"))
  {
    unsigned __int8 v5 = +[TUCallCapabilities areRelayCallingFeaturesEnabled]( &OBJC_CLASS___TUCallCapabilities,  "areRelayCallingFeaturesEnabled");
    if (!v4) {
      return 0;
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
    if (!v4) {
      return 0;
    }
  }

  return +[TUCallCapabilities isRelayCallingEnabled]( &OBJC_CLASS___TUCallCapabilities,  "isRelayCallingEnabled") | v5;
}

- (BOOL)canReceiveRelayedGFTCalls
{
  if (!-[IDSDevice canReceiveRelayedCalls](self, "canReceiveRelayedCalls")) {
    return 0;
  }
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice capabilities](self, "capabilities"));
  BOOL v4 = [v3 valueForCapability:IDSRegistrationPropertySupportsGFTRelay] != 0;

  return v4;
}

- (BOOL)canReceiveMessagesForCallProvider:(id)a3
{
  id v4 = a3;
  if (([v4 isTelephonyProvider] & 1) != 0
    || [v4 isFaceTimeProvider]
    && (-[IDSDevice isPairedDevice](self, "isPairedDevice")
     || -[IDSDevice isAudioAccessoryDevice](self, "isAudioAccessoryDevice")))
  {
    BOOL v5 = -[IDSDevice canReceiveRelayedCalls](self, "canReceiveRelayedCalls");
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self, "uniqueIDOverride"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIDOverride]);

    unsigned __int8 v10 = [v8 isEqualToString:v9];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

@end