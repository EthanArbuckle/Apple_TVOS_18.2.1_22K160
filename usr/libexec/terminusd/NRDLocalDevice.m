@interface NRDLocalDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSavedClassCKeysInKeychain;
- (BOOL)isEmptyPairing;
- (NRDLocalDevice)init;
- (NRDLocalDevice)initWithCoder:(id)a3;
- (NSData)localInnerIPv6AddressBytesClassC;
- (NSData)localInnerIPv6AddressBytesClassD;
- (NSData)remoteInnerIPv6AddressBytesClassC;
- (NSData)remoteInnerIPv6AddressBytesClassD;
- (NSDate)dateCreated;
- (NSDate)dateEnabled;
- (NSDate)dateRegistered;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pairingProtocolVersion;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBluetoothMACAddress:(id)a3;
- (void)setBluetoothUUID:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setDateEnabled:(id)a3;
- (void)setDateRegistered:(id)a3;
- (void)setDeviceType:(unsigned __int8)a3;
- (void)setHasAuthenticatedWithIdentity:(BOOL)a3;
- (void)setHasCompletedBluetoothPairing:(BOOL)a3;
- (void)setHasConfirmedClassAKeys:(BOOL)a3;
- (void)setHasConfirmedClassCKeys:(BOOL)a3;
- (void)setHasConfirmedClassDKeys:(BOOL)a3;
- (void)setHasSavedClassCKeysInKeychain:(BOOL)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setIsAltAccountDevice:(BOOL)a3;
- (void)setIsEmptyPairing:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setLastSeenAlwaysOnWiFiSupported:(BOOL)a3;
- (void)setLastSeenBuildVersion:(id)a3;
- (void)setLastSeenInnerLinkVersionHBO:(unsigned __int16)a3;
- (void)setLastSeenName:(id)a3;
- (void)setLocalFlags:(unint64_t)a3;
- (void)setLocalIdentity:(id)a3;
- (void)setLocalInnerIPv6AddressBytesClassC:(id)a3;
- (void)setLocalInnerIPv6AddressBytesClassD:(id)a3;
- (void)setNrUUID:(id)a3;
- (void)setOperationalProp:(id)a3;
- (void)setPairingProtocolVersion:(int64_t)a3;
- (void)setReceivedProxyNotifyPayload:(id)a3;
- (void)setRemoteFlags:(unint64_t)a3;
- (void)setRemoteIdentity:(id)a3;
- (void)setRemoteInnerIPv6AddressBytesClassC:(id)a3;
- (void)setRemoteInnerIPv6AddressBytesClassD:(id)a3;
- (void)setSelfManagedBluetoothPairing:(BOOL)a3;
- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3;
@end

@implementation NRDLocalDevice

- (NRDLocalDevice)init
{
  v2 = (NRDLocalDevice *)sub_1001253C8(self);
  sub_100124478(v2);
  return v2;
}

