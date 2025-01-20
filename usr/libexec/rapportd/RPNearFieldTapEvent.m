@interface RPNearFieldTapEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isKnownIdentity;
- (BOOL)isSameAccount;
- (BOOL)isUnsupportedApplicationLabel;
- (BOOL)shouldForceSingleBandAWDLMode;
- (NSData)pkData;
- (NSDate)date;
- (NSString)accountID;
- (NSString)applicationDomain;
- (NSString)applicationLabel;
- (NSString)contactID;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)identifier;
- (NSUUID)bonjourListenerUUID;
- (RPNearFieldTapEvent)initWithCoder:(id)a3;
- (RPNearFieldTapEvent)initWithIdentifier:(id)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 isSameAccount:(BOOL)a7 contactID:(id)a8 accountID:(id)a9 forceSingleBandAWDLMode:(BOOL)a10 knownIdentity:(BOOL)a11 isUnsupportedApplicationLabel:(BOOL)a12 flags:(unsigned int)a13;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setContactID:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation RPNearFieldTapEvent

- (RPNearFieldTapEvent)initWithIdentifier:(id)a3 applicationLabel:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6 isSameAccount:(BOOL)a7 contactID:(id)a8 accountID:(id)a9 forceSingleBandAWDLMode:(BOOL)a10 knownIdentity:(BOOL)a11 isUnsupportedApplicationLabel:(BOOL)a12 flags:(unsigned int)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a8;
  id v24 = a9;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___RPNearFieldTapEvent;
  v25 = -[RPNearFieldTapEvent init](&v39, "init");
  if (v25)
  {
    v26 = (NSString *)[v19 copy];
    identifier = v25->_identifier;
    v25->_identifier = v26;

    v28 = (NSString *)[v20 copy];
    applicationLabel = v25->_applicationLabel;
    v25->_applicationLabel = v28;

    v30 = (NSData *)[v21 copy];
    pkData = v25->_pkData;
    v25->_pkData = v30;

    objc_storeStrong((id *)&v25->_bonjourListenerUUID, a6);
    v25->_isSameAccount = a7;
    v32 = (NSString *)[v23 copy];
    contactID = v25->_contactID;
    v25->_contactID = v32;

    v34 = (NSString *)[v24 copy];
    accountID = v25->_accountID;
    v25->_accountID = v34;

    v25->_shouldForceSingleBandAWDLMode = a10;
    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    date = v25->_date;
    v25->_date = (NSDate *)v36;

    v25->_isKnownIdentity = a11;
    v25->_isUnsupportedApplicationLabel = a12;
    v25->_flags = a13;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearFieldTapEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___RPNearFieldTapEvent;
  v5 = -[RPNearFieldTapEvent init](&v59, "init");
  v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  p_identifier = &v5->_identifier;
  id v8 = v4;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v9, v10);
  NSDecodeObjectIfPresent(v8, @"identifier", v11, &v6->_identifier);

  id v12 = v8;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v13, v14);
  NSDecodeObjectIfPresent(v12, @"appLabel", v15, &v6->_applicationLabel);

  id v16 = v12;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData, v17, v18);
  NSDecodeObjectIfPresent(v16, @"pkDataKey", v19, &v6->_pkData);

  id v20 = v16;
  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDate, v21, v22);
  NSDecodeObjectIfPresent(v20, @"date", v23, &v6->_date);

  id v24 = v20;
  id v25 = v24;
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSString, v26, v27);
  NSDecodeObjectIfPresent(v25, @"deviceName", v28, &v6->_deviceName);

  id v29 = v25;
  uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v30, v31);
  NSDecodeObjectIfPresent(v29, @"deviceModel", v32, &v6->_deviceModel);

  id v33 = v29;
  uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSString, v34, v35);
  NSDecodeObjectIfPresent(v33, @"accountID", v36, &v6->_accountID);

  id v37 = v33;
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString, v38, v39);
  NSDecodeObjectIfPresent(v37, @"contactID", v40, &v6->_contactID);

  id v41 = v37;
  uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSUUID, v42, v43);
  NSDecodeObjectIfPresent(v41, @"bonjourListenerUUIDKey", v44, &v6->_bonjourListenerUUID);

  id v45 = v41;
  if ([v45 containsValueForKey:@"forceSingleBand"]) {
    v6->_shouldForceSingleBandAWDLMode = [v45 decodeBoolForKey:@"forceSingleBand"];
  }

  id v46 = v45;
  id v47 = v46;
  if ([v47 containsValueForKey:@"isUnsupportedApplicationLabel"]) {
    v6->_isUnsupportedApplicationLabel = [v47 decodeBoolForKey:@"isUnsupportedApplicationLabel"];
  }

  if (!*p_identifier || !v6->_applicationLabel || !v6->_date)
  {
    id v55 = RPErrorF( 4294960591LL,  (uint64_t)"Decode NearFieldTap with missing parameter",  v48,  v49,  v50,  v51,  v52,  v53,  v58);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    [v47 failWithError:v56];

LABEL_17:
    v54 = 0LL;
    goto LABEL_18;
  }

  v54 = v6;
