@interface NEFilterFlow
+ (BOOL)supportsSecureCoding;
- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6;
- (BOOL)inputComplete;
- (BOOL)outputComplete;
- (NEFilterFlow)init;
- (NEFilterFlow)initWithCoder:(id)a3;
- (NEFilterFlow)initWithURL:(id)a3 sourceAppIdentifier:(id)a4;
- (NETrafficDirection)direction;
- (NSData)crypto_signature;
- (NSData)sourceAppAuditToken;
- (NSData)sourceAppUniqueIdentifier;
- (NSData)sourceProcessAuditToken;
- (NSString)identifierString;
- (NSString)sourceAppIdentifier;
- (NSString)sourceAppVersion;
- (NSURL)URL;
- (NSUUID)identifier;
- (_BYTE)shouldCloseWithVerdict:(_BYTE *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int)epid;
- (int)pid;
- (int)rpid;
- (uint64_t)updateCurrentVerdictFromDataVerdict:(unint64_t)a3 direction:;
- (unint64_t)inBytes;
- (unint64_t)outBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setCrypto_signature:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setEpid:(int)a3;
- (void)setInBytes:(unint64_t)a3;
- (void)setInputComplete:(BOOL)a3;
- (void)setOutBytes:(unint64_t)a3;
- (void)setOutputComplete:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setRpid:(int)a3;
- (void)setSourceAppAuditToken:(id)a3;
- (void)setSourceAppIdentifier:(id)a3;
- (void)setSourceAppUniqueIdentifier:(id)a3;
- (void)setSourceAppVersion:(id)a3;
- (void)setSourceProcessAuditToken:(id)a3;
- (void)setURL:(id)a3;
- (void)updateSourceAppInfoWithQueue:(void *)a3 completionHandler:;
@end

@implementation NEFilterFlow