- (void)setIsEmptyPairing:(BOOL)a3
{
  if (self->_isEmptyPairing != a3)
  {
    self->_isEmptyPairing = a3;
    if (a3) {
      sub_1001251C0(self);
    }
    else {
      sub_100124478(self);
    }
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NRDLocalDevice;
  -[NRDLocalDevice dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v15 = a5;
  v7 = sub_100146AFC();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSKeyValueChangeOldKey]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {

    v8 = 0LL;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {

    v11 = 0LL;
  }

  if (v8 != v11)
  {
    unsigned __int8 v14 = [v8 isEqual:v11];
    if (self)
    {
      if ((v14 & 1) == 0) {
        self->_isChanged = 1;
      }
    }
  }
}

- (id)description
{
  objc_super v3 = -[NSMutableString initWithFormat:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithFormat:", @"NRDLD[");
  if (-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing")) {
    -[NSMutableString appendString:](v3, "appendString:", @"empty pairing:");
  }
  if (self)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_nrUUID, "UUIDString"));
    -[NSMutableString appendString:](v3, "appendString:", v4);

    if (self->_isRegistered) {
      -[NSMutableString appendString:](v3, "appendString:", @", R");
    }
    if (self->_isEphemeral) {
      -[NSMutableString appendString:](v3, "appendString:", @", Epml");
    }
    if (self->_isEnabled) {
      -[NSMutableString appendString:](v3, "appendString:", @", E");
    }
    if (self->_wasInitiallySetupUsingIDSPairing) {
      -[NSMutableString appendString:](v3, "appendString:", @", IDS");
    }
    bluetoothUUID = self->_bluetoothUUID;
    if (bluetoothUUID)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](bluetoothUUID, "UUIDString"));
      -[NSMutableString appendFormat:](v3, "appendFormat:", @", BT<%@>", v6);
    }

    if (self->_idsDeviceID) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @", IDSDeviceID<%@>", self->_idsDeviceID);
    }
    if (self->_isAltAccountDevice) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @", ALT-ACC");
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([0 UUIDString]);
    -[NSMutableString appendString:](v3, "appendString:", v8);
  }

  -[NSMutableString appendString:](v3, "appendString:", @"]");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_autoreleasePoolPush();
  v6 = (char *)[(id)objc_opt_class(self) allocWithZone:a3];
  if (self)
  {
    v7 = sub_100123CC0(v6, self->_nrUUID);
    if (v7) {
      goto LABEL_3;
    }
LABEL_31:
    id v57 = sub_100121F34();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v57, 16LL);

    self = (NRDLocalDevice *)"-[NRDLocalDevice copyWithZone:]";
    if (IsLevelEnabled)
    {
      id v59 = sub_100121F34();
      _NRLogWithArgs( v59,  16LL,  "%s%.30s:%-4d ABORTING: Assertion Failed: (newDevice) != ((void *)0)",  ",  "-[NRDLocalDevice copyWithZone:]"",  1905);
    }

    v5 = (void *)_os_log_pack_size(12LL);
    v8 = (char *)&v72 - (((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v60 = __error();
    uint64_t v61 = _os_log_pack_fill( v8,  v5,  *v60,  &_mh_execute_header,  "%{public}s Assertion Failed: (newDevice) != ((void *)0)");
    *(_DWORD *)uint64_t v61 = 136446210;
    *(void *)(v61 + 4) = "-[NRDLocalDevice copyWithZone:]";
    id v62 = sub_100121F34();
    _NRLogAbortWithPack(v62, v8);
    goto LABEL_34;
  }

  v7 = sub_100123CC0(v6, 0LL);
  if (!v7) {
    goto LABEL_31;
  }
LABEL_3:
  v8 = v7;
  if (self)
  {
    id v9 = -[NSUUID copy](self->_bluetoothUUID, "copy");
    [v8 setBluetoothUUID:v9];

    idsDeviceID = self->_idsDeviceID;
    goto LABEL_5;
  }

- (NRDLocalDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"nrUUID"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
    id v81 = sub_100121F34();
    int IsLevelEnabled = _NRLogIsLevelEnabled(v81, 17LL);

    if (IsLevelEnabled)
    {
      id v83 = sub_100121F34();
      _NRLogWithArgs(v83, 17LL, "%s called with null nrUUID", "-[NRDLocalDevice initWithCoder:]");
    }

    id v15 = 0LL;
    goto LABEL_6;
  }

  v8 = sub_100123CC0((char *)self, v7);
  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"bluetoothUUID"];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setBluetoothUUID:v10];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"idsDeviceID"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v8 setIdsDeviceID:v12];

  id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"dateCreated"];
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  [v8 setDateCreated:v14];

  objc_msgSend(v8, "setIsEmptyPairing:", objc_msgSend(v4, "decodeBoolForKey:", @"isEmptyPairing"));
  if ([v8 isEmptyPairing])
  {
    if (v8) {
      v8[21] = 0;
    }
    self = v8;
    id v15 = self;
LABEL_6:

    objc_autoreleasePoolPop(v5);
    goto LABEL_62;
  }

  objc_msgSend(v8, "setIsRegistered:", objc_msgSend(v4, "decodeBoolForKey:", @"isRegistered"));
  objc_msgSend(v8, "setIsEnabled:", objc_msgSend(v4, "decodeBoolForKey:", @"isEnabled"));
  objc_msgSend( v8,  "setPairingProtocolVersion:",  objc_msgSend(v4, "decodeInt64ForKey:", @"pairingProtocolVersion"));
  objc_msgSend( v8,  "setLastSeenInnerLinkVersionHBO:",  (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", @"lastSeenInnerLinkVersionHBO"));
  id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"lastSeenName"];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  [v8 setLastSeenName:v17];

  id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"lastSeenBuildVersion"];
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [v8 setLastSeenBuildVersion:v19];

  objc_msgSend( v8,  "setWasInitiallySetupUsingIDSPairing:",  objc_msgSend(v4, "decodeBoolForKey:", @"wasInitiallySetupUsingIDSPairing"));
  objc_msgSend(v8, "setIsAltAccountDevice:", objc_msgSend(v4, "decodeBoolForKey:", @"isAltAccountDevice"));
  objc_msgSend( v8,  "setLastSeenAlwaysOnWiFiSupported:",  objc_msgSend(v4, "decodeBoolForKey:", @"lastSeenAlwaysOnWiFiSupported"));
  id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"dateRegistered"];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v8 setDateRegistered:v21];

  id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"dateEnabled"];
  id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v8 setDateEnabled:v23];

  id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"localIdentity"];
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  [v8 setLocalIdentity:v25];

  id v26 = [v4 decodeObjectOfClass:objc_opt_class(NRDDeviceIdentity) forKey:@"remoteIdentity"];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  [v8 setRemoteIdentity:v27];

  objc_msgSend( v8,  "setHasAuthenticatedWithIdentity:",  objc_msgSend(v4, "decodeBoolForKey:", @"hasAuthenticatedWithIdentity"));
  objc_msgSend(v8, "setHasConfirmedClassDKeys:", objc_msgSend(v4, "decodeBoolForKey:", @"hasConfirmedClassDKeys"));
  objc_msgSend(v8, "setHasConfirmedClassCKeys:", objc_msgSend(v4, "decodeBoolForKey:", @"hasConfirmedClassCKeys"));
  objc_msgSend(v8, "setHasConfirmedClassAKeys:", objc_msgSend(v4, "decodeBoolForKey:", @"hasConfirmedClassAKeys"));
  objc_msgSend( v8,  "setHasSavedClassCKeysInKeychain:",  objc_msgSend(v4, "decodeBoolForKey:", @"hasSavedClassCKeysInKeychain"));
  objc_msgSend(v8, "setDeviceType:", objc_msgSend(v4, "decodeInt32ForKey:", @"deviceType"));
  id v28 = [v4 decodeObjectOfClass:objc_opt_class(NRDeviceOperationalProperties) forKey:@"operationalProp"];
  id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  [v8 setOperationalProp:v29];

  objc_msgSend(v8, "setLocalFlags:", objc_msgSend(v4, "decodeInt64ForKey:", @"localFlags"));
  objc_msgSend(v8, "setRemoteFlags:", objc_msgSend(v4, "decodeInt64ForKey:", @"remoteFlags"));
  id v30 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"bluetoothMACAddress"];
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = v31;
  if (v31)
  {
    id v33 = v31;
    id v34 = [v33 length];
    if (v34) {
      v35 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v33 bytes],  v34);
    }
    else {
      v35 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    id v36 = v35;

    [v8 setBluetoothMACAddress:v36];
  }

  else
  {
    [v8 setBluetoothMACAddress:0];
  }

  id v37 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"localInnerIPv6AddressBytesClassD"];
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  id v39 = v38;
  if (v38)
  {
    id v40 = v38;
    id v41 = [v40 length];
    if (v41) {
      v42 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v40 bytes],  v41);
    }
    else {
      v42 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    id v43 = v42;

    [v8 setLocalInnerIPv6AddressBytesClassD:v43];
  }

  else
  {
    [v8 setLocalInnerIPv6AddressBytesClassD:0];
  }

  id v44 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"remoteInnerIPv6AddressBytesClassD"];
  id v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v46 = v45;
  if (v45)
  {
    id v47 = v45;
    id v48 = [v47 length];
    if (v48) {
      id v49 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v47 bytes],  v48);
    }
    else {
      id v49 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    v50 = v49;

    [v8 setRemoteInnerIPv6AddressBytesClassD:v50];
  }

  else
  {
    [v8 setRemoteInnerIPv6AddressBytesClassD:0];
  }

  id v51 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"localInnerIPv6AddressBytesClassC"];
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  id v53 = v52;
  if (v52)
  {
    id v54 = v52;
    id v55 = [v54 length];
    if (v55) {
      v56 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v54 bytes],  v55);
    }
    else {
      v56 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    id v57 = v56;

    [v8 setLocalInnerIPv6AddressBytesClassC:v57];
  }

  else
  {
    [v8 setLocalInnerIPv6AddressBytesClassC:0];
  }

  id v58 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"remoteInnerIPv6AddressBytesClassC"];
  id v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v60 = v59;
  if (v59)
  {
    id v61 = v59;
    id v62 = [v61 length];
    if (v62) {
      id v63 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v61 bytes],  v62);
    }
    else {
      id v63 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    unsigned __int8 v64 = v63;

    [v8 setRemoteInnerIPv6AddressBytesClassC:v64];
  }

  else
  {
    [v8 setRemoteInnerIPv6AddressBytesClassC:0];
  }

  id v65 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"receivedProxyNotifyPayload"];
  id v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  id v67 = v66;
  if (v66)
  {
    id v68 = v66;
    id v69 = [v68 length];
    if (v69) {
      v70 = (NSData *)+[NSData _newZeroingDataWithBytes:length:]( NSData,  "_newZeroingDataWithBytes:length:",  [v68 bytes],  v69);
    }
    else {
      v70 = objc_alloc_init(&OBJC_CLASS___NSData);
    }
    id v71 = v70;

    [v8 setReceivedProxyNotifyPayload:v71];
  }

  else
  {
    [v8 setReceivedProxyNotifyPayload:0];
  }

  id v72 = [v4 decodeObjectOfClass:objc_opt_class(NRDLDKeys) forKey:@"classDKeys"];
  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
  if (v73)
  {
    if (qword_1001DCBD8 != -1) {
      dispatch_once(&qword_1001DCBD8, &stru_1001B06D8);
    }
    if (_NRLogIsLevelEnabled(qword_1001DCBD0, 0LL))
    {
      if (qword_1001DCBD8 != -1) {
        dispatch_once(&qword_1001DCBD8, &stru_1001B06D8);
      }
      _NRLogWithArgs( qword_1001DCBD0,  0LL,  "%s%.30s:%-4d Migrating legacy ClassD keys for %@",  ",  "-[NRDLocalDevice initWithCoder:]"",  2024LL,  v8);
    }

    v74 = sub_100123EA4(objc_alloc(&OBJC_CLASS___NRDLDDataClassKeychainItems), v73);
    if (v8)
    {
      v75 = (void *)*((void *)v8 + 9);
      *((void *)v8 + 9) = v74;

      v8[21] = 1;
    }

    else
    {
    }
  }

  id v76 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"outOfBandKey"];
  v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
  if (v77)
  {
    if (qword_1001DCBD8 != -1) {
      dispatch_once(&qword_1001DCBD8, &stru_1001B06D8);
    }
    if (_NRLogIsLevelEnabled(qword_1001DCBD0, 0LL))
    {
      if (qword_1001DCBD8 != -1) {
        dispatch_once(&qword_1001DCBD8, &stru_1001B06D8);
      }
      _NRLogWithArgs( qword_1001DCBD0,  0LL,  "%s%.30s:%-4d Migrating legacy OOBK key for %@",  ",  "-[NRDLocalDevice initWithCoder:]"",  2032LL,  v8);
    }

    v78 = sub_1001242A0((char *)objc_alloc(&OBJC_CLASS___NRDLDKeychainItemData), v77);
    if (v8)
    {
      v79 = (void *)*((void *)v8 + 19);
      *((void *)v8 + 19) = v78;

      v8[21] = 1;
    }

    else
    {
    }
  }

  sub_100124478(v8);

  objc_autoreleasePoolPop(v5);
  self = v8;
  id v15 = self;
