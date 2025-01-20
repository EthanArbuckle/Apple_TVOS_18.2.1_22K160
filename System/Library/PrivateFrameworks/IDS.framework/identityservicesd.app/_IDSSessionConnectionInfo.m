@interface _IDSSessionConnectionInfo
- (BOOL)inviteNeedsDelivery;
- (BOOL)isAudioPaused;
- (BOOL)isBeingHandedOff;
- (BOOL)isFinished;
- (BOOL)isReinitiate;
- (BOOL)isVideoPaused;
- (NSData)localCallInfoData;
- (NSData)localICEData;
- (NSData)localNATIP;
- (NSData)localSKEData;
- (NSData)remoteCallInfoData;
- (NSData)remoteICEData;
- (NSData)remoteNATIP;
- (NSData)remoteSKEData;
- (NSDictionary)relayCancel;
- (NSDictionary)relayInitiate;
- (NSDictionary)relayUpdate;
- (NSNumber)localNATType;
- (NSNumber)remoteNATType;
- (NSString)localCN;
- (NSString)peerCN;
- (_IDSSessionConnectionInfo)init;
- (id)description;
- (int64_t)state;
- (unint64_t)localConnectionType;
- (unint64_t)remoteConnectionType;
- (unsigned)_numberOfOutagesSinceInterval:(double)a3;
- (unsigned)callID;
- (void)_addRemotePacketOutage;
- (void)setCallID:(unsigned int)a3;
- (void)setInviteNeedsDelivery:(BOOL)a3;
- (void)setIsBeingHandedOff:(BOOL)a3;
- (void)setIsReinitiate:(BOOL)a3;
- (void)setIsVideoPaused:(BOOL)a3;
- (void)setLocalCN:(id)a3;
- (void)setLocalCallInfoData:(id)a3;
- (void)setLocalConnectionType:(unint64_t)a3;
- (void)setLocalICEData:(id)a3;
- (void)setLocalNATIP:(id)a3;
- (void)setLocalNATType:(id)a3;
- (void)setLocalSKEData:(id)a3;
- (void)setPeerCN:(id)a3;
- (void)setRelayCancel:(id)a3;
- (void)setRelayInitiate:(id)a3;
- (void)setRelayUpdate:(id)a3;
- (void)setRemoteCallInfoData:(id)a3;
- (void)setRemoteConnectionType:(unint64_t)a3;
- (void)setRemoteICEData:(id)a3;
- (void)setRemoteNATIP:(id)a3;
- (void)setRemoteNATType:(id)a3;
- (void)setRemoteSKEData:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _IDSSessionConnectionInfo

- (_IDSSessionConnectionInfo)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____IDSSessionConnectionInfo;
  v2 = -[_IDSSessionConnectionInfo init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v2->_state = 0LL;
    if (qword_1009C0800 != -1) {
      dispatch_once(&qword_1009C0800, &stru_1008FF2A8);
    }
    id v4 = [(id)qword_1009C0808 copyIdentity];
    if (v4)
    {
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      if (qword_1009C0818 != -1) {
        dispatch_once(&qword_1009C0818, &stru_1008FF2C8);
      }
      v5 = 0LL;
      if (!off_1009C0810(v4, &cf) && cf)
      {
        if (qword_1009C0828 != -1) {
          dispatch_once(&qword_1009C0828, &stru_1008FF2E8);
        }
        v6 = (NSString *)off_1009C0820(cf);
        uint64_t v7 = OSLogHandleForIDSCategory("IDSSessionConnectionInfo");
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "array_ref = %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v9)
          && _IDSShouldLog(1LL, @"IDSSessionConnectionInfo"))
        {
          v16 = v6;
          _IDSLogV(1LL, @"IDSFoundation", @"IDSSessionConnectionInfo", @"array_ref = %@");
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString firstObject](v6, "firstObject", v16));
        v5 = (NSString *)[v10 copy];

        if (v6) {
          CFRelease(v6);
        }
        CFRelease(cf);
      }

      CFRelease(v4);
    }

    else
    {
      v5 = 0LL;
    }

    uint64_t v11 = OSLogHandleForIDSCategory("IDSSessionConnectionInfo");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "firstCommonName = %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(1LL, @"IDSSessionConnectionInfo"))
    {
      _IDSLogV(1LL, @"IDSFoundation", @"IDSSessionConnectionInfo", @"firstCommonName = %@");
    }

    localCN = v3->_localCN;
    v3->_localCN = v5;
  }

  return v3;
}