- (NEFilterFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEFilterFlow;
  v5 = -[NEFilterFlow init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentVerdict"];
    currentVerdict = v5->_currentVerdict;
    v5->_currentVerdict = (NEFilterAbsoluteVerdict *)v6;

    v5->_isRemediationFlow = [v4 decodeBoolForKey:@"isRemediationFlow"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowUUID"];
    flowUUID = v5->_flowUUID;
    v5->_flowUUID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppIdentifier"];
    sourceAppIdentifier = v5->_sourceAppIdentifier;
    v5->_sourceAppIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceAppVersion"];
    sourceAppVersion = v5->_sourceAppVersion;
    v5->_sourceAppVersion = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppUniqueIdentifier"];
    sourceAppUniqueIdentifier = v5->_sourceAppUniqueIdentifier;
    v5->_sourceAppUniqueIdentifier = (NSData *)v16;

    v5->_pid = [v4 decodeIntForKey:@"PID"];
    v5->_epid = [v4 decodeIntForKey:@"EPID"];
    v5->_inBytes = [v4 decodeInt64ForKey:@"inBytes"];
    v5->_outBytes = [v4 decodeInt64ForKey:@"OutBytes"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cryptoSignature"];
    crypto_signature = v5->_crypto_signature;
    v5->_crypto_signature = (NSData *)v18;

    v5->_sourceAppIdentifierFromApp = [v4 decodeBoolForKey:@"sourceAppSigningIdentifierFromApp"];
    v5->_direction = [v4 decodeIntegerForKey:@"direction"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppAuditToken"];
    sourceAppAuditToken = v5->_sourceAppAuditToken;
    v5->_sourceAppAuditToken = (NSData *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  if (self)
  {
    objc_msgSend(v15, "encodeObject:forKey:", objc_getProperty(self, v4, 112, 1), @"currentVerdict");
    BOOL isRemediationFlow = self->_isRemediationFlow;
  }

  else
  {
    [v15 encodeObject:0 forKey:@"currentVerdict"];
    BOOL isRemediationFlow = 0LL;
  }

  [v15 encodeBool:isRemediationFlow forKey:@"isRemediationFlow"];
  -[NEFilterFlow URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v6 forKey:@"URL"];

  if (self) {
    id Property = objc_getProperty(self, v7, 128LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v15 encodeObject:Property forKey:@"flowUUID"];
  v9 = -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  [v15 encodeObject:v9 forKey:@"sourceAppIdentifier"];

  -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v10 forKey:@"SourceAppVersion"];
  v11 = -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  [v15 encodeObject:v11 forKey:@"sourceAppUniqueIdentifier"];

  objc_msgSend(v15, "encodeInt:forKey:", -[NEFilterFlow pid](self, "pid"), @"PID");
  objc_msgSend(v15, "encodeInt:forKey:", -[NEFilterFlow epid](self, "epid"), @"EPID");
  objc_msgSend(v15, "encodeInt64:forKey:", -[NEFilterFlow inBytes](self, "inBytes"), @"inBytes");
  objc_msgSend(v15, "encodeInt64:forKey:", -[NEFilterFlow outBytes](self, "outBytes"), @"OutBytes");
  -[NEFilterFlow crypto_signature](self, "crypto_signature");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v12 forKey:@"cryptoSignature"];

  if (self) {
    BOOL sourceAppIdentifierFromApp = self->_sourceAppIdentifierFromApp;
  }
  else {
    BOOL sourceAppIdentifierFromApp = 0LL;
  }
  [v15 encodeBool:sourceAppIdentifierFromApp forKey:@"sourceAppSigningIdentifierFromApp"];
  objc_msgSend(v15, "encodeInteger:forKey:", -[NEFilterFlow direction](self, "direction"), @"direction");
  -[NEFilterFlow sourceAppAuditToken](self, "sourceAppAuditToken");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 encodeObject:v14 forKey:@"sourceAppAuditToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v4;
  if (self)
  {
    id Property = objc_getProperty(self, v5, 112LL, 1);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id Property = 0LL;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic((id)v6, v5, Property, 112LL);
LABEL_4:
  if (self)
  {
    BOOL isRemediationFlow = self->_isRemediationFlow;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  BOOL isRemediationFlow = 0;
  if (v6) {
LABEL_6:
  }
    *(_BYTE *)(v6 + 10) = isRemediationFlow;
LABEL_7:
  uint64_t v9 = -[NEFilterFlow URL](self, "URL", Property);
  uint64_t v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  if (self) {
    id v12 = objc_getProperty(self, v11, 128LL, 1);
  }
  else {
    id v12 = 0LL;
  }
  objc_storeStrong((id *)(v6 + 128), v12);
  uint64_t v13 = -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  uint64_t v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  uint64_t v15 = -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  uint64_t v16 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v15;

  uint64_t v17 = -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  uint64_t v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  objc_msgSend((id)v6, "setPid:", -[NEFilterFlow pid](self, "pid"));
  objc_msgSend((id)v6, "setEpid:", -[NEFilterFlow epid](self, "epid"));
  objc_msgSend((id)v6, "setInBytes:", -[NEFilterFlow inBytes](self, "inBytes"));
  objc_msgSend((id)v6, "setOutBytes:", -[NEFilterFlow outBytes](self, "outBytes"));
  v19 = -[NEFilterFlow crypto_signature](self, "crypto_signature");
  objc_msgSend((id)v6, "setCrypto_signature:", v19);

  if (self) {
    BOOL sourceAppIdentifierFromApp = self->_sourceAppIdentifierFromApp;
  }
  else {
    BOOL sourceAppIdentifierFromApp = 0;
  }
  *(_BYTE *)(v6 + 13) = sourceAppIdentifierFromApp;
  objc_msgSend((id)v6, "setDirection:", -[NEFilterFlow direction](self, "direction"));
  v21 = -[NEFilterFlow sourceAppAuditToken](self, "sourceAppAuditToken");
  [(id)v6 setSourceAppAuditToken:v21];

  return (id)v6;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NEFilterFlow identifier](self, "identifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"identifier" andIndent:v5 options:a4];

  -[NEFilterFlow URL](self, "URL");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 host];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"hostname" andIndent:v5 options:a4 | 1];
  v11 = -[NEFilterFlow sourceAppIdentifier](self, "sourceAppIdentifier");
  [v7 appendPrettyObject:v11 withName:@"sourceAppIdentifier" andIndent:v5 options:a4];

  -[NEFilterFlow sourceAppVersion](self, "sourceAppVersion");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"sourceAppVersion" andIndent:v5 options:a4];

  -[NEFilterFlow sourceAppUniqueIdentifier](self, "sourceAppUniqueIdentifier");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v13 withName:@"sourceAppUniqueIdentifier" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterFlow pid](self, "pid"),  @"procPID",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterFlow epid](self, "epid"),  @"eprocPID",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterFlow rpid](self, "rpid"),  @"rprocPID",  v5,  a4);
  if (-[NEFilterFlow direction](self, "direction") == NETrafficDirectionInbound)
  {
    uint64_t v14 = @"inbound";
  }

  else
  {
    if (-[NEFilterFlow direction](self, "direction") != NETrafficDirectionOutbound) {
      goto LABEL_6;
    }
    uint64_t v14 = @"outbound";
  }

  [v7 appendPrettyObject:v14 withName:@"direction" andIndent:v5 options:a4];
LABEL_6:
  if (self) {
    id Property = objc_getProperty(self, v15, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"currentVerdict" andIndent:v5 options:a4];
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterFlow inBytes](self, "inBytes"),  @"inBytes",  v5,  a4);
  objc_msgSend( v7,  "appendPrettyInt:withName:andIndent:options:",  -[NEFilterFlow outBytes](self, "outBytes"),  @"outBytes",  v5,  a4);
  -[NEFilterFlow crypto_signature](self, "crypto_signature");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v17 withName:@"signature" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEFilterFlow descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 1LL, 0LL);
}

