@interface SDActivityDeviceRecord
- ($126081439F6B1623D1821CF14B226F9E)lastActivityAdvertisement;
- (BOOL)deviceTracked;
- (BOOL)disableDuplicateFilterOnce;
- (IDSDevice)idsDevice;
- (NSData)lastAdvertisementData;
- (NSData)lastAdvertisementPayload;
- (NSData)lastRawAdvertisementData;
- (NSDictionary)lastAdvertisementOptions;
- (NSUUID)lastUsedKeyIdentifier;
- (SDActivityDecryptionKey)decryptionKey;
- (SDActivityDeviceRecord)initWithDevice:(id)a3;
- (SFActivityAdvertisement)clientAdvertisement;
- (id)description;
- (unsigned)lastCounter;
- (void)setDeviceTracked:(BOOL)a3;
- (void)setDisableDuplicateFilterOnce:(BOOL)a3;
- (void)setIdsDevice:(id)a3;
- (void)setLastUsedKeyIdentifier:(id)a3;
- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 isReplay:(BOOL)a5 newAdvertisementHandler:(id)a6;
- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 newAdvertisementHandler:(id)a5;
@end

@implementation SDActivityDeviceRecord

- (SDActivityDeviceRecord)initWithDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SDActivityDeviceRecord;
    v6 = -[SDActivityDeviceRecord init](&v10, "init");
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_idsDevice, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
  v8 = @"YES";
  if (!v7) {
    v8 = @"NO";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, deviceUniqueID:%@, hasKey:%@, lastReceivedAdvertisementDate:%@>",  v5,  self,  v6,  v8,  self->_lastReceivedAdvertisementDate));

  return v9;
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 newAdvertisementHandler:(id)a5
{
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 isReplay:(BOOL)a5 newAdvertisementHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (void (**)(id, void *, void))a6;
  if (!-[NSData isEqual:](self->_lastRawAdvertisementData, "isEqual:", v10)
    || self->_disableDuplicateFilterOnce
    || v7)
  {
    uint64_t v75 = sub_1000852AC(v10);
    int v76 = v12;
    __int16 v77 = v13;
    if (!a4)
    {
      v35 = (NSData *)[v10 copy];
      lastRawAdvertisementData = self->_lastRawAdvertisementData;
      self->_lastRawAdvertisementData = v35;

      v37 = objc_opt_new(&OBJC_CLASS___NSDate);
      lastReceivedAdvertisementDate = self->_lastReceivedAdvertisementDate;
      self->_lastReceivedAdvertisementDate = v37;

      v39 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v75, 14LL));
      lastAdvertisementData = self->_lastAdvertisementData;
      self->_lastAdvertisementData = v39;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord clientAdvertisement](self, "clientAdvertisement"));
      v11[2](v11, v16, 0LL);
