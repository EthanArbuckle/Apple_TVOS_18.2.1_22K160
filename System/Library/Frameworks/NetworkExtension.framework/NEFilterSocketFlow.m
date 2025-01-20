@interface NEFilterSocketFlow
+ (BOOL)supportsSecureCoding;
+ (void)writeMessageWithControlSocket:(int)a3 drop:(uint64_t)a4 socketID:(uint64_t)a5 inboundPassOffset:(uint64_t)a6 inboundPeekOffset:(uint64_t)a7 outboundPassOffset:(uint64_t)a8 outboundPeekOffset:(uint64_t)a9 statsReportFrequency:;
- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6;
- (NEFilterSocketFlow)initWithCoder:(id)a3;
- (NSString)remoteHostname;
- (NSUUID)euuid;
- (NSUUID)ruuid;
- (NSUUID)uuid;
- (NWEndpoint)localEndpoint;
- (NWEndpoint)remoteEndpoint;
- (OS_nw_endpoint)localFlowEndpoint;
- (OS_nw_endpoint)remoteFlowEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)identifier;
- (id)identifierString;
- (int)socketFamily;
- (int)socketProtocol;
- (int)socketType;
- (void)encodeWithCoder:(id)a3;
- (void)initWithSocketFamily:(int)a3 socketType:(int)a4 socketProtocol:(uint64_t)a5 pid:(uint64_t)a6 epid:(uint64_t)a7 uuid:(uint64_t)a8 euuid:(uint64_t)a9 socketID:;
- (void)setEuuid:(id)a3;
- (void)setLocalAddress:(void *)a1;
- (void)setLocalFlowEndpoint:(id)a3;
- (void)setRemoteAddress:(void *)a1;
- (void)setRemoteFlowEndpoint:(id)a3;
- (void)setRemoteHostname:(id)a3;
- (void)setRuuid:(id)a3;
- (void)setSocketFamily:(int)socketFamily;
- (void)setSocketProtocol:(int)socketProtocol;
- (void)setSocketType:(int)socketType;
- (void)setUuid:(id)a3;
- (void)writeXPCMessage:(int)a3 drop:(uint64_t)a4 inboundPassOffset:(uint64_t)a5 inboundPeekOffset:(uint64_t)a6 outboundPassOffset:(uint64_t)a7 outboundPeekOffset:(uint64_t)a8 statsReportFrequency:;
@end

@implementation NEFilterSocketFlow