LABEL_62:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  id v4 = objc_autoreleasePoolPush();
  if (self)
  {
    [v18 encodeObject:self->_nrUUID forKey:@"nrUUID"];
    [v18 encodeObject:self->_bluetoothUUID forKey:@"bluetoothUUID"];
    idsDeviceID = self->_idsDeviceID;
  }

  else
  {
    [v18 encodeObject:0 forKey:@"nrUUID"];
    [v18 encodeObject:0 forKey:@"bluetoothUUID"];
    idsDeviceID = 0LL;
  }

  [v18 encodeObject:idsDeviceID forKey:@"idsDeviceID"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateCreated](self, "dateCreated"));
  [v18 encodeObject:v6 forKey:@"dateCreated"];

  objc_msgSend( v18,  "encodeBool:forKey:",  -[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"),  @"isEmptyPairing");
  if (!-[NRDLocalDevice isEmptyPairing](self, "isEmptyPairing"))
  {
    if (self)
    {
      [v18 encodeBool:self->_isRegistered forKey:@"isRegistered"];
      BOOL isEnabled = self->_isEnabled;
    }

    else
    {
      [v18 encodeBool:0 forKey:@"isRegistered"];
      BOOL isEnabled = 0LL;
    }

    [v18 encodeBool:isEnabled forKey:@"isEnabled"];
    objc_msgSend( v18,  "encodeInt64:forKey:",  -[NRDLocalDevice pairingProtocolVersion](self, "pairingProtocolVersion"),  @"pairingProtocolVersion");
    if (self)
    {
      [v18 encodeInt32:self->_lastSeenInnerLinkVersionHBO forKey:@"lastSeenInnerLinkVersionHBO"];
      [v18 encodeObject:self->_lastSeenName forKey:@"lastSeenName"];
      [v18 encodeObject:self->_lastSeenBuildVersion forKey:@"lastSeenBuildVersion"];
      [v18 encodeBool:self->_wasInitiallySetupUsingIDSPairing forKey:@"wasInitiallySetupUsingIDSPairing"];
      [v18 encodeBool:self->_isAltAccountDevice forKey:@"isAltAccountDevice"];
      BOOL lastSeenAlwaysOnWiFiSupported = self->_lastSeenAlwaysOnWiFiSupported;
    }

    else
    {
      [v18 encodeInt32:0 forKey:@"lastSeenInnerLinkVersionHBO"];
      [v18 encodeObject:0 forKey:@"lastSeenName"];
      [v18 encodeObject:0 forKey:@"lastSeenBuildVersion"];
      [v18 encodeBool:0 forKey:@"wasInitiallySetupUsingIDSPairing"];
      [v18 encodeBool:0 forKey:@"isAltAccountDevice"];
      BOOL lastSeenAlwaysOnWiFiSupported = 0LL;
    }

    [v18 encodeBool:lastSeenAlwaysOnWiFiSupported forKey:@"lastSeenAlwaysOnWiFiSupported"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateRegistered](self, "dateRegistered"));
    [v18 encodeObject:v9 forKey:@"dateRegistered"];

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice dateEnabled](self, "dateEnabled"));
    [v18 encodeObject:v10 forKey:@"dateEnabled"];

    if (self)
    {
      [v18 encodeObject:self->_localIdentity forKey:@"localIdentity"];
      [v18 encodeObject:self->_remoteIdentity forKey:@"remoteIdentity"];
      [v18 encodeBool:self->_hasAuthenticatedWithIdentity forKey:@"hasAuthenticatedWithIdentity"];
      [v18 encodeBool:self->_hasConfirmedClassDKeys forKey:@"hasConfirmedClassDKeys"];
      [v18 encodeBool:self->_hasConfirmedClassCKeys forKey:@"hasConfirmedClassCKeys"];
      BOOL hasConfirmedClassAKeys = self->_hasConfirmedClassAKeys;
    }

    else
    {
      [v18 encodeObject:0 forKey:@"localIdentity"];
      [v18 encodeObject:0 forKey:@"remoteIdentity"];
      [v18 encodeBool:0 forKey:@"hasAuthenticatedWithIdentity"];
      [v18 encodeBool:0 forKey:@"hasConfirmedClassDKeys"];
      [v18 encodeBool:0 forKey:@"hasConfirmedClassCKeys"];
      BOOL hasConfirmedClassAKeys = 0LL;
    }

    [v18 encodeBool:hasConfirmedClassAKeys forKey:@"hasConfirmedClassAKeys"];
    objc_msgSend( v18,  "encodeBool:forKey:",  -[NRDLocalDevice hasSavedClassCKeysInKeychain](self, "hasSavedClassCKeysInKeychain"),  @"hasSavedClassCKeysInKeychain");
    if (self)
    {
      [v18 encodeInt32:self->_deviceType forKey:@"deviceType"];
      [v18 encodeObject:self->_operationalProp forKey:@"operationalProp"];
      [v18 encodeInt64:self->_localFlags forKey:@"localFlags"];
      [v18 encodeInt64:self->_remoteFlags forKey:@"remoteFlags"];
      bluetoothMACAddress = self->_bluetoothMACAddress;
    }

    else
    {
      [v18 encodeInt32:0 forKey:@"deviceType"];
      [v18 encodeObject:0 forKey:@"operationalProp"];
      [v18 encodeInt64:0 forKey:@"localFlags"];
      [v18 encodeInt64:0 forKey:@"remoteFlags"];
      bluetoothMACAddress = 0LL;
    }

    [v18 encodeObject:bluetoothMACAddress forKey:@"bluetoothMACAddress"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassD](self, "localInnerIPv6AddressBytesClassD"));
    [v18 encodeObject:v13 forKey:@"localInnerIPv6AddressBytesClassD"];

    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassD](self, "remoteInnerIPv6AddressBytesClassD"));
    [v18 encodeObject:v14 forKey:@"remoteInnerIPv6AddressBytesClassD"];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice localInnerIPv6AddressBytesClassC](self, "localInnerIPv6AddressBytesClassC"));
    [v18 encodeObject:v15 forKey:@"localInnerIPv6AddressBytesClassC"];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDLocalDevice remoteInnerIPv6AddressBytesClassC](self, "remoteInnerIPv6AddressBytesClassC"));
    [v18 encodeObject:v16 forKey:@"remoteInnerIPv6AddressBytesClassC"];

    if (self) {
      receivedProxyNotifyPayload = self->_receivedProxyNotifyPayload;
    }
    else {
      receivedProxyNotifyPayload = 0LL;
    }
    [v18 encodeObject:receivedProxyNotifyPayload forKey:@"receivedProxyNotifyPayload"];
  }

  objc_autoreleasePoolPop(v4);
}