LABEL_23:

      goto LABEL_24;
    }

    uint64_t v14 = handoff_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v60 = SFHexStringForData(v10);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      uint64_t v62 = objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
      v63 = (void *)v62;
      v64 = @"NO";
      BOOL disableDuplicateFilterOnce = self->_disableDuplicateFilterOnce;
      *(_DWORD *)buf = 138413058;
      *(void *)v81 = v61;
      if (v7) {
        v66 = @"YES";
      }
      else {
        v66 = @"NO";
      }
      *(_WORD *)&v81[8] = 2112;
      if (disableDuplicateFilterOnce) {
        v64 = @"YES";
      }
      *(void *)v82 = v62;
      *(_WORD *)&v82[8] = 2112;
      *(void *)v83 = v66;
      *(_WORD *)&v83[8] = 2112;
      v84 = v64;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Received a new rawAdvertisementData %@ from %@ (isReplay:%@, disabledDuplicateFilter:%@)",  buf,  0x2Au);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
    unsigned int v17 = sub_100085348(v75);
    if (v16)
    {
      if (self->_disableDuplicateFilterOnce && v17 == -[SDActivityDeviceRecord lastCounter](self, "lastCounter")
        || v17 > -[SDActivityDeviceRecord lastCounter](self, "lastCounter"))
      {
        self->_BOOL disableDuplicateFilterOnce = 0;
        v18 = (NSData *)[v10 copy];
        v19 = self->_lastRawAdvertisementData;
        self->_lastRawAdvertisementData = v18;

        uint64_t v67 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", (char *)&v75 + 4, 10LL));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
        unsigned __int8 v21 = [v20 getResultWhileDecryptingBytesInPlace:(char *)&v75 + 4 andCounter:(char *)&v75 + 1 withTag:BYTE3(v75) version:v75];

        if ((v21 & 1) != 0)
        {
          v22 = objc_opt_new(&OBJC_CLASS___NSDate);
          v23 = self->_lastReceivedAdvertisementDate;
          self->_lastReceivedAdvertisementDate = v22;

          v24 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v75, 14LL));
          v25 = self->_lastAdvertisementData;
          self->_lastAdvertisementData = v24;

          uint64_t v26 = handoff_log();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)v67;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = SFHexStringForData(v67);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            uint64_t v31 = SFHexStringForData(self->_lastAdvertisementData);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            unsigned int v33 = -[SDActivityDeviceRecord lastCounter](self, "lastCounter");
            *(_DWORD *)buf = 138412802;
            *(void *)v81 = v30;
            *(_WORD *)&v81[8] = 2112;
            *(void *)v82 = v32;
            *(_WORD *)&v82[8] = 1024;
            *(_DWORD *)v83 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Successfully decrypted advertisement (sharing flags + advertisementPayload): %@ => %@, counter: %u",  buf,  0x1Cu);
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord clientAdvertisement](self, "clientAdvertisement"));
          v11[2](v11, v34, 0LL);
          goto LABEL_22;
        }

        uint64_t v57 = handoff_log();
        v52 = (NSData *)objc_claimAutoreleasedReturnValue(v57);
        BOOL v58 = os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v58) {
            sub_1000241FC((uint64_t)self, (uint64_t)v10);
          }

          NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
          v79 = @"Failed to decrypt advertisement";
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
          v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  94LL,  v34));
          ((void (**)(id, void *, void *))v11)[2](v11, 0LL, v59);

          goto LABEL_21;
        }

        if (v58) {
          sub_100024294((uint64_t)self, (uint64_t)v10);
        }
LABEL_20:

        v53 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityPayloadManager sharedPayloadManager]( &OBJC_CLASS___SDActivityPayloadManager,  "sharedPayloadManager"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
        v56 = (void *)objc_claimAutoreleasedReturnValue([v55 keyIdentifier]);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_100023B70;
        v68[3] = &unk_1005CB560;
        id v69 = v16;
        v70 = self;
        id v71 = v10;
        BOOL v74 = a4;
        v72 = v11;
        __int16 v73 = v17;
        [v53 sendEncryptionKeyRequestToDeviceIdentifier:v54 previousKeyIdentifier:v56 completionHandler:v68];

        v34 = v69;
LABEL_21:
        v28 = (void *)v67;
LABEL_22:

        goto LABEL_23;
      }

      uint64_t v46 = handoff_log();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v47 = -[SDActivityDeviceRecord lastCounter](self, "lastCounter");
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
        uint64_t v49 = SFHexStringForData(v10);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v81 = v17;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = v47;
        *(_WORD *)v82 = 2112;
        *(void *)&v82[2] = v48;
        *(_WORD *)v83 = 2112;
        *(void *)&v83[2] = v50;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "New counter %d is not greater than previous %d from %@ with rawAdvertisementData %@. Requesting new key",  buf,  0x22u);
      }
    }

    else
    {
      uint64_t v41 = handoff_log();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueID](self->_idsDevice, "uniqueID"));
        uint64_t v44 = SFHexStringForData(v10);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        *(_DWORD *)buf = 138412546;
        *(void *)v81 = v43;
        *(_WORD *)&v81[8] = 2112;
        *(void *)v82 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "No current key to decrypt advertisement from %@ with rawAdvertisementData %@. Requesting key",  buf,  0x16u);
      }
    }

    self->_BOOL disableDuplicateFilterOnce = 0;
    v51 = (NSData *)[v10 copy];
    uint64_t v67 = 0LL;
    v52 = self->_lastRawAdvertisementData;
    self->_lastRawAdvertisementData = v51;
    goto LABEL_20;
  }