LABEL_18:

  return v54;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v15 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v15;
  }

  applicationLabel = self->_applicationLabel;
  if (applicationLabel)
  {
    [v15 encodeObject:applicationLabel forKey:@"appLabel"];
    id v4 = v15;
  }

  pkData = self->_pkData;
  if (pkData)
  {
    [v15 encodeObject:pkData forKey:@"pkDataKey"];
    id v4 = v15;
  }

  date = self->_date;
  if (date)
  {
    [v15 encodeObject:date forKey:@"date"];
    id v4 = v15;
  }

  if (self->_isSameAccount)
  {
    [v15 encodeBool:1 forKey:@"isSameAccount"];
    id v4 = v15;
  }

  deviceName = self->_deviceName;
  if (deviceName)
  {
    [v15 encodeObject:deviceName forKey:@"deviceName"];
    id v4 = v15;
  }

  deviceModel = self->_deviceModel;
  if (deviceModel)
  {
    [v15 encodeObject:deviceModel forKey:@"deviceModel"];
    id v4 = v15;
  }

  accountID = self->_accountID;
  if (accountID)
  {
    [v15 encodeObject:accountID forKey:@"accountID"];
    id v4 = v15;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    [v15 encodeObject:contactID forKey:@"contactID"];
    id v4 = v15;
  }

  bonjourListenerUUID = self->_bonjourListenerUUID;
  if (bonjourListenerUUID)
  {
    [v15 encodeObject:bonjourListenerUUID forKey:@"bonjourListenerUUIDKey"];
    id v4 = v15;
  }

  if (self->_shouldForceSingleBandAWDLMode)
  {
    [v15 encodeBool:1 forKey:@"forceSingleBand"];
    id v4 = v15;
  }

  if (self->_isKnownIdentity)
  {
    [v15 encodeBool:1 forKey:@"knownIdentity"];
    id v4 = v15;
  }

  if (self->_isUnsupportedApplicationLabel)
  {
    [v15 encodeBool:1 forKey:@"isUnsupportedApplicationLabel"];
    id v4 = v15;
  }

  uint64_t flags = self->_flags;
  if ((_DWORD)flags)
  {
    [v15 encodeInt64:flags forKey:@"flags"];
    id v4 = v15;
  }
}

- (id)description
{
  return -[RPNearFieldTapEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v21 = 0LL;
  NSAppendPrintF( &v21,  "RPNearFieldTap ID %{mask}, appLabel %@, appDomain %@, date %@ sameAccount %d CNID %@",  *(void *)&a3,  self->_identifier,  self->_applicationLabel,  self->_applicationDomain,  self->_date,  self->_isSameAccount,  self->_contactID);
  id v4 = v21;
  v5 = v4;
  uint64_t flags = self->_flags;
  if ((_DWORD)flags)
  {
    id v20 = v4;
    NSAppendPrintF(&v20, ", flags  %#{flags}", flags, &unk_10010B496);
    id v7 = v20;

    v5 = v7;
  }

  id v19 = v5;
  NSAppendPrintF(&v19, ", pkData <%.3@> %d B", self->_pkData, -[NSData length](self->_pkData, "length"));
  id v8 = v19;

  id v18 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_bonjourListenerUUID, "UUIDString"));
  NSAppendPrintF(&v18, ", bonjourUUID '%{mask}'", v9);
  id v10 = v18;

  id v17 = v10;
  NSAppendPrintF(&v17, ", forceSingleBand '%d'", self->_shouldForceSingleBandAWDLMode);
  id v11 = v17;

  id v16 = v11;
  NSAppendPrintF(&v16, ", isKnownIdentity '%d'", self->_isKnownIdentity);
  id v12 = v16;

  id v15 = v12;
  NSAppendPrintF(&v15, ", isUnsupportedApplicationLabel '%d'", self->_isUnsupportedApplicationLabel);
  id v13 = v15;

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)applicationDomain
{
  return self->_applicationDomain;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (NSDate)date
{
  return self->_date;
}

- (unsigned)flags
{
  return self->_flags;
}

- (BOOL)isSameAccount
{
  return self->_isSameAccount;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (BOOL)shouldForceSingleBandAWDLMode
{
  return self->_shouldForceSingleBandAWDLMode;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (BOOL)isUnsupportedApplicationLabel
{
  return self->_isUnsupportedApplicationLabel;
}

- (void).cxx_destruct
{
}

@end