- (NEFilterSocketFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
  v5 = -[NEFilterFlow initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NEFilterSocketFlow setSocketFamily:]( v5,  "setSocketFamily:",  [v4 decodeIntForKey:@"SocketFamily"]);
    -[NEFilterSocketFlow setSocketType:]( v5,  "setSocketType:",  [v4 decodeIntForKey:@"SocketType"]);
    -[NEFilterSocketFlow setSocketProtocol:]( v5,  "setSocketProtocol:",  [v4 decodeIntForKey:@"SocketProtocol"]);
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setUuid:](v5, "setUuid:", v6);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EUUID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setEuuid:](v5, "setEuuid:", v7);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalEndpoint"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)[v8 copyCEndpoint];
    -[NEFilterSocketFlow setLocalFlowEndpoint:](v5, "setLocalFlowEndpoint:", v9);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteEndpoint"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)[v10 copyCEndpoint];
    -[NEFilterSocketFlow setRemoteFlowEndpoint:](v5, "setRemoteFlowEndpoint:", v11);

    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteHostname"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEFilterSocketFlow setRemoteHostname:](v5, "setRemoteHostname:", v12);

    v5->_socketID = [v4 decodeInt64ForKey:@"SocketID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
  -[NEFilterFlow encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"), @"SocketFamily");
  objc_msgSend(v4, "encodeInt:forKey:", -[NEFilterSocketFlow socketType](self, "socketType"), @"SocketType");
  objc_msgSend( v4,  "encodeInt:forKey:",  -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"),  @"SocketProtocol");
  v5 = -[NEFilterSocketFlow uuid](self, "uuid");
  [v4 encodeObject:v5 forKey:@"UUID"];
  v6 = -[NEFilterSocketFlow euuid](self, "euuid");
  [v4 encodeObject:v6 forKey:@"EUUID"];
  v7 = -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  if (v7)
  {
    v8 = (void *)MEMORY[0x189608DF0];
    v9 = -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
    [v8 endpointWithCEndpoint:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v10 forKey:@"LocalEndpoint"];
  }
  v11 = -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  if (v11)
  {
    v12 = (void *)MEMORY[0x189608DF0];
    v13 = -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
    [v12 endpointWithCEndpoint:v13];
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v14 forKey:@"RemoteEndpoint"];
  }
  v15 = -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  [v4 encodeObject:v15 forKey:@"RemoteHostname"];

  if (self) {
    unint64_t socketID = self->_socketID;
  }
  else {
    unint64_t socketID = 0LL;
  }
  [v4 encodeInt64:socketID forKey:@"SocketID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
  id v4 = -[NEFilterFlow copyWithZone:](&v12, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSocketFamily:", -[NEFilterSocketFlow socketFamily](self, "socketFamily"));
  objc_msgSend(v4, "setSocketType:", -[NEFilterSocketFlow socketType](self, "socketType"));
  objc_msgSend(v4, "setSocketProtocol:", -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"));
  v5 = -[NEFilterSocketFlow uuid](self, "uuid");
  [v4 setUuid:v5];
  v6 = -[NEFilterSocketFlow euuid](self, "euuid");
  [v4 setEuuid:v6];
  v7 = -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  [v4 setLocalFlowEndpoint:v7];
  v8 = -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  [v4 setRemoteFlowEndpoint:v8];
  v9 = -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  [v4 setRemoteHostname:v9];

  if (!self)
  {
    unint64_t socketID = 0LL;
    if (!v4) {
      return v4;
    }
    goto LABEL_3;
  }

  unint64_t socketID = self->_socketID;
  if (v4) {
LABEL_3:
  }
    v4[25] = socketID;
  return v4;
}

- (NWEndpoint)remoteEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = (void *)MEMORY[0x189608DF0];
    v5 = -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
    [v4 endpointWithCEndpoint:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return (NWEndpoint *)v6;
}

- (NWEndpoint)localEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v4 = (void *)MEMORY[0x189608DF0];
    v5 = -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
    [v4 endpointWithCEndpoint:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = 0LL;
  }

  return (NWEndpoint *)v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
  v7 = -[NEFilterFlow descriptionWithIndent:options:](&v18, sel_descriptionWithIndent_options_);
  if (!self)
  {
    id v8 = objc_alloc(NSString);
    unint64_t socketID = 0LL;
    goto LABEL_4;
  }

  if (self->_socketID != -1LL)
  {
    id v8 = objc_alloc(NSString);
    unint64_t socketID = self->_socketID;
LABEL_4:
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", @"%llx", socketID);
    [v7 appendPrettyObject:v10 withName:@"socketID" andIndent:v5 options:a4];
  }
  v11 = -[NEFilterSocketFlow localFlowEndpoint](self, "localFlowEndpoint");
  [v7 appendPrettyObject:v11 withName:@"localEndpoint" andIndent:v5 options:a4 | 1];

  -[NEFilterSocketFlow remoteFlowEndpoint](self, "remoteFlowEndpoint");
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"remoteEndpoint" andIndent:v5 options:a4 | 1];
  v13 = -[NEFilterSocketFlow remoteHostname](self, "remoteHostname");
  [v7 appendPrettyObject:v13 withName:@"remoteHostname" andIndent:v5 options:a4 | 1];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterSocketFlow socketProtocol](self, "socketProtocol"),  @"protocol",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterSocketFlow socketFamily](self, "socketFamily"),  @"family",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterSocketFlow socketType](self, "socketType"),  @"type",  v5,  a4);
  -[NEFilterSocketFlow uuid](self, "uuid");
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"procUUID" andIndent:v5 options:a4];
  v15 = -[NEFilterSocketFlow euuid](self, "euuid");
  [v7 appendPrettyObject:v15 withName:@"eprocUUID" andIndent:v5 options:a4];
  v16 = -[NEFilterSocketFlow ruuid](self, "ruuid");
  [v7 appendPrettyObject:v16 withName:@"rprocUUID" andIndent:v5 options:a4];

  return v7;
}

- (id)identifier
{
  if (self)
  {
    unint64_t socketID = self->_socketID;
    if (socketID == -1LL)
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
      -[NEFilterFlow identifier](&v7, sel_identifier);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      return v5;
    }
  }

  else
  {
    unint64_t socketID = 0LL;
  }

  p_generateIdentifierOnce = &self->_generateIdentifierOnce;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__NEFilterSocketFlow_identifier__block_invoke;
  block[3] = &unk_18A08D530;
  block[4] = self;
  block[5] = socketID;
  if (self->_generateIdentifierOnce != -1) {
    dispatch_once(p_generateIdentifierOnce, block);
  }
  id v5 = objc_getProperty(self, a2, 208LL, 1);
  return v5;
}

