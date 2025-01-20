@interface IDSUTunControlMessage_Hello
- (BOOL)_isSupportIPsecLinkFlagSet;
- (BOOL)_isTinkerFlagSet;
- (IDSUTunControlMessage_Hello)init;
- (IDSUTunControlMessage_Hello)initWithBytes:(const void *)a3 length:(unint64_t)a4 loggingPrefixString:(id)a5;
- (NSNumber)capabilityFlags;
- (NSNumber)maxCompatibilityVersion;
- (NSNumber)minCompatibilityVersion;
- (NSNumber)pairingProtocolVersion;
- (NSNumber)serviceMinCompatibilityVersion;
- (NSString)controlChannelVersion;
- (NSString)model;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSUUID)deviceUniqueID;
- (NSUUID)instanceID;
- (id)data;
- (id)description;
- (void)setCapabilityFlags:(id)a3;
- (void)setControlChannelVersion:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setMaxCompatibilityVersion:(id)a3;
- (void)setMinCompatibilityVersion:(id)a3;
- (void)setModel:(id)a3;
- (void)setPairingProtocolVersion:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setServiceMinCompatibilityVersion:(id)a3;
@end

@implementation IDSUTunControlMessage_Hello

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  __int128 v12 = *(_OWORD *)&self->_productVersion;
  __int128 v13 = *(_OWORD *)&self->_controlChannelVersion;
  __int128 v11 = *(_OWORD *)&self->_model;
  __int128 v10 = *(_OWORD *)&self->_minCompatibilityVersion;
  instanceID = self->_instanceID;
  deviceUniqueID = self->_deviceUniqueID;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSUTunControlMessage_Hello _isSupportIPsecLinkFlagSet](self, "_isSupportIPsecLinkFlagSet")));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[IDSUTunControlMessage_Hello _isTinkerFlagSet](self, "_isTinkerFlagSet")));
  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"hello (controlChannelVersion: [%@], productName: [%@], productVersion: [%@], productBuildVersion: [%@], model: [%@], protocol: %@ minCompatibilityVersion: %@ maxCompatibilityVersion: %@ deviceUniqueID: %@ instanceID: %@, supportIPsecLink:%@, isTinker: %@)",  v13,  v12,  v11,  v10,  deviceUniqueID,  instanceID,  v6,  v7);

  return v8;
}

- (BOOL)_isSupportIPsecLinkFlagSet
{
  capabilityFlags = self->_capabilityFlags;
  if (capabilityFlags) {
    return (-[NSNumber unsignedLongLongValue](capabilityFlags, "unsignedLongLongValue") >> 8) & 1;
  }
  return (char)capabilityFlags;
}

- (BOOL)_isTinkerFlagSet
{
  capabilityFlags = self->_capabilityFlags;
  if (capabilityFlags) {
    return (-[NSNumber unsignedLongLongValue](capabilityFlags, "unsignedLongLongValue") >> 10) & 1;
  }
  return (char)capabilityFlags;
}

- (IDSUTunControlMessage_Hello)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSUTunControlMessage_Hello;
  return -[IDSUTunControlMessage_Hello init](&v3, "init");
}

