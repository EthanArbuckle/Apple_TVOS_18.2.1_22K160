@interface RPIdentity
+ (BOOL)supportsSecureCoding;
+ (id)nullIdentity;
- (BOOL)disabled;
- (BOOL)present;
- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6;
- (BOOL)userAdded;
- (BOOL)verifyAuthTag:(id)a3 data:(id)a4 type:(int)a5 error:(id *)a6;
- (BOOL)verifyAuthTagPtr:(const void *)a3 authTagLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 type:(int)a7 error:(id *)a8;
- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7;
- (NSArray)accessGroups;
- (NSArray)allUsedSendersKnownAliases;
- (NSData)btAddress;
- (NSData)btIRKData;
- (NSData)deviceIRKData;
- (NSData)edPKData;
- (NSData)edSKData;
- (NSDate)dateAcknowledged;
- (NSDate)dateAdded;
- (NSDate)dateRemoved;
- (NSDate)dateRequested;
- (NSDictionary)acl;
- (NSString)accountAltDSID;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsDeviceID;
- (NSString)mediaRemoteID;
- (NSString)mediaRouteID;
- (NSString)model;
- (NSString)name;
- (NSString)sendersKnownAlias;
- (NSUUID)homeKitUserIdentifier;
- (RPIdentity)initWithCoder:(id)a3;
- (RPIdentity)initWithPairedPeer:(id)a3 type:(int)a4;
- (RPIdentity)initWithType:(int)a3;
- (id)authTagForData:(id)a3 type:(int)a4 error:(id *)a5;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)signData:(id)a3 error:(id *)a4;
- (int)type;
- (unint64_t)disabledUntilTicks;
- (unint64_t)featureFlags;
- (unsigned)compareWithRPIdentity:(id)a3;
- (unsigned)revisionID;
- (unsigned)updateWithKeychainItem:(id)a3 error:(id *)a4;
- (unsigned)updateWithRPMessage:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessGroups:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAcl:(id)a3;
- (void)setAllUsedSendersKnownAliases:(id)a3;
- (void)setBtAddress:(id)a3;
- (void)setBtIRKData:(id)a3;
- (void)setContactID:(id)a3;
- (void)setDateAcknowledged:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setDateRemoved:(id)a3;
- (void)setDateRequested:(id)a3;
- (void)setDeviceIRKData:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledUntilTicks:(unint64_t)a3;
- (void)setEdPKData:(id)a3;
- (void)setEdSKData:(id)a3;
- (void)setFeatureFlags:(unint64_t)a3;
- (void)setHomeKitUserIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setMediaRemoteID:(id)a3;
- (void)setMediaRouteID:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPresent:(BOOL)a3;
- (void)setRevisionID:(unsigned int)a3;
- (void)setSendersKnownAlias:(id)a3;
- (void)setType:(int)a3;
- (void)setUserAdded:(BOOL)a3;
@end

@implementation RPIdentity

+ (id)nullIdentity
{
  if (nullIdentity_sOnce != -1) {
    dispatch_once(&nullIdentity_sOnce, &__block_literal_global_8);
  }
  return (id)nullIdentity_sObj;
}

void __26__RPIdentity_nullIdentity__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
  v1 = (void *)nullIdentity_sObj;
  nullIdentity_sObj = (uint64_t)v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___RPIdentity;
  v5 = -[RPIdentity init](&v25, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_opt_class();
    NSDecodeNSDictionaryOfClassesIfPresent();
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v19 = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v20 = v19;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v21 = v20;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v22 = v21;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v23 = v5;
  }

  return v5;
}

- (RPIdentity)initWithType:(int)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPIdentity;
  id v4 = -[RPIdentity init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    if ((a3 & 0xFFFFFFFB) == 0xA)
    {
      cced25519_make_key_pair_compat();
      uint64_t v6 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:v14 length:32];
      edPKData = v5->_edPKData;
      v5->_edPKData = (NSData *)v6;

      uint64_t v8 = [MEMORY[0x189603F48] _newZeroingDataWithBytes:__s length:32];
      edSKData = v5->_edSKData;
      v5->_edSKData = (NSData *)v8;

      memset_s(__s, 0x20uLL, 0, 0x20uLL);
    }

    id v10 = v5;
  }

  return v5;
}

- (RPIdentity)initWithPairedPeer:(id)a3 type:(int)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RPIdentity;
  id v7 = -[RPIdentity init](&v28, sel_init);
  if (v7)
  {
    [v6 identifier];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_type = a4;
    uint64_t v11 = [v6 altIRK];
    deviceIRKData = v7->_deviceIRKData;
    v7->_deviceIRKData = (NSData *)v11;

    uint64_t v13 = [v6 publicKey];
    edPKData = v7->_edPKData;
    v7->_edPKData = (NSData *)v13;

    [v6 identifier];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 UUIDString];
    idsDeviceID = v7->_idsDeviceID;
    v7->_idsDeviceID = (NSString *)v16;

    uint64_t v18 = [v6 model];
    model = v7->_model;
    v7->_model = (NSString *)v18;

    uint64_t v20 = [v6 name];
    name = v7->_name;
    v7->_name = (NSString *)v20;

    uint64_t v22 = [v6 acl];
    acl = v7->_acl;
    v7->_acl = (NSDictionary *)v22;

    [v6 info];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 valueForKey:@"RPIdentityFeatureFlags"];
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25) {
      v7->_featureFlags = [v25 unsignedLongValue];
    }
    uint64_t v26 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  acl = self->_acl;
  id v27 = v4;
  if (acl)
  {
    [v4 encodeObject:acl forKey:@"acl"];
    id v4 = v27;
  }

  accessGroups = self->_accessGroups;
  if (accessGroups)
  {
    [v27 encodeObject:accessGroups forKey:@"ag"];
    id v4 = v27;
  }

  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    [v27 encodeObject:accountAltDSID forKey:@"altDSID"];
    id v4 = v27;
  }

  accountID = self->_accountID;
  if (accountID)
  {
    [v27 encodeObject:accountID forKey:@"aid"];
    id v4 = v27;
  }

  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  if (allUsedSendersKnownAliases)
  {
    [v27 encodeObject:allUsedSendersKnownAliases forKey:@"allSKAs"];
    id v4 = v27;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    [v27 encodeObject:contactID forKey:@"cnid"];
    id v4 = v27;
  }

  deviceIRKData = self->_deviceIRKData;
  if (deviceIRKData)
  {
    [v27 encodeObject:deviceIRKData forKey:@"dIRK"];
    id v4 = v27;
  }

  edPKData = self->_edPKData;
  if (edPKData)
  {
    [v27 encodeObject:edPKData forKey:@"edPK"];
    id v4 = v27;
  }

  edSKData = self->_edSKData;
  if (edSKData)
  {
    [v27 encodeObject:edSKData forKey:@"edSK"];
    id v4 = v27;
  }

  unint64_t featureFlags = self->_featureFlags;
  if (featureFlags)
  {
    [v27 encodeInt64:featureFlags forKey:@"ff"];
    id v4 = v27;
  }

  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier)
  {
    [v27 encodeObject:homeKitUserIdentifier forKey:@"hkUID"];
    id v4 = v27;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v27 encodeObject:identifier forKey:@"id"];
    id v4 = v27;
  }

  idsDeviceID = self->_idsDeviceID;
  if (idsDeviceID)
  {
    [v27 encodeObject:idsDeviceID forKey:@"idsD"];
    id v4 = v27;
  }

  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    [v27 encodeObject:mediaRemoteID forKey:@"MRI"];
    id v4 = v27;
  }

  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    [v27 encodeObject:mediaRouteID forKey:@"MRtI"];
    id v4 = v27;
  }

  model = self->_model;
  if (model)
  {
    [v27 encodeObject:model forKey:@"md"];
    id v4 = v27;
  }

  name = self->_name;
  if (name)
  {
    [v27 encodeObject:name forKey:@"nm"];
    id v4 = v27;
  }

  uint64_t revisionID = self->_revisionID;
  if ((_DWORD)revisionID)
  {
    [v27 encodeInt64:revisionID forKey:@"rev"];
    id v4 = v27;
  }

  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    [v27 encodeObject:sendersKnownAlias forKey:@"ska"];
    id v4 = v27;
  }

  btIRKData = self->_btIRKData;
  if (btIRKData)
  {
    [v27 encodeObject:btIRKData forKey:@"bIRK"];
    id v4 = v27;
  }

  btAddress = self->_btAddress;
  if (btAddress)
  {
    [v27 encodeObject:btAddress forKey:@"bAdd"];
    id v4 = v27;
  }

  uint64_t type = self->_type;
  if ((_DWORD)type)
  {
    [v27 encodeInteger:type forKey:@"ty"];
    id v4 = v27;
  }
}