- (NEFilterFlow)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEFilterFlow;
  result = -[NEFilterFlow init](&v3, sel_init);
  if (result) {
    result->_BOOL isRemediationFlow = 0;
  }
  return result;
}

- (NEFilterFlow)initWithURL:(id)a3 sourceAppIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = -[NEFilterFlow init](self, "init");
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    objc_storeStrong((id *)&v10->_sourceAppIdentifier, a4);
  }

  return v10;
}

- (NSUUID)identifier
{
  if (self) {
    self = (NEFilterFlow *)objc_getProperty(self, a2, 128LL, 1);
  }
  return (NSUUID *)self;
}

- (NSString)identifierString
{
  if (self) {
    self = (NEFilterFlow *)objc_getProperty(self, a2, 128LL, 1);
  }
  return (NSString *)-[NEFilterFlow description](self, "description");
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  return 1;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  return 1;
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setURL:(id)a3
{
}

- (NSData)sourceAppUniqueIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSourceAppUniqueIdentifier:(id)a3
{
}

- (NSString)sourceAppIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSourceAppIdentifier:(id)a3
{
}

- (NSString)sourceAppVersion
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setSourceAppVersion:(id)a3
{
}

- (NETrafficDirection)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (NSData)sourceAppAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSourceAppAuditToken:(id)a3
{
}

- (NSData)sourceProcessAuditToken
{
  return (NSData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setSourceProcessAuditToken:(id)a3
{
}

- (unint64_t)inBytes
{
  return self->_inBytes;
}

- (void)setInBytes:(unint64_t)a3
{
  self->_inBytes = a3;
}

- (unint64_t)outBytes
{
  return self->_outBytes;
}

- (void)setOutBytes:(unint64_t)a3
{
  self->_outBytes = a3;
}

- (BOOL)inputComplete
{
  return self->_inputComplete;
}

- (void)setInputComplete:(BOOL)a3
{
  self->_inputComplete = a3;
}

- (BOOL)outputComplete
{
  return self->_outputComplete;
}

- (void)setOutputComplete:(BOOL)a3
{
  self->_outputComplete = a3;
}

- (NSData)crypto_signature
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCrypto_signature:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)epid
{
  return self->_epid;
}

- (void)setEpid:(int)a3
{
  self->_epid = a3;
}

- (int)rpid
{
  return self->_rpid;
}

- (void)setRpid:(int)a3
{
  self->_rpid = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)updateCurrentVerdictFromDataVerdict:(unint64_t)a3 direction:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  uint64_t v7 = 0LL;
  if (!a1 || !v5) {
    goto LABEL_28;
  }
  if (![v5 drop])
  {
    uint64_t v12 = [v6 passBytes];
    unint64_t v14 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    if (v12 == -1)
    {
      if (!v14)
      {
        objc_msgSend(objc_getProperty(a1, v13, 112, 1), "setInboundPassOffset:", -1);
        objc_msgSend(objc_getProperty(a1, v23, 112, 1), "setInboundPeekOffset:", 0);
      }

      if (a3 > 1) {
        goto LABEL_27;
      }
      objc_msgSend(objc_getProperty(a1, v13, 112, 1), "setOutboundPassOffset:", -1);
      id Property = objc_getProperty(a1, v24, 112LL, 1);
      uint64_t v26 = 0LL;
    }

    else
    {
      if (!v14)
      {
        uint64_t v15 = objc_msgSend(objc_getProperty(a1, v13, 112, 1), "inboundPassOffset");
        uint64_t v16 = [v6 passBytes];
        uint64_t v17 = v15 + v16;
        if (__CFADD__(v15, v16) || (uint64_t v18 = [v6 peekBytes], v20 = v17 + v18, __CFADD__(v17, v18)))
        {
          ne_log_obj();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v41 = 138412546;
            v42 = v6;
            __int16 v43 = 2112;
            id v44 = objc_getProperty(a1, v22, 112LL, 1);
            _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "Inbound data verdict %@ causes overflow in current verdict %@",  (uint8_t *)&v41,  0x16u);
          }
        }

        else
        {
          objc_msgSend(objc_getProperty(a1, v19, 112, 1), "setInboundPassOffset:", v17);
          objc_msgSend(objc_getProperty(a1, v27, 112, 1), "setInboundPeekOffset:", v20);
        }
      }

      if (a3 > 1) {
        goto LABEL_27;
      }
      uint64_t v28 = objc_msgSend(objc_getProperty(a1, v13, 112, 1), "outboundPassOffset");
      uint64_t v29 = [v6 passBytes];
      uint64_t v30 = v28 + v29;
      if (__CFADD__(v28, v29) || (uint64_t v31 = [v6 peekBytes], v33 = v30 + v31, __CFADD__(v30, v31)))
      {
        ne_log_obj();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v40 = objc_getProperty(a1, v35, 112LL, 1);
          int v41 = 138412546;
          v42 = v6;
          __int16 v43 = 2112;
          id v44 = v40;
          _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "Outbound data verdict %@ causes overflow in current verdict %@",  (uint8_t *)&v41,  0x16u);
        }

        goto LABEL_27;
      }

      objc_msgSend(objc_getProperty(a1, v32, 112, 1), "setOutboundPassOffset:", v30);
      id Property = objc_getProperty(a1, v36, 112LL, 1);
      uint64_t v26 = v33;
    }

    [Property setOutboundPeekOffset:v26];