- (id)data
{
  if (self->_controlChannelVersion
    && self->_productName
    && self->_productVersion
    && self->_productBuildVersion
    && self->_model
    && self->_capabilityFlags
    && (instanceID = self->_instanceID) != 0LL
    && self->_deviceUniqueID)
  {
    v58[0] = 0xAAAAAAAAAAAAAAAALL;
    v58[1] = 0xAAAAAAAAAAAAAAAALL;
    -[NSUUID getUUIDBytes:](instanceID, "getUUIDBytes:", v58);
    v57[0] = 0xAAAAAAAAAAAAAAAALL;
    v57[1] = 0xAAAAAAAAAAAAAAAALL;
    -[NSUUID getUUIDBytes:](self->_deviceUniqueID, "getUUIDBytes:", v57);
    controlChannelVersion = self->_controlChannelVersion;
    productName = self->_productName;
    productVersion = self->_productVersion;
    productBuildVersion = self->_productBuildVersion;
    model = self->_model;
    unsigned int v47 = -[NSNumber unsignedIntValue](self->_pairingProtocolVersion, "unsignedIntValue");
    unsigned int v9 = -[NSNumber unsignedIntValue](self->_minCompatibilityVersion, "unsignedIntValue");
    unsigned int v10 = -[NSNumber unsignedIntValue](self->_maxCompatibilityVersion, "unsignedIntValue");
    unint64_t v11 = -[NSNumber unsignedLongLongValue](self->_capabilityFlags, "unsignedLongLongValue");
    unsigned __int16 v12 = -[NSNumber unsignedShortValue](self->_serviceMinCompatibilityVersion, "unsignedShortValue");
    __int128 v13 = controlChannelVersion;
    v49 = productName;
    v14 = productVersion;
    v15 = productBuildVersion;
    v16 = model;
    unsigned int v55 = v10;
    unsigned int v56 = v9;
    unint64_t v54 = v11;
    unsigned __int16 v53 = v12;
    uint64_t v17 = _IDSLinkPacketBufferCreate( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlMessage.m",  18LL);
    *(_BYTE *)(v17 + 1297) = 1;
    v48 = v13;
    if (v13 && (v18 = -[NSString UTF8String](v13, "UTF8String")) != 0LL)
    {
      v19 = v18;
      unsigned int v20 = strlen(v18);
      *(_WORD *)(v17 + 1298) = bswap32(v20) >> 16;
      uint64_t v21 = (unsigned __int16)v20;
      if ((_WORD)v20) {
        memcpy((void *)(v17 + 1300), v19, (unsigned __int16)v20);
      }
    }

    else
    {
      uint64_t v21 = 0LL;
      *(_WORD *)(v17 + 1298) = 0;
    }

    v24 = (_WORD *)(v17 + v21 + 1300);
    if (v49 && (v25 = -[NSString UTF8String](v49, "UTF8String")) != 0LL)
    {
      v26 = v25;
      unsigned int v27 = strlen(v25);
      _WORD *v24 = bswap32(v27) >> 16;
      uint64_t v28 = (unsigned __int16)v27;
      if ((_WORD)v27) {
        memcpy(v24 + 1, v26, (unsigned __int16)v27);
      }
    }

    else
    {
      uint64_t v28 = 0LL;
      _WORD *v24 = 0;
    }

    v29 = (_WORD *)((char *)v24 + v28 + 2);
    if (v14 && (v30 = -[NSString UTF8String](v14, "UTF8String")) != 0LL)
    {
      v31 = v30;
      unsigned int v32 = strlen(v30);
      _WORD *v29 = bswap32(v32) >> 16;
      uint64_t v33 = (unsigned __int16)v32;
      if ((_WORD)v32) {
        memcpy(v29 + 1, v31, (unsigned __int16)v32);
      }
    }

    else
    {
      uint64_t v33 = 0LL;
      _WORD *v29 = 0;
    }

    uint64_t v34 = v17 + 1297;
    v35 = (_WORD *)((char *)v29 + v33 + 2);
    if (v15 && (v36 = -[NSString UTF8String](v15, "UTF8String")) != 0LL)
    {
      v37 = v36;
      unsigned int v38 = strlen(v36);
      _WORD *v35 = bswap32(v38) >> 16;
      uint64_t v39 = (unsigned __int16)v38;
      if ((_WORD)v38) {
        memcpy(v35 + 1, v37, (unsigned __int16)v38);
      }
    }

    else
    {
      uint64_t v39 = 0LL;
      _WORD *v35 = 0;
    }

    v40 = (_WORD *)((char *)v35 + v39 + 2);
    if (v16 && (v41 = -[NSString UTF8String](v16, "UTF8String")) != 0LL)
    {
      v42 = v41;
      unsigned int v43 = strlen(v41);
      _WORD *v40 = bswap32(v43) >> 16;
      uint64_t v44 = (unsigned __int16)v43;
      if ((_WORD)v43) {
        memcpy(v40 + 1, v42, (unsigned __int16)v43);
      }
    }

    else
    {
      uint64_t v44 = 0LL;
      _WORD *v40 = 0;
    }

    *(_DWORD *)((char *)v40 + v44 + 2) = bswap32(v47);
    unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v45 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v50 = v45;
    __int128 v51 = v45;
    unsigned int v55 = bswap32(v10);
    unsigned int v56 = bswap32(v9);
    IDSByteBufferInitForWriteWithAllocatedSpace( &v50,  (char *)v40 + v44 + 6,  v34 + *(void *)(v17 + 8) - ((void)v40 + v44 + 6));
    IDSByteBufferWriteField(&v50, 0LL, &v56, 4LL);
    IDSByteBufferWriteField(&v50, 1LL, &v55, 4LL);
    IDSByteBufferWriteField(&v50, 2LL, v58, 16LL);
    IDSByteBufferWriteField(&v50, 5LL, v57, 16LL);
    unint64_t v54 = bswap64(v54);
    IDSByteBufferWriteField(&v50, 3LL, &v54, 8LL);
    unsigned __int16 v53 = bswap32(v53) >> 16;
    IDSByteBufferWriteField(&v50, 4LL, &v53, 2LL);
    uint64_t v46 = v51;
    IDSByteBufferRelease(&v50);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v17 + 1297,  v46 - v34));
    _IDSLinkPacketBufferRelease( "/Library/Caches/com.apple.xbs/Sources/IdentityServices_Swift/IDSAgent/IDSUTunControlMessage.m",  47LL,  v17);
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (IDSUTunControlMessage_Hello)initWithBytes:(const void *)a3 length:(unint64_t)a4 loggingPrefixString:(id)a5
{
  id v122 = a5;
  v126.receiver = self;
  v126.super_class = (Class)&OBJC_CLASS___IDSUTunControlMessage_Hello;
  v8 = -[IDSUTunControlMessage_Hello init](&v126, "init");
  if (!v8) {
    goto LABEL_130;
  }
  if (a4)
  {
    unsigned int v9 = (unsigned int *)((char *)a3 + 1);
    unint64_t v10 = a4 - 1;
    if (a4 - 1 < 2)
    {
      v117 = 0LL;
      v118 = 0LL;
      v119 = 0LL;
      v120 = 0LL;
      v25 = 0LL;
      uint64_t v24 = 0LL;
      uint64_t v22 = 0LL;
LABEL_58:
      obj = v25;
      objc_storeStrong((id *)&v8->_controlChannelVersion, v25);
      objc_storeStrong((id *)&v8->_productName, v120);
      objc_storeStrong((id *)&v8->_productVersion, v119);
      objc_storeStrong((id *)&v8->_productBuildVersion, v118);
      objc_storeStrong((id *)&v8->_model, v117);
      uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v24));
      pairingProtocolVersion = v8->_pairingProtocolVersion;
      v8->_pairingProtocolVersion = (NSNumber *)v39;

      v41 = v8->_pairingProtocolVersion;
      p_maxCompatibilityVersion = (void **)&v8->_maxCompatibilityVersion;
      objc_storeStrong((id *)&v8->_maxCompatibilityVersion, v41);
      p_minCompatibilityVersion = (void **)&v8->_minCompatibilityVersion;
      objc_storeStrong((id *)&v8->_minCompatibilityVersion, v41);
      unsigned __int8 v125 = -86;
      v124 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
      unsigned __int16 v123 = -21846;
      unint64_t v134 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v44 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v44;
      __int128 v133 = v44;
      uint64_t v45 = OSLogHandleForTransportCategory("UTun");
      uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v127 = 134217984;
        *(void *)v128 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Optional field data byte size: %lu",  v127,  0xCu);
      }

      uint64_t v48 = os_log_shim_legacy_logging_enabled(v47);
      if ((_DWORD)v48)
      {
        if (_IDSShouldLogTransport(v48))
        {
          uint64_t v115 = v22;
          _IDSLogTransport(@"UTun", @"IDS", @"Optional field data byte size: %lu");
          if (_IDSShouldLog(0LL, @"UTun"))
          {
            uint64_t v115 = v22;
            _IDSLogV(0LL, @"IDSFoundation", @"UTun", @"Optional field data byte size: %lu");
          }
        }
      }

      IDSByteBufferInitForRead(buf, v9, v22);
      if (IDSByteBufferReadField(buf, &v125, &v124, &v123))
      {
        do
        {
          switch(v125)
          {
            case 0u:
              *(_DWORD *)v127 = -1431655766;
              sub_1000F9B54(0LL, v124, v123, v127);
              uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)v127));
              __int128 v50 = *p_minCompatibilityVersion;
              *p_minCompatibilityVersion = (void *)v49;

              break;
            case 1u:
              *(_DWORD *)v127 = -1431655766;
              sub_1000F9B54(1LL, v124, v123, v127);
              uint64_t v63 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)v127));
              v64 = *p_maxCompatibilityVersion;
              *p_maxCompatibilityVersion = (void *)v63;

              break;
            case 2u:
              if (v123 >= 0x10u)
              {
                unsigned __int16 v53 = objc_alloc(&OBJC_CLASS___NSUUID);
                unint64_t v54 = -[NSUUID initWithUUIDBytes:](v53, "initWithUUIDBytes:", v124);
                instanceID = v8->_instanceID;
                v8->_instanceID = v54;

                uint64_t v56 = OSLogHandleForTransportCategory("UTun");
                v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_instanceID, "UUIDString"));
                  *(_DWORD *)v127 = 138412290;
                  *(void *)v128 = v58;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Instance ID: %@", v127, 0xCu);
                }

                uint64_t v60 = os_log_shim_legacy_logging_enabled(v59);
                if ((_DWORD)v60)
                {
                  if (_IDSShouldLogTransport(v60))
                  {
                    uint64_t v115 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_instanceID, "UUIDString"));
                    _IDSLogTransport(@"UTun", @"IDS", @"Instance ID: %@");

                    if (_IDSShouldLog(0LL, @"UTun"))
                    {
                      uint64_t v115 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_instanceID, "UUIDString", v115));
                      _IDSLogV(0LL, @"IDSFoundation", @"UTun", @"Instance ID: %@");
                    }
                  }
                }
              }

              break;
            case 3u:
              uint64_t v61 = v123;
              if (v123 == 8)
              {
                unint64_t v62 = bswap64(*(void *)v124);
              }

              else
              {
                uint64_t v88 = OSLogHandleForTransportCategory("UTun");
                v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v127 = 67109376;
                  *(_DWORD *)v128 = v61;
                  *(_WORD *)&v128[4] = 1024;
                  *(_DWORD *)&v128[6] = 3;
                  _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "getUint64FromBytes, uint64_t should be 8 bytes, not %u bytes, field: %u",  v127,  0xEu);
                }

                uint64_t v91 = os_log_shim_legacy_logging_enabled(v90);
                if ((_DWORD)v91)
                {
                  if (_IDSShouldLogTransport(v91))
                  {
                    uint64_t v115 = v61;
                    uint64_t v116 = 3LL;
                    _IDSLogTransport( @"UTun",  @"IDS",  @"getUint64FromBytes, uint64_t should be 8 bytes, not %u bytes, field: %u");
                    if (_IDSShouldLog(0LL, @"UTun"))
                    {
                      uint64_t v115 = v61;
                      uint64_t v116 = 3LL;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun",  @"getUint64FromBytes, uint64_t should be 8 bytes, not %u bytes, field: %u");
                    }
                  }
                }

                unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
              }

              uint64_t v92 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v62,  v115));
              capabilityFlags = v8->_capabilityFlags;
              v8->_capabilityFlags = (NSNumber *)v92;

              uint64_t v94 = OSLogHandleForTransportCategory("UTun");
              v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                v96 = v8->_capabilityFlags;
                *(_DWORD *)v127 = 138412290;
                *(void *)v128 = v96;
                _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Capability flags: %@", v127, 0xCu);
              }

              uint64_t v98 = os_log_shim_legacy_logging_enabled(v97);
              if ((_DWORD)v98)
              {
                if (_IDSShouldLogTransport(v98))
                {
                  uint64_t v115 = (uint64_t)v8->_capabilityFlags;
                  _IDSLogTransport(@"UTun", @"IDS", @"Capability flags: %@");
                  if (_IDSShouldLog(0LL, @"UTun"))
                  {
                    uint64_t v115 = (uint64_t)v8->_capabilityFlags;
                    _IDSLogV(0LL, @"IDSFoundation", @"UTun", @"Capability flags: %@");
                  }
                }
              }

              break;
            case 4u:
              uint64_t v51 = v123;
              if (v123 == 2)
              {
                uint64_t v52 = bswap32(*(unsigned __int16 *)v124) >> 16;
              }

              else
              {
                uint64_t v77 = OSLogHandleForTransportCategory("UTun");
                v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v127 = 67109376;
                  *(_DWORD *)v128 = v51;
                  *(_WORD *)&v128[4] = 1024;
                  *(_DWORD *)&v128[6] = 4;
                  _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "getUint16FromBytes, uint16_t should be 2 bytes, not %u bytes, field: %u",  v127,  0xEu);
                }

                uint64_t v80 = os_log_shim_legacy_logging_enabled(v79);
                if ((_DWORD)v80)
                {
                  if (_IDSShouldLogTransport(v80))
                  {
                    uint64_t v115 = v51;
                    uint64_t v116 = 4LL;
                    _IDSLogTransport( @"UTun",  @"IDS",  @"getUint16FromBytes, uint16_t should be 2 bytes, not %u bytes, field: %u");
                    if (_IDSShouldLog(0LL, @"UTun"))
                    {
                      uint64_t v115 = v51;
                      uint64_t v116 = 4LL;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun",  @"getUint16FromBytes, uint16_t should be 2 bytes, not %u bytes, field: %u");
                    }
                  }
                }

                uint64_t v52 = 43690LL;
              }

              uint64_t v81 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  v52,  v115,  v116));
              serviceMinCompatibilityVersion = v8->_serviceMinCompatibilityVersion;
              v8->_serviceMinCompatibilityVersion = (NSNumber *)v81;

              uint64_t v83 = OSLogHandleForTransportCategory("UTun");
              v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                v85 = v8->_serviceMinCompatibilityVersion;
                *(_DWORD *)v127 = 138412290;
                *(void *)v128 = v85;
                _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "Service minimum compatibility version: %@",  v127,  0xCu);
              }

              uint64_t v87 = os_log_shim_legacy_logging_enabled(v86);
              if ((_DWORD)v87)
              {
                if (_IDSShouldLogTransport(v87))
                {
                  uint64_t v115 = (uint64_t)v8->_serviceMinCompatibilityVersion;
                  _IDSLogTransport(@"UTun", @"IDS", @"Service minimum compatibility version: %@");
                  if (_IDSShouldLog(0LL, @"UTun"))
                  {
                    uint64_t v115 = (uint64_t)v8->_serviceMinCompatibilityVersion;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"UTun",  @"Service minimum compatibility version: %@");
                  }
                }
              }

              break;
            case 5u:
              if (v123 >= 0x10u)
              {
                v65 = objc_alloc(&OBJC_CLASS___NSUUID);
                v66 = -[NSUUID initWithUUIDBytes:](v65, "initWithUUIDBytes:", v124);
                deviceUniqueID = v8->_deviceUniqueID;
                v8->_deviceUniqueID = v66;

                uint64_t v68 = OSLogHandleForTransportCategory("UTun");
                v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_deviceUniqueID, "UUIDString"));
                  *(_DWORD *)v127 = 138412290;
                  *(void *)v128 = v70;
                  _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Device uniqueID: %@", v127, 0xCu);
                }

                uint64_t v72 = os_log_shim_legacy_logging_enabled(v71);
                if ((_DWORD)v72)
                {
                  if (_IDSShouldLogTransport(v72))
                  {
                    uint64_t v115 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_deviceUniqueID, "UUIDString"));
                    _IDSLogTransport(@"UTun", @"IDS", @"Device uniqueID: %@");

                    if (_IDSShouldLog(0LL, @"UTun"))
                    {
                      uint64_t v115 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v8->_deviceUniqueID, "UUIDString", v115));
                      _IDSLogV(0LL, @"IDSFoundation", @"UTun", @"Device uniqueID: %@");
                    }
                  }
                }
              }

              break;
            default:
              uint64_t v73 = OSLogHandleForTransportCategory("UTun");
              v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v127 = 67109120;
                *(_DWORD *)v128 = v125;
                _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Unknown field type: %u", v127, 8u);
              }

              uint64_t v76 = os_log_shim_legacy_logging_enabled(v75);
              if ((_DWORD)v76)
              {
                if (_IDSShouldLogTransport(v76))
                {
                  uint64_t v115 = v125;
                  _IDSLogTransport(@"UTun", @"IDS", @"Unknown field type: %u");
                  if (_IDSShouldLog(0LL, @"UTun"))
                  {
                    uint64_t v115 = v125;
                    _IDSLogV(0LL, @"IDSFoundation", @"UTun", @"Unknown field type: %u");
                  }
                }
              }

              break;
          }
        }

        while ((IDSByteBufferReadField(buf, &v125, &v124, &v123) & 1) != 0);
      }

      IDSByteBufferRelease(buf);
      uint64_t v99 = OSLogHandleForTransportCategory("UTun");
      v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        v101 = v8->_pairingProtocolVersion;
        minCompatibilityVersion = v8->_minCompatibilityVersion;
        maxCompatibilityVersion = v8->_maxCompatibilityVersion;
        *(_DWORD *)v127 = 138412802;
        *(void *)v128 = v101;
        *(_WORD *)&v128[8] = 2112;
        v129 = minCompatibilityVersion;
        __int16 v130 = 2112;
        v131 = maxCompatibilityVersion;
        _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "ProtocolVersion: %@, min/max: %@ %@",  v127,  0x20u);
      }

      uint64_t v105 = os_log_shim_legacy_logging_enabled(v104);
      if ((_DWORD)v105)
      {
        if (_IDSShouldLogTransport(v105))
        {
          _IDSLogTransport(@"UTun", @"IDS", @"ProtocolVersion: %@, min/max: %@ %@");
        }
      }

      int v38 = 0;