- (id)description
{
  return -[RPIdentity descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  BOOL v4 = shouldPrintSensitiveData();
  uint64_t v79 = 0LL;
  NSAppendPrintF();
  id v5 = 0LL;
  id v6 = v5;
  if (self->_type)
  {
    id v78 = v5;
    NSAppendPrintF();
    id v7 = v78;

    id v6 = v7;
  }

  uint64_t v8 = self->_identifier;
  uint64_t v9 = self->_idsDeviceID;
  if ((-[NSString isEqual:](v9, "isEqual:", v8) & 1) != 0)
  {
    id v10 = v8;
    uint64_t v8 = 0LL;
  }

  else
  {
    if (!v8) {
      goto LABEL_8;
    }
    v77[9] = v6;
    formatSensitiveData((uint64_t)", ID ", v4);
    NSAppendPrintF();
    id v11 = v6;
    id v10 = (NSString *)v6;
    id v6 = v11;
  }

LABEL_8:
  if (v9)
  {
    v77[8] = v6;
    formatSensitiveData((uint64_t)", IDS ", v4);
    NSAppendPrintF();
    id v12 = v6;

    id v6 = v12;
  }

  accountAltDSID = self->_accountAltDSID;
  if (accountAltDSID)
  {
    v77[7] = v6;
    id v14 = accountAltDSID;
    formatSensitiveData((uint64_t)", AccountAltDSID ", v4);
    NSAppendPrintF();
    id v15 = v6;

    id v6 = v15;
  }

  accountID = self->_accountID;
  if (accountID)
  {
    v77[6] = v6;
    id v17 = accountID;
    formatSensitiveData((uint64_t)", AID ", v4);
    NSAppendPrintF();
    id v18 = v6;

    id v6 = v18;
  }

  name = self->_name;
  if (name)
  {
    v77[5] = v6;
    uint64_t v20 = name;
    formatSensitiveData((uint64_t)", Nm ", v4);
    NSAppendPrintF();
    id v21 = v6;

    id v6 = v21;
  }

  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  if (homeKitUserIdentifier)
  {
    v77[4] = v6;
    v23 = homeKitUserIdentifier;
    formatSensitiveData((uint64_t)", HKUID ", v4);
    NSAppendPrintF();
    id v24 = v6;

    id v6 = v24;
  }

  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    v77[3] = v6;
    uint64_t v26 = mediaRemoteID;
    formatSensitiveData((uint64_t)", MRI ", v4);
    NSAppendPrintF();
    id v27 = v6;

    id v6 = v27;
  }

  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    v77[2] = v6;
    v29 = sendersKnownAlias;
    formatSensitiveData((uint64_t)", SKA ", v4);
    NSAppendPrintF();
    id v30 = v6;

    id v6 = v30;
  }

  model = self->_model;
  if (model)
  {
    v77[1] = v6;
    v32 = model;
    formatSensitiveData((uint64_t)", Md ", v4);
    NSAppendPrintF();
    id v33 = v6;

    id v6 = v33;
  }

  v34 = self->_mediaRouteID;
  v35 = v34;
  if (v34)
  {
    if (-[NSString isEqual:](v34, "isEqual:", self->_identifier))
    {
      v77[0] = v6;
      v36 = (id *)v77;
    }

    else
    {
      id v76 = v6;
      formatSensitiveData((uint64_t)", MRtI ", v4);
      v36 = &v76;
    }

    NSAppendPrintF();
    id v37 = *v36;

    id v6 = v37;
  }

  contactID = self->_contactID;
  if (contactID)
  {
    v39 = contactID;
    formatSensitiveData((uint64_t)", CNID ", v4);
    NSAppendPrintF();
    id v40 = v6;

    id v6 = v40;
  }

  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  if (allUsedSendersKnownAliases)
  {
    v42 = allUsedSendersKnownAliases;
    v43 = -[NSArray componentsJoinedByString:](v42, "componentsJoinedByString:", @" ");
    formatSensitiveData((uint64_t)", Used SKAs ", v4);
    NSAppendPrintF();
    id v44 = v6;

    id v6 = v44;
  }

  uint64_t revisionID = (NSData *)self->_revisionID;
  NSAppendPrintF();
  id v45 = v6;

  if (v4)
  {
    deviceIRKData = self->_deviceIRKData;
    if (deviceIRKData)
    {
      uint64_t revisionID = deviceIRKData;
      NSAppendPrintF();
      id v47 = v45;

      id v45 = v47;
    }

    edPKData = self->_edPKData;
    if (edPKData)
    {
      v49 = edPKData;
      -[NSData length](v49, "length", revisionID);
      NSAppendPrintF();
      id v50 = v45;

      id v45 = v50;
    }

    edSKData = self->_edSKData;
    if (edSKData)
    {
      v52 = edSKData;
      -[NSData length](v52, "length");
      NSAppendPrintF();
      id v53 = v45;

      id v45 = v53;
    }

    btIRKData = self->_btIRKData;
    if (btIRKData)
    {
      v70 = btIRKData;
      NSAppendPrintF();
      id v55 = v45;

      id v45 = v55;
    }

    btAddress = self->_btAddress;
    if (btAddress)
    {
      v71 = btAddress;
      NSAppendPrintF();
      id v57 = v45;

      id v45 = v57;
    }

    dateRequested = self->_dateRequested;
    if (dateRequested)
    {
      v72 = dateRequested;
      NSAppendPrintF();
      id v59 = v45;

      id v45 = v59;
    }

    dateAcknowledged = self->_dateAcknowledged;
    if (dateAcknowledged)
    {
      v73 = dateAcknowledged;
      NSAppendPrintF();
      id v61 = v45;

      id v45 = v61;
    }

    dateRemoved = self->_dateRemoved;
    if (dateRemoved)
    {
      v74 = dateRemoved;
      NSAppendPrintF();
      id v63 = v45;

      id v45 = v63;
    }

    if (self->_featureFlags)
    {
      NSAppendPrintF();
      id v64 = v45;

      id v45 = v64;
    }

    acl = self->_acl;
    if (acl)
    {
      v75 = acl;
      NSAppendPrintF();
      id v66 = v45;

      id v45 = v66;
    }
  }

  id v67 = v45;

  return v67;
}