- (id)identifierString
{
  if (self)
  {
    if (self->_socketID == -1LL)
    {
      v7.receiver = self;
      v7.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
      -[NEFilterFlow identifierString](&v7, sel_identifierString);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }

    id v3 = objc_alloc(NSString);
    unint64_t socketID = self->_socketID;
  }

  else
  {
    id v3 = objc_alloc(NSString);
    unint64_t socketID = 0LL;
  }

  id v5 = (void *)objc_msgSend(v3, "initWithFormat:", @"%llx", socketID);
  return v5;
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v11)
  {
    +[NEFilterNewFlowVerdict allowVerdict](&OBJC_CLASS___NEFilterNewFlowVerdict, "allowVerdict");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (![v11 drop])
  {
    if (self)
    {
      unint64_t socketID = self->_socketID;
      if (socketID == -1LL)
      {
        -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( self,  v10,  0,  [v11 filterInbound] - 1,  objc_msgSend(v11, "peekInboundBytes"),  objc_msgSend(v11, "filterOutbound") - 1,  objc_msgSend(v11, "peekOutboundBytes"),  objc_msgSend(v11, "statisticsReportFrequency"));
        goto LABEL_17;
      }
    }

    else
    {
      unint64_t socketID = 0LL;
    }

    +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( (uint64_t)NEFilterSocketFlow,  a4,  0,  socketID,  [v11 filterInbound] - 1,  objc_msgSend(v11, "peekInboundBytes"),  objc_msgSend(v11, "filterOutbound") - 1,  objc_msgSend(v11, "peekOutboundBytes"),  objc_msgSend(v11, "statisticsReportFrequency"));
LABEL_17:
    v23 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]( [NEFilterAbsoluteVerdict alloc],  "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:",  0,  [v11 filterInbound] - 1,  objc_msgSend(v11, "peekInboundBytes"),  objc_msgSend(v11, "filterOutbound") - 1,  objc_msgSend(v11, "peekOutboundBytes"));
    v25 = v23;
    if (self)
    {
      objc_setProperty_atomic(self, v24, v23, 112LL);

      uint64_t v26 = [v11 shouldReport];
      id Property = objc_getProperty(self, v27, 112LL, 1);
    }

    else
    {

      uint64_t v26 = [v11 shouldReport];
      id Property = 0LL;
    }

    [Property setShouldReport:v26];
    uint64_t v30 = [v11 statisticsReportFrequency];
    if (self) {
      id v31 = objc_getProperty(self, v29, 112LL, 1);
    }
    else {
      id v31 = 0LL;
    }
    [v31 setStatisticsReportFrequency:v30];
    unsigned __int8 v22 = -[NEFilterFlow shouldCloseWithVerdict:](self, v11);
    goto LABEL_22;
  }

  if (self)
  {
    unint64_t v13 = self->_socketID;
    if (v13 == -1LL)
    {
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( self,  v10,  1,  0LL,  0LL,  0LL,  0LL,  0LL);
      [v12 _principalObject];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 filterConfiguration];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 organization];
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        [v15 filterConfiguration];
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v19 = [v18 organization];
        v20 = (const char *)[v19 cStringUsingEncoding:4];

        xpc_dictionary_set_string(v10, "organization", v20);
      }

      goto LABEL_13;
    }
  }

  else
  {
    unint64_t v13 = 0LL;
  }

  +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( (uint64_t)&OBJC_CLASS___NEFilterSocketFlow,  a4,  1,  v13,  0LL,  0LL,  0LL,  0LL,  0LL);
LABEL_13:
  ne_log_obj();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v33 = -[NEFilterSocketFlow identifierString](self, "identifierString");
    *(_DWORD *)buf = 138412290;
    v35 = v33;
    _os_log_debug_impl(&dword_1876B1000, v21, OS_LOG_TYPE_DEBUG, "Dropping new flow %@", buf, 0xCu);
  }

  unsigned __int8 v22 = 1;