- (SDActivityDecryptionKey)decryptionKey
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SDActivityEncryptionManager sharedEncryptionManager]( &OBJC_CLASS___SDActivityEncryptionManager,  "sharedEncryptionManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDevice uniqueIDOverride](self->_idsDevice, "uniqueIDOverride"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 decryptionKeyForDeviceIdentifier:v4]);

  lastUsedKeyIdentifier = self->_lastUsedKeyIdentifier;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 keyIdentifier]);
  LOBYTE(lastUsedKeyIdentifier) = -[NSUUID isEqual:](lastUsedKeyIdentifier, "isEqual:", v7);

  if ((lastUsedKeyIdentifier & 1) == 0)
  {
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue([v5 keyIdentifier]);
    v9 = self->_lastUsedKeyIdentifier;
    self->_lastUsedKeyIdentifier = v8;

    lastAdvertisementData = self->_lastAdvertisementData;
    self->_lastAdvertisementData = 0LL;
  }

  return (SDActivityDecryptionKey *)v5;
}

- ($126081439F6B1623D1821CF14B226F9E)lastActivityAdvertisement
{
  lastAdvertisementData = self->_lastAdvertisementData;
  if (!lastAdvertisementData) {
    lastAdvertisementData = self->_lastRawAdvertisementData;
  }
  uint64_t v4 = sub_1000852AC(lastAdvertisementData);
  uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
  result.var8 = v6;
  result.var9 = BYTE1(v6);
  result.var10 = BYTE2(v6);
  result.var11 = BYTE3(v6);
  result.var12 = BYTE4(v6);
  result.var13 = BYTE5(v6);
  result.var0 = v4;
  result.var1 = BYTE1(v4);
  result.var2 = BYTE2(v4);
  result.var3 = BYTE3(v4);
  result.var4 = BYTE4(v4);
  result.var5 = BYTE5(v4);
  result.var6 = BYTE6(v4);
  result.var7 = HIBYTE(v4);
  return result;
}

- (unsigned)lastCounter
{
  if (self->_lastAdvertisementData) {
    return sub_100085348(-[SDActivityDeviceRecord lastActivityAdvertisement]( self,  "lastActivityAdvertisement"));
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord decryptionKey](self, "decryptionKey"));
    LOWORD(v4) = (unsigned __int16)[v5 lastUsedCounter] - 1;
  }

  return (unsigned __int16)v4;
}

- (NSData)lastAdvertisementPayload
{
  if (self->_lastAdvertisementData)
  {
    id v2 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
    id v4 = sub_100085350((uint64_t)v2, v3 & 0xFFFFFFFFFFFFLL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return (NSData *)v5;
}

- (NSDictionary)lastAdvertisementOptions
{
  if (self->_lastAdvertisementData)
  {
    id v3 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
    uint64_t v5 = sub_1000853B4( (unint64_t)v3,  v4 & 0xFFFFFFFFFFFFLL,  (int)-[IDSDevice isDefaultPairedDevice](self->_idsDevice, "isDefaultPairedDevice"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return (NSDictionary *)v6;
}

- (SFActivityAdvertisement)clientAdvertisement
{
  id v3 = sub_1000854EC(self->_idsDevice);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___SFActivityAdvertisement);
  uint64_t v6 = -[SDActivityDeviceRecord lastActivityAdvertisement](self, "lastActivityAdvertisement");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord lastAdvertisementPayload](self, "lastAdvertisementPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityDeviceRecord lastAdvertisementOptions](self, "lastAdvertisementOptions"));
  v9 = -[SFActivityAdvertisement initWithAdvertisementVersion:advertisementPayload:options:device:]( v5,  "initWithAdvertisementVersion:advertisementPayload:options:device:",  v6,  v7,  v8,  v4);

  return v9;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
}

- (BOOL)deviceTracked
{
  return self->_deviceTracked;
}

- (void)setDeviceTracked:(BOOL)a3
{
  self->_deviceTracked = a3;
}

- (BOOL)disableDuplicateFilterOnce
{
  return self->_disableDuplicateFilterOnce;
}

- (void)setDisableDuplicateFilterOnce:(BOOL)a3
{
  self->_BOOL disableDuplicateFilterOnce = a3;
}

- (NSData)lastRawAdvertisementData
{
  return self->_lastRawAdvertisementData;
}

- (NSUUID)lastUsedKeyIdentifier
{
  return self->_lastUsedKeyIdentifier;
}

- (void)setLastUsedKeyIdentifier:(id)a3
{
}

- (NSData)lastAdvertisementData
{
  return self->_lastAdvertisementData;
}

- (void).cxx_destruct
{
}

@end