- (unsigned)compareWithRPIdentity:(id)a3
{
  id v4 = a3;
  [v4 acl];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  acl = self->_acl;
  id v7 = v5;
  uint64_t v8 = acl;
  if (v7 == v8)
  {

    goto LABEL_6;
  }

  uint64_t v9 = v8;
  if ((v7 == 0LL) != (v8 != 0LL))
  {
    int v10 = -[NSDictionary isEqual:](v7, "isEqual:", v8);

    if (!v10) {
      goto LABEL_8;
    }
LABEL_6:
    int v124 = 0;
    goto LABEL_9;
  }

LABEL_8:
  int v124 = 0x200000;
LABEL_9:
  [v4 accessGroups];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  accessGroups = self->_accessGroups;
  uint64_t v13 = v11;
  id v14 = accessGroups;
  id v15 = v14;
  if (v13 == v14)
  {
    int v123 = 1;
  }

  else if ((v13 == 0LL) == (v14 != 0LL))
  {
    int v123 = 0;
  }

  else
  {
    int v123 = -[NSArray isEqual:](v13, "isEqual:", v14);
  }

  [v4 accountAltDSID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  accountAltDSID = self->_accountAltDSID;
  id v18 = v16;
  id v19 = accountAltDSID;
  uint64_t v20 = v19;
  if (v18 == v19)
  {
    int v122 = 1;
  }

  else if ((v18 == 0LL) == (v19 != 0LL))
  {
    int v122 = 0;
  }

  else
  {
    int v122 = -[NSString isEqual:](v18, "isEqual:", v19);
  }

  [v4 accountID];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  accountID = self->_accountID;
  v23 = v21;
  id v24 = accountID;
  objc_super v25 = v24;
  if (v23 == v24)
  {
    int v121 = 1;
  }

  else if ((v23 == 0LL) == (v24 != 0LL))
  {
    int v121 = 0;
  }

  else
  {
    int v121 = -[NSString isEqual:](v23, "isEqual:", v24);
  }

  [v4 allUsedSendersKnownAliases];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
  objc_super v28 = v26;
  v29 = allUsedSendersKnownAliases;
  id v30 = v29;
  if (v28 == v29)
  {
    int v120 = 1;
  }

  else if ((v28 == 0LL) == (v29 != 0LL))
  {
    int v120 = 0;
  }

  else
  {
    int v120 = -[NSArray isEqual:](v28, "isEqual:", v29);
  }

  [v4 contactID];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  contactID = self->_contactID;
  id v33 = v31;
  v34 = contactID;
  v35 = v34;
  if (v33 == v34)
  {
    int v119 = 1;
  }

  else if ((v33 == 0LL) == (v34 != 0LL))
  {
    int v119 = 0;
  }

  else
  {
    int v119 = -[NSString isEqual:](v33, "isEqual:", v34);
  }

  [v4 deviceIRKData];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  deviceIRKData = self->_deviceIRKData;
  v38 = v36;
  v39 = deviceIRKData;
  id v40 = v39;
  if (v38 == v39)
  {
    int v118 = 1;
  }

  else if ((v38 == 0LL) == (v39 != 0LL))
  {
    int v118 = 0;
  }

  else
  {
    int v118 = -[NSData isEqual:](v38, "isEqual:", v39);
  }

  [v4 edPKData];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  edPKData = self->_edPKData;
  v43 = v41;
  id v44 = edPKData;
  id v45 = v44;
  if (v43 == v44)
  {
    int v117 = 1;
  }

  else if ((v43 == 0LL) == (v44 != 0LL))
  {
    int v117 = 0;
  }

  else
  {
    int v117 = -[NSData isEqual:](v43, "isEqual:", v44);
  }

  [v4 edSKData];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  edSKData = self->_edSKData;
  v48 = v46;
  v49 = edSKData;
  id v50 = v49;
  if (v48 == v49)
  {
    int v116 = 1;
  }

  else if ((v48 == 0LL) == (v49 != 0LL))
  {
    int v116 = 0;
  }

  else
  {
    int v116 = -[NSData isEqual:](v48, "isEqual:", v49);
  }

  uint64_t v51 = [v4 featureFlags];
  unint64_t featureFlags = self->_featureFlags;
  uint64_t v126 = v51;
  [v4 homeKitUserIdentifier];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  homeKitUserIdentifier = self->_homeKitUserIdentifier;
  v54 = v52;
  id v55 = homeKitUserIdentifier;
  v56 = v55;
  if (v54 == v55)
  {
    int v115 = 1;
  }

  else if ((v54 == 0LL) == (v55 != 0LL))
  {
    int v115 = 0;
  }

  else
  {
    int v115 = -[NSUUID isEqual:](v54, "isEqual:", v55);
  }

  [v4 identifier];
  id v57 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  id v59 = v57;
  v60 = identifier;
  id v61 = v60;
  if (v59 == v60)
  {
    int v114 = 1;
  }

  else if ((v59 == 0LL) == (v60 != 0LL))
  {
    int v114 = 0;
  }

  else
  {
    int v114 = -[NSString isEqual:](v59, "isEqual:", v60);
  }

  [v4 idsDeviceID];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  idsDeviceID = self->_idsDeviceID;
  id v64 = v62;
  v65 = idsDeviceID;
  id v66 = v65;
  if (v64 == v65)
  {
    int v113 = 1;
  }

  else if ((v64 == 0LL) == (v65 != 0LL))
  {
    int v113 = 0;
  }

  else
  {
    int v113 = -[NSString isEqual:](v64, "isEqual:", v65);
  }

  [v4 mediaRemoteID];
  id v67 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRemoteID = self->_mediaRemoteID;
  v69 = v67;
  v70 = mediaRemoteID;
  v71 = v70;
  if (v69 == v70)
  {
    int v112 = 1;
  }

  else if ((v69 == 0LL) == (v70 != 0LL))
  {
    int v112 = 0;
  }

  else
  {
    int v112 = -[NSString isEqual:](v69, "isEqual:", v70);
  }

  [v4 mediaRouteID];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  mediaRouteID = self->_mediaRouteID;
  v74 = v72;
  v75 = mediaRouteID;
  id v76 = v75;
  if (v74 == v75)
  {
    int v77 = 1;
  }

  else if ((v74 == 0LL) == (v75 != 0LL))
  {
    int v77 = 0;
  }

  else
  {
    int v77 = -[NSString isEqual:](v74, "isEqual:", v75);
  }

  [v4 model];
  id v78 = (void *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  v80 = v78;
  v81 = model;
  v82 = v81;
  if (v80 == v81)
  {
    int v83 = 1;
  }

  else if ((v80 == 0LL) == (v81 != 0LL))
  {
    int v83 = 0;
  }

  else
  {
    int v83 = -[NSString isEqual:](v80, "isEqual:", v81);
  }

  [v4 name];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v86 = v84;
  v87 = name;
  v88 = v87;
  if (v86 == v87)
  {
    int v89 = 1;
  }

  else if ((v86 == 0LL) == (v87 != 0LL))
  {
    int v89 = 0;
  }

  else
  {
    int v89 = -[NSString isEqual:](v86, "isEqual:", v87);
  }

  [v4 sendersKnownAlias];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  sendersKnownAlias = self->_sendersKnownAlias;
  v92 = v90;
  v93 = sendersKnownAlias;
  v94 = v93;
  if (v92 == v93)
  {
    int v95 = 1;
  }

  else if ((v92 == 0LL) == (v93 != 0LL))
  {
    int v95 = 0;
  }

  else
  {
    int v95 = -[NSString isEqual:](v92, "isEqual:", v93);
  }

  [v4 btIRKData];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  btIRKData = self->_btIRKData;
  v98 = v96;
  v99 = btIRKData;
  v100 = v99;
  if (v98 == v99)
  {
    int v101 = 1;
  }

  else if ((v98 == 0LL) == (v99 != 0LL))
  {
    int v101 = 0;
  }

  else
  {
    int v101 = -[NSData isEqual:](v98, "isEqual:", v99);
  }

  [v4 btAddress];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  btAddress = self->_btAddress;
  v104 = v102;
  v105 = btAddress;
  v106 = v105;
  if (v104 == v105)
  {
    int v107 = 1;
  }

  else if ((v104 == 0LL) == (v105 != 0LL))
  {
    int v107 = 0;
  }

  else
  {
    int v107 = -[NSData isEqual:](v104, "isEqual:", v105);
  }

  int v108 = v124 | 0x80000;
  if (v123) {
    int v108 = v124;
  }
  if (!v122) {
    v108 |= 0x2000000u;
  }
  if (!v121) {
    v108 |= 0x2000u;
  }
  if (!v120) {
    v108 |= 0x1000000u;
  }
  if (!v119) {
    v108 |= 0x8000u;
  }
  if (!v118) {
    v108 |= 4u;
  }
  if (!v117) {
    v108 |= 8u;
  }
  if (!v116) {
    v108 |= 0x10u;
  }
  if (v126 != featureFlags) {
    v108 |= 0x400u;
  }
  if (!v115) {
    v108 |= 0x100000u;
  }
  if (!v114) {
    v108 |= 0x20u;
  }
  if (!v113) {
    v108 |= 0x40u;
  }
  if (!v112) {
    v108 |= 0x10000u;
  }
  if (!v77) {
    v108 |= 0x20000u;
  }
  if (!v83) {
    v108 |= 0x80u;
  }
  if (!v89) {
    v108 |= 0x100u;
  }
  if (!v95) {
    v108 |= 0x40000u;
  }
  if (v101) {
    int v109 = v108;
  }
  else {
    int v109 = v108 | 0x400000;
  }

  if (!v107) {
    v109 |= 0x800000u;
  }
  else {
    unsigned int v110 = v109 | 0x200;
  }

  return v110;
}

- (unsigned)updateWithKeychainItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 metadata];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 secrets];
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (!v8)
  {
    if (a4)
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }

  identifier = self->_identifier;
  id v11 = v8;
  id v12 = identifier;
  if (v11 == v12)
  {
  }

  else
  {
    uint64_t v13 = v12;
    if (!v12)
    {

LABEL_12:
      objc_storeStrong((id *)&self->_identifier, v9);
      unsigned int v15 = 32;
      goto LABEL_13;
    }

    char v14 = -[NSString isEqual:](v11, "isEqual:", v12);

    if ((v14 & 1) == 0) {
      goto LABEL_12;
    }
  }

  unsigned int v15 = 0;