LABEL_22:

  return v22;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11 = a3;
  char v12 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, a6, a5);
  id v14 = v11;
  if (self)
  {
    if (self->_socketID == -1LL)
    {
      int v29 = objc_msgSend(objc_getProperty(self, v13, 112, 1), "drop");
      uint64_t v31 = objc_msgSend(objc_getProperty(self, v30, 112, 1), "inboundPassOffset");
      uint64_t v33 = objc_msgSend(objc_getProperty(self, v32, 112, 1), "inboundPeekOffset");
      uint64_t v35 = objc_msgSend(objc_getProperty(self, v34, 112, 1), "outboundPassOffset");
      uint64_t v37 = objc_msgSend(objc_getProperty(self, v36, 112, 1), "outboundPeekOffset");
      uint64_t v39 = objc_msgSend(objc_getProperty(self, v38, 112, 1), "statisticsReportFrequency");
      -[NEFilterSocketFlow writeXPCMessage:drop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( self,  v14,  v29,  v31,  v33,  v35,  v37,  v39);
    }

    else
    {
      int v15 = objc_msgSend(objc_getProperty(self, v13, 112, 1), "drop");
      unint64_t socketID = self->_socketID;
      char v18 = v12;
      uint64_t v19 = objc_msgSend(objc_getProperty(self, v17, 112, 1), "inboundPassOffset");
      uint64_t v21 = objc_msgSend(objc_getProperty(self, v20, 112, 1), "inboundPeekOffset");
      uint64_t v23 = objc_msgSend(objc_getProperty(self, v22, 112, 1), "outboundPassOffset");
      uint64_t v25 = objc_msgSend(objc_getProperty(self, v24, 112, 1), "outboundPeekOffset");
      uint64_t v27 = objc_msgSend(objc_getProperty(self, v26, 112, 1), "statisticsReportFrequency");
      uint64_t v28 = v19;
      char v12 = v18;
      +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]( (uint64_t)&OBJC_CLASS___NEFilterSocketFlow,  a4,  v15,  socketID,  v28,  v21,  v23,  v25,  v27);
    }
  }

  return v12;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a3;
  if ([a6 drop]) {
    +[NEFilterDataVerdict dropVerdict](&OBJC_CLASS___NEFilterDataVerdict, "dropVerdict");
  }
  else {
    +[NEFilterDataVerdict allowVerdict](&OBJC_CLASS___NEFilterDataVerdict, "allowVerdict");
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = -[NEFilterSocketFlow createDataReply:controlSocket:direction:verdict:context:]( self,  "createDataReply:controlSocket:direction:verdict:context:",  v13,  v9,  a5,  v14,  v12);

  return v15;
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setRemoteFlowEndpoint:(id)a3
{
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setRemoteHostname:(id)a3
{
}

- (OS_nw_endpoint)localFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setLocalFlowEndpoint:(id)a3
{
}

- (int)socketFamily
{
  return self->_socketFamily;
}

- (void)setSocketFamily:(int)socketFamily
{
  self->_socketFamily = socketFamily;
}

- (int)socketType
{
  return self->_socketType;
}

- (void)setSocketType:(int)socketType
{
  self->_socketType = socketType;
}

- (int)socketProtocol
{
  return self->_socketProtocol;
}

- (void)setSocketProtocol:(int)socketProtocol
{
  self->_socketProtocol = socketProtocol;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)euuid
{
  return self->_euuid;
}

- (void)setEuuid:(id)a3
{
}

- (NSUUID)ruuid
{
  return self->_ruuid;
}

- (void)setRuuid:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)writeMessageWithControlSocket:(int)a3 drop:(uint64_t)a4 socketID:(uint64_t)a5 inboundPassOffset:(uint64_t)a6 inboundPeekOffset:(uint64_t)a7 outboundPassOffset:(uint64_t)a8 outboundPeekOffset:(uint64_t)a9 statsReportFrequency:
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (a2 < 0) {
    return;
  }
  uint64_t v25 = 0x100000040LL;
  if (a3) {
    int v16 = 17;
  }
  else {
    int v16 = 16;
  }
  int v26 = 2;
  int v27 = v16;
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  uint64_t v32 = a8;
  uint64_t v33 = 0LL;
  objc_opt_self();
  else {
    int v17 = dword_187871E10[a9 - 1];
  }
  unint64_t v18 = 0LL;
  LODWORD(v33) = v17;
  while (1)
  {
    ssize_t v19 = write(a2, (char *)&v25 + v18, 64 - v18);
    if (v19 < 1) {
      break;
    }
    v18 += v19;
LABEL_13:
    if (v18 > 0x3F) {
      return;
    }
  }

  if ((v19 & 0x8000000000000000LL) == 0 || *__error() == 35) {
    goto LABEL_13;
  }
  int v20 = *__error();
  ne_log_obj();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  SEL v22 = v21;
  if (v20 == 22)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = v27;
      _os_log_debug_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_DEBUG,  "Sent a %d message for a non-existent socket",  buf,  8u);
    }
  }

  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v23 = v27;
    SEL v24 = strerror(v20);
    *(_DWORD *)buf = 67109378;
    int v35 = v23;
    __int16 v36 = 2080;
    uint64_t v37 = v24;
    _os_log_error_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_ERROR,  "Write operation on the control socket failed while sending a %d message (%s)",  buf,  0x12u);
  }
}