- (BOOL)isFinished
{
  return self->_state == 4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____IDSSessionConnectionInfo;
  id v3 = -[_IDSSessionConnectionInfo description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:state = %d, isFinished = %d, isBeingHandedOff = %d, callID = %d, state = %d, inviteNeedsDelivery = %d",  v4,  -[_IDSSessionConnectionInfo state](self, "state"),  -[_IDSSessionConnectionInfo isFinished](self, "isFinished"),  -[_IDSSessionConnectionInfo isBeingHandedOff](self, "isBeingHandedOff"),  self->_callID,  self->_state,  self->_inviteNeedsDelivery));

  return v5;
}

- (void)_addRemotePacketOutage
{
  remotePacketOutageTimes = self->_remotePacketOutageTimes;
  if (!remotePacketOutageTimes)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v5 = self->_remotePacketOutageTimes;
    self->_remotePacketOutageTimes = v4;

    remotePacketOutageTimes = self->_remotePacketOutageTimes;
  }

  v6 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", IMTimeOfDay(self));
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  -[NSMutableArray addObject:](remotePacketOutageTimes, "addObject:", v7);
}

- (unsigned)_numberOfOutagesSinceInterval:(double)a3
{
  if (!self->_remotePacketOutageTimes)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    remotePacketOutageTimes = self->_remotePacketOutageTimes;
    self->_remotePacketOutageTimes = v5;
  }

  double v7 = IMTimeOfDay(self);
  v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 0LL);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v9 = self->_remotePacketOutageTimes;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        objc_msgSend(v14, "doubleValue", (void)v18);
        if (v7 - v15 > a3) {
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        }
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    }

    while (v11);
  }

  -[NSMutableArray removeObjectsInArray:](self->_remotePacketOutageTimes, "removeObjectsInArray:", v8);
  unsigned int v16 = -[NSMutableArray count](self->_remotePacketOutageTimes, "count");

  return v16;
}

- (NSDictionary)relayInitiate
{
  return self->_relayInitiate;
}

- (void)setRelayInitiate:(id)a3
{
}

- (NSDictionary)relayUpdate
{
  return self->_relayUpdate;
}

- (void)setRelayUpdate:(id)a3
{
}

- (NSDictionary)relayCancel
{
  return self->_relayCancel;
}

- (void)setRelayCancel:(id)a3
{
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isBeingHandedOff
{
  return self->_isBeingHandedOff;
}

- (void)setIsBeingHandedOff:(BOOL)a3
{
  self->_isBeingHandedOff = a3;
}

- (NSData)remoteICEData
{
  return self->_remoteICEData;
}

- (void)setRemoteICEData:(id)a3
{
}

- (NSData)localICEData
{
  return self->_localICEData;
}

- (void)setLocalICEData:(id)a3
{
}

- (NSData)localSKEData
{
  return self->_localSKEData;
}

- (void)setLocalSKEData:(id)a3
{
}

- (NSData)remoteSKEData
{
  return self->_remoteSKEData;
}

- (void)setRemoteSKEData:(id)a3
{
}

- (NSData)localCallInfoData
{
  return self->_localCallInfoData;
}

- (void)setLocalCallInfoData:(id)a3
{
}

- (NSData)remoteCallInfoData
{
  return self->_remoteCallInfoData;
}

- (void)setRemoteCallInfoData:(id)a3
{
}

- (NSString)localCN
{
  return self->_localCN;
}

- (void)setLocalCN:(id)a3
{
}

- (NSString)peerCN
{
  return self->_peerCN;
}

- (void)setPeerCN:(id)a3
{
}

- (NSNumber)localNATType
{
  return self->_localNATType;
}

- (void)setLocalNATType:(id)a3
{
}

- (NSNumber)remoteNATType
{
  return self->_remoteNATType;
}

- (void)setRemoteNATType:(id)a3
{
}

- (NSData)localNATIP
{
  return self->_localNATIP;
}

- (void)setLocalNATIP:(id)a3
{
}

- (NSData)remoteNATIP
{
  return self->_remoteNATIP;
}

- (void)setRemoteNATIP:(id)a3
{
}

- (BOOL)isAudioPaused
{
  return self->_isAudioPaused;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isReinitiate
{
  return self->_isReinitiate;
}

- (void)setIsReinitiate:(BOOL)a3
{
  self->_isReinitiate = a3;
}

- (unint64_t)localConnectionType
{
  return self->_localConnectionType;
}

- (void)setLocalConnectionType:(unint64_t)a3
{
  self->_localConnectionType = a3;
}

- (unint64_t)remoteConnectionType
{
  return self->_remoteConnectionType;
}

- (void)setRemoteConnectionType:(unint64_t)a3
{
  self->_remoteConnectionType = a3;
}

- (BOOL)inviteNeedsDelivery
{
  return self->_inviteNeedsDelivery;
}

- (void)setInviteNeedsDelivery:(BOOL)a3
{
  self->_inviteNeedsDelivery = a3;
}

- (void).cxx_destruct
{
}

@end