LABEL_13:
  [v6 type];
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v176 = v6;
  v163 = v9;
  v174 = v11;
  if ([v16 isEqual:@"RPIdentity-FamilyAccount"])
  {
    int v17 = 3;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-FamilyDevice"])
  {
    int v17 = 4;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-FriendAccount"])
  {
    int v17 = 5;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-FriendDevice"])
  {
    int v17 = 6;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-PairedAccount"])
  {
    int v17 = 7;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-PairedDevice"])
  {
    int v17 = 8;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-SameAccountDevice"])
  {
    int v17 = 2;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-Self"])
  {
    int v17 = 1;
    goto LABEL_31;
  }

  if ([v16 isEqual:@"RPIdentity-SharedTVUserDevice"])
  {
    int v17 = 12;
LABEL_31:

    if (v17 != self->_type)
    {
      self->_uint64_t type = v17;
      v15 |= 0x200u;
    }

    objc_opt_class();
    NSDictionaryGetNSArrayOfClass();
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    accessGroups = self->_accessGroups;
    uint64_t v20 = v18;
    id v21 = accessGroups;
    v162 = v20;
    if (v20 == v21)
    {

      goto LABEL_40;
    }

    uint64_t v22 = v21;
    if ((v20 == 0LL) != (v21 != 0LL))
    {
      v23 = v20;
      char v24 = -[NSArray isEqual:](v20, "isEqual:", v21);

      if ((v24 & 1) != 0)
      {
LABEL_40:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v25 length]) {
          goto LABEL_48;
        }
        accountAltDSID = self->_accountAltDSID;
        id v27 = v25;
        objc_super v28 = accountAltDSID;
        if (v27 == v28)
        {

          goto LABEL_48;
        }

        v29 = v28;
        if ((v27 == 0LL) != (v28 != 0LL))
        {
          char v30 = -[NSString isEqual:](v27, "isEqual:", v28);

          if ((v30 & 1) != 0)
          {
LABEL_48:
            CFStringGetTypeID();
            CFDictionaryGetTypedValue();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            id obj = v31;
            if (![v31 length]) {
              goto LABEL_56;
            }
            accountID = self->_accountID;
            id v33 = v31;
            v34 = accountID;
            if (v33 == v34)
            {

              goto LABEL_56;
            }

            v35 = v34;
            if ((v33 == 0LL) != (v34 != 0LL))
            {
              char v36 = -[NSString isEqual:](v33, "isEqual:", v34);

              if ((v36 & 1) != 0)
              {
LABEL_56:
                CFStringGetTypeID();
                CFDictionaryGetTypedValue();
                id v37 = (void *)objc_claimAutoreleasedReturnValue();
                id v170 = v37;
                if (![v37 length]) {
                  goto LABEL_64;
                }
                contactID = self->_contactID;
                v39 = v37;
                id v40 = contactID;
                if (v39 == v40)
                {

                  goto LABEL_64;
                }

                v41 = v40;
                if ((v39 == 0LL) != (v40 != 0LL))
                {
                  char v42 = -[NSString isEqual:](v39, "isEqual:", v40);

                  if ((v42 & 1) != 0)
                  {
LABEL_64:
                    CFDateGetTypeID();
                    CFDictionaryGetTypedValue();
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    id v168 = v43;
                    if (!v43) {
                      goto LABEL_72;
                    }
                    dateAcknowledged = self->_dateAcknowledged;
                    id v45 = v43;
                    v46 = dateAcknowledged;
                    if (v45 == v46)
                    {

                      goto LABEL_72;
                    }

                    id v47 = v46;
                    if (v46)
                    {
                      char v48 = -[NSDate isEqual:](v45, "isEqual:", v46);

                      if ((v48 & 1) != 0)
                      {
LABEL_72:
                        CFDateGetTypeID();
                        CFDictionaryGetTypedValue();
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        id v167 = v49;
                        if (!v49) {
                          goto LABEL_80;
                        }
                        dateAdded = self->_dateAdded;
                        uint64_t v51 = v49;
                        v52 = dateAdded;
                        if (v51 == v52)
                        {

                          goto LABEL_80;
                        }

                        id v53 = v52;
                        if (v52)
                        {
                          char v54 = -[NSDate isEqual:](v51, "isEqual:", v52);

                          if ((v54 & 1) != 0)
                          {
LABEL_80:
                            CFDateGetTypeID();
                            CFDictionaryGetTypedValue();
                            id v55 = (void *)objc_claimAutoreleasedReturnValue();
                            dateRemoved = self->_dateRemoved;
                            id v57 = v55;
                            v58 = dateRemoved;
                            v161 = v57;
                            if (v57 == v58)
                            {

                              goto LABEL_87;
                            }

                            id v59 = v58;
                            if ((v57 == 0LL) != (v58 != 0LL))
                            {
                              v60 = v25;
                              id v61 = v57;
                              char v62 = -[NSDate isEqual:](v57, "isEqual:", v58);

                              objc_super v25 = v60;
                              if ((v62 & 1) != 0)
                              {
LABEL_87:
                                CFDateGetTypeID();
                                CFDictionaryGetTypedValue();
                                id v63 = (void *)objc_claimAutoreleasedReturnValue();
                                id v64 = v63;
                                if (!v63) {
                                  goto LABEL_95;
                                }
                                dateRequested = self->_dateRequested;
                                id v66 = v63;
                                id v67 = dateRequested;
                                if (v66 == v67)
                                {

                                  goto LABEL_95;
                                }

                                v68 = v67;
                                if (v67)
                                {
                                  char v69 = -[NSDate isEqual:](v66, "isEqual:", v67);

                                  if ((v69 & 1) != 0)
                                  {
LABEL_95:
                                    CFDictionaryGetCFDataOfLength();
                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                    id v166 = v70;
                                    if (!v70) {
                                      goto LABEL_103;
                                    }
                                    deviceIRKData = self->_deviceIRKData;
                                    v72 = v70;
                                    v73 = deviceIRKData;
                                    if (v72 == v73)
                                    {

                                      goto LABEL_103;
                                    }

                                    v74 = v73;
                                    if (v73)
                                    {
                                      char v75 = -[NSData isEqual:](v72, "isEqual:", v73);

                                      if ((v75 & 1) != 0)
                                      {
LABEL_103:
                                        CFDictionaryGetCFDataOfLength();
                                        id v76 = (void *)objc_claimAutoreleasedReturnValue();
                                        id v165 = v76;
                                        if (!v76) {
                                          goto LABEL_111;
                                        }
                                        edPKData = self->_edPKData;
                                        id v78 = v76;
                                        uint64_t v79 = edPKData;
                                        if (v78 == v79)
                                        {

                                          goto LABEL_111;
                                        }

                                        v80 = v79;
                                        if (v79)
                                        {
                                          char v81 = -[NSData isEqual:](v78, "isEqual:", v79);

                                          if ((v81 & 1) != 0)
                                          {
LABEL_111:
                                            CFDictionaryGetCFDataOfLength();
                                            v82 = (void *)objc_claimAutoreleasedReturnValue();
                                            id v164 = v82;
                                            if (!v82) {
                                              goto LABEL_119;
                                            }
                                            edSKData = self->_edSKData;
                                            v84 = v82;
                                            v85 = edSKData;
                                            if (v84 == v85)
                                            {

                                              goto LABEL_119;
                                            }

                                            v86 = v85;
                                            if (v85)
                                            {
                                              char v87 = -[NSData isEqual:](v84, "isEqual:", v85);

                                              if ((v87 & 1) != 0)
                                              {
LABEL_119:
                                                unint64_t Int64 = CFDictionaryGetInt64();
                                                if (Int64 != self->_featureFlags)
                                                {
                                                  self->_unint64_t featureFlags = Int64;
                                                  v15 |= 0x400u;
                                                }

                                                v160 = v64;
                                                if ((v17 & 0xFFFFFFFB) == 2 || (v17 & 7) == 4)
                                                {
                                                  int v89 = v174;
                                                }

                                                else
                                                {
                                                  CFStringGetTypeID();
                                                  CFDictionaryGetTypedValue();
                                                  int v89 = (NSString *)objc_claimAutoreleasedReturnValue();
                                                  if (!v89)
                                                  {
                                                    v90 = 0LL;
                                                    v91 = v176;
                                                    goto LABEL_133;
                                                  }
                                                }

                                                idsDeviceID = self->_idsDeviceID;
                                                v90 = v89;
                                                v93 = idsDeviceID;
                                                v91 = v176;
                                                if (v90 == v93)
                                                {

                                                  goto LABEL_133;
                                                }

                                                v94 = v93;
                                                if (v93)
                                                {
                                                  char v95 = -[NSString isEqual:](v90, "isEqual:", v93);

                                                  if ((v95 & 1) != 0)
                                                  {
LABEL_133:
                                                    CFStringGetTypeID();
                                                    CFDictionaryGetTypedValue();
                                                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                                                    id v169 = v96;
                                                    if (![v96 length]) {
                                                      goto LABEL_141;
                                                    }
                                                    mediaRemoteID = self->_mediaRemoteID;
                                                    v98 = v96;
                                                    v99 = mediaRemoteID;
                                                    if (v98 == v99)
                                                    {

                                                      goto LABEL_141;
                                                    }

                                                    v100 = v99;
                                                    if ((v98 == 0LL) != (v99 != 0LL))
                                                    {
                                                      char v101 = -[NSString isEqual:](v98, "isEqual:", v99);

                                                      if ((v101 & 1) != 0)
                                                      {
LABEL_141:
                                                        CFStringGetTypeID();
                                                        CFDictionaryGetTypedValue();
                                                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v175 = v102;
                                                        if (![v102 length]) {
                                                          goto LABEL_149;
                                                        }
                                                        mediaRouteID = self->_mediaRouteID;
                                                        v104 = v102;
                                                        v105 = mediaRouteID;
                                                        if (v104 == v105)
                                                        {

                                                          goto LABEL_149;
                                                        }

                                                        v106 = v105;
                                                        if ((v104 == 0LL) != (v105 != 0LL))
                                                        {
                                                          char v107 = -[NSString isEqual:](v104, "isEqual:", v105);

                                                          if ((v107 & 1) != 0)
                                                          {
LABEL_149:
                                                            CFStringGetTypeID();
                                                            CFDictionaryGetTypedValue();
                                                            int v108 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v173 = v108;
                                                            if (![v108 length]) {
                                                              goto LABEL_157;
                                                            }
                                                            model = self->_model;
                                                            unsigned int v110 = v108;
                                                            v111 = model;
                                                            if (v110 == v111)
                                                            {

                                                              goto LABEL_157;
                                                            }

                                                            int v112 = v111;
                                                            if ((v110 == 0LL) != (v111 != 0LL))
                                                            {
                                                              char v113 = -[NSString isEqual:](v110, "isEqual:", v111);

                                                              if ((v113 & 1) != 0)
                                                              {
LABEL_157:
                                                                [v91 name];
                                                                int v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if (![v114 length]) {
                                                                  goto LABEL_165;
                                                                }
                                                                name = self->_name;
                                                                int v116 = v114;
                                                                int v117 = name;
                                                                if (v116 == v117)
                                                                {

                                                                  goto LABEL_165;
                                                                }

                                                                int v118 = v117;
                                                                if ((v116 == 0LL) != (v117 != 0LL))
                                                                {
                                                                  char v119 = -[NSString isEqual:](v116, "isEqual:", v117);

                                                                  if ((v119 & 1) != 0)
                                                                  {
LABEL_165:
                                                                    self->_uint64_t revisionID = CFDictionaryGetInt64Ranged();
                                                                    CFStringGetTypeID();
                                                                    CFDictionaryGetTypedValue();
                                                                    int v120 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v159 = v114;
                                                                    id v172 = v120;
                                                                    if (![v120 length]) {
                                                                      goto LABEL_173;
                                                                    }
                                                                    sendersKnownAlias = self->_sendersKnownAlias;
                                                                    int v122 = v120;
                                                                    int v123 = sendersKnownAlias;
                                                                    if (v122 == v123)
                                                                    {

                                                                      goto LABEL_173;
                                                                    }

                                                                    int v124 = v123;
                                                                    if ((v122 == 0LL) != (v123 != 0LL))
                                                                    {
                                                                      char v125 = -[NSString isEqual:]( v122,  "isEqual:",  v123);

                                                                      if ((v125 & 1) != 0)
                                                                      {
LABEL_173:
                                                                        objc_opt_class();
                                                                        NSDictionaryGetNSArrayOfClass();
                                                                        uint64_t v126 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        allUsedSendersKnownAliases = self->_allUsedSendersKnownAliases;
                                                                        v128 = v126;
                                                                        v129 = allUsedSendersKnownAliases;
                                                                        if (v128 == v129)
                                                                        {

                                                                          goto LABEL_180;
                                                                        }

                                                                        v130 = v129;
                                                                        if ((v128 == 0LL) != (v129 != 0LL))
                                                                        {
                                                                          char v131 = -[NSArray isEqual:]( v128,  "isEqual:",  v129);

                                                                          if ((v131 & 1) != 0)
                                                                          {
LABEL_180:
                                                                            BOOL v132 = CFDictionaryGetInt64() != 0;
                                                                            if (self->_userAdded != v132)
                                                                            {
                                                                              self->_userAdded = v132;
                                                                              v15 |= 0x4000u;
                                                                            }

                                                                            CFDictionaryGetCFDataOfLength();
                                                                            v133 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v134 = v133;
                                                                            if (!v133)
                                                                            {
LABEL_191:
                                                                              CFDictionaryGetCFDataOfLength();
                                                                              v142 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v143 = v142;
                                                                              if (v142)
                                                                              {
                                                                                btAddress = self->_btAddress;
                                                                                p_btAddress = &self->_btAddress;
                                                                                v146 = v142;
                                                                                v147 = btAddress;
                                                                                if (v146 != v147)
                                                                                {
                                                                                  v148 = v147;
                                                                                  v158 = v90;
                                                                                  unsigned int v149 = v15;
                                                                                  v150 = v7;
                                                                                  v151 = v25;
                                                                                  if (v147)
                                                                                  {
                                                                                    char v152 = -[NSData isEqual:]( v146,  "isEqual:",  v147);

                                                                                    if ((v152 & 1) != 0) {
                                                                                      goto LABEL_200;
                                                                                    }
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                  }

                                                                                  objc_storeStrong( (id *)p_btAddress,  v143);
                                                                                  v149 |= 0x800000u;
LABEL_200:
                                                                                  objc_super v25 = v151;
                                                                                  id v7 = v150;
                                                                                  unsigned int v15 = v149;
                                                                                  v154 = v170;
                                                                                  v153 = obj;
                                                                                  v90 = v158;
                                                                                  goto LABEL_201;
                                                                                }
                                                                              }

                                                                              v154 = v170;
                                                                              v153 = obj;
LABEL_201:

                                                                              id v6 = v176;
                                                                              uint64_t v9 = v163;
                                                                              goto LABEL_202;
                                                                            }

                                                                            btIRKData = self->_btIRKData;
                                                                            v136 = v133;
                                                                            v137 = btIRKData;
                                                                            if (v136 == v137)
                                                                            {

                                                                              goto LABEL_191;
                                                                            }

                                                                            v138 = v137;
                                                                            v157 = v90;
                                                                            v139 = v7;
                                                                            v140 = v25;
                                                                            if (v137)
                                                                            {
                                                                              char v141 = -[NSData isEqual:]( v136,  "isEqual:",  v137);

                                                                              if ((v141 & 1) != 0) {
                                                                                goto LABEL_190;
                                                                              }
                                                                            }

                                                                            else
                                                                            {
                                                                            }

                                                                            objc_storeStrong( (id *)&self->_btIRKData,  v134);
                                                                            v15 |= 0x400000u;
LABEL_190:
                                                                            objc_super v25 = v140;
                                                                            id v7 = v139;
                                                                            v90 = v157;
                                                                            goto LABEL_191;
                                                                          }
                                                                        }

                                                                        else
                                                                        {
                                                                        }

                                                                        objc_storeStrong( (id *)&self->_allUsedSendersKnownAliases,  v126);
                                                                        v15 |= 0x1000000u;
                                                                        goto LABEL_180;
                                                                      }
                                                                    }

                                                                    else
                                                                    {
                                                                    }

                                                                    objc_storeStrong( (id *)&self->_sendersKnownAlias,  v172);
                                                                    v15 |= 0x40000u;
                                                                    goto LABEL_173;
                                                                  }
                                                                }

                                                                else
                                                                {
                                                                }

                                                                objc_storeStrong((id *)&self->_name, v114);
                                                                v15 |= 0x100u;
                                                                goto LABEL_165;
                                                              }
                                                            }

                                                            else
                                                            {
                                                            }

                                                            objc_storeStrong((id *)&self->_model, v173);
                                                            v15 |= 0x80u;
                                                            goto LABEL_157;
                                                          }
                                                        }

                                                        else
                                                        {
                                                        }

                                                        objc_storeStrong((id *)&self->_mediaRouteID, v175);
                                                        v15 |= 0x20000u;
                                                        goto LABEL_149;
                                                      }
                                                    }

                                                    else
                                                    {
                                                    }

                                                    objc_storeStrong((id *)&self->_mediaRemoteID, v169);
                                                    v15 |= 0x10000u;
                                                    goto LABEL_141;
                                                  }
                                                }

                                                else
                                                {
                                                }

                                                objc_storeStrong((id *)&self->_idsDeviceID, v89);
                                                v15 |= 0x40u;
                                                goto LABEL_133;
                                              }
                                            }

                                            else
                                            {
                                            }

                                            objc_storeStrong((id *)&self->_edSKData, v164);
                                            v15 |= 0x10u;
                                            goto LABEL_119;
                                          }
                                        }

                                        else
                                        {
                                        }

                                        objc_storeStrong((id *)&self->_edPKData, v165);
                                        v15 |= 8u;
                                        goto LABEL_111;
                                      }
                                    }

                                    else
                                    {
                                    }

                                    objc_storeStrong((id *)&self->_deviceIRKData, v166);
                                    v15 |= 4u;
                                    goto LABEL_103;
                                  }
                                }

                                else
                                {
                                }

                                objc_storeStrong((id *)&self->_dateRequested, v64);
                                v15 |= 2u;
                                goto LABEL_95;
                              }
                            }

                            else
                            {
                            }

                            objc_storeStrong((id *)&self->_dateRemoved, v55);
                            v15 |= 2u;
                            goto LABEL_87;
                          }
                        }

                        else
                        {
                        }

                        objc_storeStrong((id *)&self->_dateAdded, v167);
                        v15 |= 2u;
                        goto LABEL_80;
                      }
                    }

                    else
                    {
                    }

                    objc_storeStrong((id *)&self->_dateAcknowledged, v168);
                    v15 |= 2u;
                    goto LABEL_72;
                  }
                }

                else
                {
                }

                objc_storeStrong((id *)&self->_contactID, v170);
                v15 |= 0x8000u;
                goto LABEL_64;
              }
            }

            else
            {
            }

            objc_storeStrong((id *)&self->_accountID, obj);
            v15 |= 0x2000u;
            goto LABEL_56;
          }
        }

        else
        {
        }

        objc_storeStrong((id *)&self->_accountAltDSID, v25);
        v15 |= 0x2000000u;
        goto LABEL_48;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_accessGroups, v18);
    v15 |= 0x80000u;
    goto LABEL_40;
  }

  if (a4)
  {
    [v6 type];
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

- (unsigned)updateWithRPMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  CFDictionaryGetCFDataOfLength();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = self->_deviceIRKData;
  uint64_t v8 = v6;
  uint64_t v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }

  if (v7)
  {
    char v10 = -[NSData isEqual:](v7, "isEqual:", v8);

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v11 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_deviceIRKData, v6);
  unsigned int v11 = 4;
LABEL_10:

  CFDictionaryGetCFDataOfLength();
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = self->_edPKData;
  char v14 = v12;
  unsigned int v15 = v14;
  if (v13 == v14)
  {

    goto LABEL_18;
  }

  if (!v13)
  {

    goto LABEL_17;
  }

  char v16 = -[NSData isEqual:](v13, "isEqual:", v14);

  if ((v16 & 1) == 0)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_edPKData, v12);
    v11 |= 8u;
  }

- (id)authTagForData:(id)a3 type:(int)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = self->_deviceIRKData;
  char v10 = v9;
  if (!v9)
  {
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  if (-[NSData length](v9, "length") != 16)
  {
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }

  -[NSData bytes](v10, "bytes");
  id v11 = v8;
  [v11 bytes];
  [v11 length];
  uint64_t v12 = SipHash();
  v16[0] = BYTE5(v12);
  v16[1] = BYTE4(v12);
  v16[2] = BYTE3(v12);
  v16[3] = BYTE2(v12);
  v16[4] = BYTE1(v12);
  v16[5] = v12;
  if ((a4 - 1) >= 4)
  {
    if (a5)
    {
LABEL_10:
      RPErrorF();
      char v14 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }

- (BOOL)verifyAuthTag:(id)a3 data:(id)a4 type:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  uint64_t v13 = [v12 bytes];
  uint64_t v14 = [v12 length];

  id v15 = v11;
  uint64_t v16 = [v15 bytes];
  uint64_t v17 = [v15 length];

  return -[RPIdentity verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:]( self,  "verifyAuthTagPtr:authTagLen:dataPtr:dataLen:type:error:",  v13,  v14,  v16,  v17,  v7,  a6);
}

- (BOOL)verifyAuthTagPtr:(const void *)a3 authTagLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 type:(int)a7 error:(id *)a8
{
  id v12 = self->_deviceIRKData;
  uint64_t v13 = v12;
  if (!v12)
  {
    if (a8) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }

  if (-[NSData length](v12, "length") != 16)
  {
    if (a8) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }

  -[NSData bytes](v13, "bytes");
  uint64_t v14 = SipHash();
  v22[0] = BYTE5(v14);
  v22[1] = BYTE4(v14);
  v22[2] = BYTE3(v14);
  v22[3] = BYTE2(v14);
  v22[4] = BYTE1(v14);
  v22[5] = v14;
  if ((a7 - 1) >= 4)
  {
    if (a8) {
      goto LABEL_15;
    }
LABEL_17:
    BOOL v20 = 0;
    goto LABEL_18;
  }

  if (qword_1873E7670[a7 - 1] != a4)
  {
    if (!a8) {
      goto LABEL_17;
    }
LABEL_15:
    RPErrorF();
    BOOL v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }

  int v15 = 0;
  uint64_t v16 = v22;
  do
  {
    int v18 = *(unsigned __int8 *)a3;
    a3 = (char *)a3 + 1;
    int v17 = v18;
    int v19 = *v16++;
    v15 |= v19 ^ v17;
    --a4;
  }

  while (a4);
  BOOL v20 = v15 == 0;
  if (a8 && v15) {
    goto LABEL_15;
  }
LABEL_18:

  return v20;
}

- (id)signData:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  if (-[RPIdentity signDataPtr:dataLen:signatureBytes:error:]( self,  "signDataPtr:dataLen:signatureBytes:error:",  v7,  v8,  v10,  a4))
  {
    return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v10 length:64];
  }

  else
  {
    return 0LL;
  }

- (BOOL)signDataPtr:(const void *)a3 dataLen:(unint64_t)a4 signatureBytes:(unsigned __int8)a5[64] error:(id *)a6
{
  uint64_t v8 = self->_edPKData;
  if (-[NSData length](v8, "length") == 32)
  {
    uint64_t v9 = self->_edSKData;
    uint64_t v10 = -[NSData length](v9, "length");
    BOOL v11 = v10 == 32;
    if (v10 == 32)
    {
      -[NSData bytes](v8, "bytes");
      -[NSData bytes](v9, "bytes");
      cced25519_sign_compat();
    }

    else if (a6)
    {
      RPErrorF();
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else if (a6)
  {
    RPErrorF();
    BOOL v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)verifySignature:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];

  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  return -[RPIdentity verifySignaturePtr:signatureLen:dataPtr:dataLen:error:]( self,  "verifySignaturePtr:signatureLen:dataPtr:dataLen:error:",  v11,  v12,  v14,  v15,  a5);
}

- (BOOL)verifySignaturePtr:(const void *)a3 signatureLen:(unint64_t)a4 dataPtr:(const void *)a5 dataLen:(unint64_t)a6 error:(id *)a7
{
  if (a4 == 64)
  {
    id v8 = self->_edPKData;
    if (-[NSData length](v8, "length") == 32)
    {
      -[NSData bytes](v8, "bytes");
      int v9 = cced25519_verify_compat();
      BOOL v10 = v9 == 0;
      if (!a7 || !v9) {
        goto LABEL_12;
      }
    }

    else if (!a7)
    {
      BOOL v10 = 0;
      goto LABEL_12;
    }

    RPErrorF();
    BOOL v10 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v10;
  }

  if (!a7) {
    return 0;
  }
  RPErrorF();
  BOOL v10 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (NSArray)accessGroups
{
  return self->_accessGroups;
}

- (void)setAccessGroups:(id)a3
{
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
}

- (NSDate)dateRemoved
{
  return self->_dateRemoved;
}

- (void)setDateRemoved:(id)a3
{
}

- (NSData)deviceIRKData
{
  return self->_deviceIRKData;
}

- (void)setDeviceIRKData:(id)a3
{
}

- (NSData)edPKData
{
  return self->_edPKData;
}

- (void)setEdPKData:(id)a3
{
}

- (NSData)edSKData
{
  return self->_edSKData;
}

- (void)setEdSKData:(id)a3
{
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(unint64_t)a3
{
  self->_unint64_t featureFlags = a3;
}

- (NSUUID)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (void)setMediaRouteID:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)sendersKnownAlias
{
  return self->_sendersKnownAlias;
}

- (void)setSendersKnownAlias:(id)a3
{
}

- (NSArray)allUsedSendersKnownAliases
{
  return self->_allUsedSendersKnownAliases;
}

- (void)setAllUsedSendersKnownAliases:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (BOOL)userAdded
{
  return self->_userAdded;
}

- (void)setUserAdded:(BOOL)a3
{
  self->_userAdded = a3;
}

- (NSData)btIRKData
{
  return self->_btIRKData;
}

- (void)setBtIRKData:(id)a3
{
}

- (NSData)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (NSDate)dateAcknowledged
{
  return self->_dateAcknowledged;
}

- (void)setDateAcknowledged:(id)a3
{
}

- (NSDate)dateRequested
{
  return self->_dateRequested;
}

- (void)setDateRequested:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (unint64_t)disabledUntilTicks
{
  return self->_disabledUntilTicks;
}

- (void)setDisabledUntilTicks:(unint64_t)a3
{
  self->_disabledUntilTicks = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (unsigned)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unsigned int)a3
{
  self->_uint64_t revisionID = a3;
}

- (void).cxx_destruct
{
}

@end