- (void)setNrUUID:(id)a3
{
}

- (void)setBluetoothUUID:(id)a3
{
}

- (void)setIdsDeviceID:(id)a3
{
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_BOOL isEnabled = a3;
}

- (void)setHasCompletedBluetoothPairing:(BOOL)a3
{
  self->_hasCompletedBluetoothPairing = a3;
}

- (void)setLocalIdentity:(id)a3
{
}

- (void)setRemoteIdentity:(id)a3
{
}

- (void)setHasAuthenticatedWithIdentity:(BOOL)a3
{
  self->_hasAuthenticatedWithIdentity = a3;
}

- (void)setHasConfirmedClassDKeys:(BOOL)a3
{
  self->_hasConfirmedClassDKeys = a3;
}

- (void)setHasConfirmedClassCKeys:(BOOL)a3
{
  self->_hasConfirmedClassCKeys = a3;
}

- (void)setHasConfirmedClassAKeys:(BOOL)a3
{
  self->_BOOL hasConfirmedClassAKeys = a3;
}

- (void)setReceivedProxyNotifyPayload:(id)a3
{
}

- (void)setBluetoothMACAddress:(id)a3
{
}

- (void)setWasInitiallySetupUsingIDSPairing:(BOOL)a3
{
  self->_wasInitiallySetupUsingIDSPairing = a3;
}