- (void)writeXPCMessage:(int)a3 drop:(uint64_t)a4 inboundPassOffset:(uint64_t)a5 inboundPeekOffset:(uint64_t)a6 outboundPassOffset:(uint64_t)a7 outboundPeekOffset:(uint64_t)a8 statsReportFrequency:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v15 = a2;
  ne_log_obj();
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id Property = objc_getProperty(a1, v17, 128LL, 1);
    int v23 = "allow";
    int v24 = 138413570;
    id v25 = Property;
    __int16 v26 = 2080;
    if (a3) {
      int v23 = "drop";
    }
    int v27 = v23;
    __int16 v28 = 2048;
    uint64_t v29 = a4;
    __int16 v30 = 2048;
    uint64_t v31 = a5;
    __int16 v32 = 2048;
    uint64_t v33 = a6;
    __int16 v34 = 2048;
    uint64_t v35 = a7;
    _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "%@ send verdict: %s, in (%lld/%lld), out (%lld/%lld)",  (uint8_t *)&v24,  0x3Eu);
  }

  uuid_clear((unsigned __int8 *)&v24);
  objc_msgSend(objc_getProperty(a1, v18, 128, 1), "getUUIDBytes:", &v24);
  xpc_dictionary_set_uuid(v15, "flow-uuid", (const unsigned __int8 *)&v24);
  uint64_t v19 = 3LL;
  if ((a6 & a4) == 0xFFFFFFFFFFFFFFFFLL) {
    uint64_t v19 = 1LL;
  }
  if (a3) {
    int64_t v20 = 2LL;
  }
  else {
    int64_t v20 = v19;
  }
  xpc_dictionary_set_int64(v15, "verdict-value", v20);
  xpc_dictionary_set_uint64(v15, "input-pass-offset", a4);
  xpc_dictionary_set_uint64(v15, "input-peek-offset", a5);
  xpc_dictionary_set_uint64(v15, "output-pass-offset", a6);
  xpc_dictionary_set_uint64(v15, "output-peek-offset", a7);
  objc_opt_self();
  else {
    uint64_t v21 = dword_187871E10[a8 - 1];
  }
  xpc_dictionary_set_uint64(v15, "stats-report-frequency", v21);
}

void __32__NEFilterSocketFlow_identifier__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uuid_copy(dst, "؛[]y<I@");
  *(void *)&dst[8] = *(void *)(a1 + 40);
  uint64_t v2 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:dst];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 208);
  *(void *)(v3 + 208) = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithSocketFamily:(int)a3 socketType:(int)a4 socketProtocol:(uint64_t)a5 pid:(uint64_t)a6 epid:(uint64_t)a7 uuid:(uint64_t)a8 euuid:(uint64_t)a9 socketID:
{
  if (!a1) {
    return 0LL;
  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_CLASS___NEFilterSocketFlow;
  id v16 = objc_msgSendSuper2(&v21, sel_init);
  int v17 = v16;
  if (v16)
  {
    *((_DWORD *)v16 + 40) = a2;
    *((_DWORD *)v16 + 41) = a3;
    *((_DWORD *)v16 + 42) = a4;
    *((void *)v16 + 25) = a9;
    [v16 setPid:a5];
    [v17 setEpid:a6];
    SEL v18 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a7];
    [v17 setUuid:v18];

    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a8];
    [v17 setEuuid:v19];
  }

  return v17;
}

- (void)setRemoteAddress:(void *)a1
{
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      nw_endpoint_t v5 = nw_endpoint_create_address(address);
      if (v5)
      {
        uint64_t v6 = v5;
        [a1 setRemoteFlowEndpoint:v5];
        nw_endpoint_t v5 = v6;
      }
    }
  }

- (void)setLocalAddress:(void *)a1
{
  if (address)
  {
    int sa_family = address->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      nw_endpoint_t v5 = nw_endpoint_create_address(address);
      if (v5)
      {
        uint64_t v6 = v5;
        [a1 setLocalFlowEndpoint:v5];
        nw_endpoint_t v5 = v6;
      }
    }
  }

@end