LABEL_126:

LABEL_127:
      goto LABEL_128;
    }

    obj = 0LL;
    uint64_t v11 = __rev16(*(unsigned __int16 *)((char *)a3 + 1));
    if ((_DWORD)v11)
    {
      unsigned int v12 = a4 - 3 - v11;
      if ((int)a4 - 3 >= (int)v11)
      {
        obj = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  (char *)a3 + 3,  v11,  4LL);
        if (!obj)
        {
          uint64_t v26 = OSLogHandleForTransportCategory("IDSNetworking");
          unsigned int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v122;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%@: control message: hello cannot decode controlChannelVersion",  buf,  0xCu);
          }

          uint64_t v29 = os_log_shim_legacy_logging_enabled(v28);
          if ((_DWORD)v29)
          {
            if (_IDSShouldLogTransport(v29))
            {
              _IDSLogTransport( @"IDSNetworking",  @"IDS",  @"%@: control message: hello cannot decode controlChannelVersion");
              if (_IDSShouldLog(0LL, @"IDSNetworking")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNetworking",  @"%@: control message: hello cannot decode controlChannelVersion");
              }
            }
          }

          goto LABEL_129;
        }

        unsigned int v9 = (unsigned int *)((char *)a3 + v11 + 3);
        if (v12 < 2)
        {
          v117 = 0LL;
          v119 = 0LL;
          v120 = 0LL;
          goto LABEL_55;
        }

        unint64_t v10 = (int)v12;
      }
    }

    v120 = 0LL;
    uint64_t v13 = __rev16(*(unsigned __int16 *)v9);
    if ((_DWORD)v13)
    {
      int v14 = v10 - 2 - v13;
      if ((int)v10 - 2 >= (int)v13)
      {
        v120 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  (char *)v9 + 2,  v13,  4LL);
        if (!v120)
        {
          uint64_t v30 = OSLogHandleForTransportCategory("IDSNetworking");
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v122;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%@: control message: hello cannot decode productName",  buf,  0xCu);
          }

          uint64_t v33 = os_log_shim_legacy_logging_enabled(v32);
          if ((_DWORD)v33)
          {
            if (_IDSShouldLogTransport(v33))
            {
              _IDSLogTransport( @"IDSNetworking",  @"IDS",  @"%@: control message: hello cannot decode productName");
              if (_IDSShouldLog(0LL, @"IDSNetworking")) {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNetworking",  @"%@: control message: hello cannot decode productName");
              }
            }
          }

          goto LABEL_129;
        }

        unsigned int v9 = (unsigned int *)((char *)v9 + v13 + 2);
        unint64_t v10 = v14;
      }
    }

    if (v10 < 2)
    {
      v117 = 0LL;
      v119 = 0LL;
    }

    else
    {
      v119 = 0LL;
      uint64_t v15 = __rev16(*(unsigned __int16 *)v9);
      int v16 = v10 - 2;
      if (!(_DWORD)v15 || (unsigned int v17 = v16 - v15, v16 < (int)v15))
      {
LABEL_19:
        v118 = 0LL;
        uint64_t v18 = __rev16(*(unsigned __int16 *)v9);
        if ((_DWORD)v18)
        {
          int v19 = v16 - v18;
          if (v16 >= (int)v18)
          {
            v118 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  (char *)v9 + 2,  v18,  4LL);
            if (!v118)
            {
              uint64_t v107 = OSLogHandleForTransportCategory("IDSNetworking");
              v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
              if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v122;
                _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "%@: control message: hello cannot decode productBuildVersion",  buf,  0xCu);
              }

              uint64_t v110 = os_log_shim_legacy_logging_enabled(v109);
              if ((_DWORD)v110)
              {
                if (_IDSShouldLogTransport(v110))
                {
                  _IDSLogTransport( @"IDSNetworking",  @"IDS",  @"%@: control message: hello cannot decode productBuildVersion");
                  if (_IDSShouldLog(0LL, @"IDSNetworking")) {
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNetworking",  @"%@: control message: hello cannot decode productBuildVersion");
                  }
                }
              }

              int v38 = 1;
              goto LABEL_127;
            }

            unsigned int v9 = (unsigned int *)((char *)v9 + v18 + 2);
            unint64_t v10 = v19;
          }
        }

        if (v10 < 2)
        {
          v117 = 0LL;
        }

        else
        {
          v117 = 0LL;
          uint64_t v20 = __rev16(*(unsigned __int16 *)v9);
          if ((_DWORD)v20)
          {
            int v21 = v10 - 2 - v20;
            if ((int)v10 - 2 >= (int)v20)
            {
              v117 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  (char *)v9 + 2,  v20,  4LL);
              if (!v117)
              {
                uint64_t v111 = OSLogHandleForTransportCategory("IDSNetworking");
                v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v122;
                  _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEFAULT,  "%@: control message: hello cannot decode model",  buf,  0xCu);
                }

                uint64_t v114 = os_log_shim_legacy_logging_enabled(v113);
                if ((_DWORD)v114)
                {
                  if (_IDSShouldLogTransport(v114))
                  {
                    _IDSLogTransport( @"IDSNetworking",  @"IDS",  @"%@: control message: hello cannot decode model");
                    if (_IDSShouldLog(0LL, @"IDSNetworking")) {
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSNetworking",  @"%@: control message: hello cannot decode model");
                    }
                  }
                }

                int v38 = 1;
                goto LABEL_126;
              }

              unsigned int v9 = (unsigned int *)((char *)v9 + v20 + 2);
              unint64_t v10 = v21;
            }
          }

          uint64_t v22 = v10 - 4;
          if (v10 >= 4)
          {
            unsigned int v23 = *v9++;
            uint64_t v24 = bswap32(v23);
LABEL_57:
            v25 = obj;
            goto LABEL_58;
          }
        }

- (NSString)controlChannelVersion
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setControlChannelVersion:(id)a3
{
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProductName:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setModel:(id)a3
{
}

- (NSNumber)pairingProtocolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPairingProtocolVersion:(id)a3
{
}

- (NSNumber)minCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMinCompatibilityVersion:(id)a3
{
}

- (NSNumber)maxCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setMaxCompatibilityVersion:(id)a3
{
}

- (NSNumber)capabilityFlags
{
  return (NSNumber *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCapabilityFlags:(id)a3
{
}

- (NSNumber)serviceMinCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setServiceMinCompatibilityVersion:(id)a3
{
}

- (NSUUID)instanceID
{
  return (NSUUID *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setInstanceID:(id)a3
{
}

- (NSUUID)deviceUniqueID
{
  return (NSUUID *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end