LABEL_27:
    uint64_t v37 = [v6 statisticsReportFrequency];
    objc_msgSend(objc_getProperty(a1, v38, 112, 1), "setStatisticsReportFrequency:", v37);
    uint64_t v7 = (uint64_t)-[NEFilterFlow shouldCloseWithVerdict:](a1, v6);
    goto LABEL_28;
  }

  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [a1 identifierString];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v41 = 138412290;
    v42 = v9;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "Dropping flow %@", (uint8_t *)&v41, 0xCu);
  }

  uint64_t v7 = 1LL;
  objc_msgSend(objc_getProperty(a1, v10, 112, 1), "setDrop:", 1);
  objc_msgSend(objc_getProperty(a1, v11, 112, 1), "setStatisticsReportFrequency:", 0);
LABEL_28:

  return v7;
}

- (_BYTE)shouldCloseWithVerdict:(_BYTE *)a1
{
  id v4 = a2;
  if (a1)
  {
    if (objc_msgSend(objc_getProperty(a1, v3, 112, 1), "inboundPassOffset") != -1
      || objc_msgSend(objc_getProperty(a1, v5, 112, 1), "outboundPassOffset") != -1
      || objc_msgSend(objc_getProperty(a1, v6, 112, 1), "statisticsReportFrequency")
      || (a1[12] & 1) != 0)
    {
      a1 = 0LL;
    }

    else
    {
      a1 = (_BYTE *)([v4 shouldReport] ^ 1);
    }
  }

  return a1;
}

- (void)updateSourceAppInfoWithQueue:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  +[NEAppInfoCache sharedAppInfoCache]();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = a1;
    [v8 euuid];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v8 uuid];
    if (v10)
    {
      SEL v11 = (void *)v10;
      uint64_t v12 = [v8 euuid];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        [v8 uuid];
        unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        NEGetNullUUID();
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v14 isEqual:v15])
        {
        }

        else
        {
          uint64_t v28 = v14;
          uint64_t v16 = [v8 euuid];
          uint64_t v17 = NEGetNullUUID();
          uint64_t v29 = (void *)v16;
          uint64_t v18 = (void *)v16;
          v19 = (void *)v17;
          if (([v18 isEqual:v17] & 1) == 0)
          {
            [v8 uuid];
            SEL v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 euuid];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            char v26 = [v27 isEqual:v25];

            if ((v26 & 1) == 0)
            {
              int v24 = [v8 pid];
            }

            goto LABEL_11;
          }
        }
      }
    }

void __63__NEFilterFlow_updateSourceAppInfoWithQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63__NEFilterFlow_updateSourceAppInfoWithQueue_completionHandler___block_invoke_2;
  block[3] = &unk_18A08FB50;
  id v5 = *(dispatch_queue_s **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __63__NEFilterFlow_updateSourceAppInfoWithQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v14 = *(id *)(v2 + 24);
    [*(id *)(a1 + 40) sourceAppIdentifier];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v14 == 0LL;
    }
    if (v4)
    {
    }

    else if ([v14 length])
    {
      [*(id *)(a1 + 40) setSourceAppIdentifier:v14];
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = (__CFString *)*(id *)(v6 + 32);
      id v8 = v7;
      if (v7)
      {
        uint64_t v9 = -[__CFString length](v7, "length");
        id v10 = v8;
        if (v9) {
          goto LABEL_17;
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }

    id v10 = &stru_18A0915E8;
LABEL_17:
    [*(id *)(a1 + 40) setSourceAppVersion:v10];
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11)
    {
      id v12 = *(id *)(v11 + 40);
      uint64_t v13 = v12;
      if (v12)
      {
        if ([v12 length]) {
          [*(id *)(a1 + 40) setSourceAppUniqueIdentifier:v13];
        }
      }
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();

    return;
  }

  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Could not find app info, return the original flow without filling in app info",  buf,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

@end