- (void)setIsAltAccountDevice:(BOOL)a3
{
  self->_isAltAccountDevice = a3;
}

- (void)setLastSeenInnerLinkVersionHBO:(unsigned __int16)a3
{
  self->_lastSeenInnerLinkVersionHBO = a3;
}

- (void)setLastSeenName:(id)a3
{
}

- (void)setLastSeenBuildVersion:(id)a3
{
}

- (void)setLastSeenAlwaysOnWiFiSupported:(BOOL)a3
{
  self->_BOOL lastSeenAlwaysOnWiFiSupported = a3;
}

- (void)setDeviceType:(unsigned __int8)a3
{
  self->_deviceType = a3;
}

- (void)setOperationalProp:(id)a3
{
}

- (void)setLocalFlags:(unint64_t)a3
{
  self->_localFlags = a3;
}

- (void)setRemoteFlags:(unint64_t)a3
{
  self->_remoteFlags = a3;
}

- (void)setSelfManagedBluetoothPairing:(BOOL)a3
{
  self->_selfManagedBluetoothPairing = a3;
}

- (BOOL)isEmptyPairing
{
  return self->_isEmptyPairing;
}

- (int64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (void)setPairingProtocolVersion:(int64_t)a3
{
  self->_pairingProtocolVersion = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)dateRegistered
{
  return self->_dateRegistered;
}

- (void)setDateRegistered:(id)a3
{
}

- (NSDate)dateEnabled
{
  return self->_dateEnabled;
}

- (void)setDateEnabled:(id)a3
{
}

- (BOOL)hasSavedClassCKeysInKeychain
{
  return self->_hasSavedClassCKeysInKeychain;
}

- (void)setHasSavedClassCKeysInKeychain:(BOOL)a3
{
  self->_hasSavedClassCKeysInKeychain = a3;
}

- (NSData)localInnerIPv6AddressBytesClassD
{
  return self->_localInnerIPv6AddressBytesClassD;
}

- (void)setLocalInnerIPv6AddressBytesClassD:(id)a3
{
}

- (NSData)remoteInnerIPv6AddressBytesClassD
{
  return self->_remoteInnerIPv6AddressBytesClassD;
}

- (void)setRemoteInnerIPv6AddressBytesClassD:(id)a3
{
}

- (NSData)localInnerIPv6AddressBytesClassC
{
  return self->_localInnerIPv6AddressBytesClassC;
}

- (void)setLocalInnerIPv6AddressBytesClassC:(id)a3
{
}

- (NSData)remoteInnerIPv6AddressBytesClassC
{
  return self->_remoteInnerIPv6AddressBytesClassC;
}

- (void)setRemoteInnerIPv6AddressBytesClassC:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end