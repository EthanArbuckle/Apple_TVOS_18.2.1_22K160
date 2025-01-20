@interface NSPObliviousPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFailOpen;
- (BOOL)allowFallback;
- (BOOL)deferAgentCommit;
- (BOOL)deferCommit;
- (BOOL)matchIngress:(id)a3;
- (BOOL)obliviousAgentRegistered;
- (BOOL)pathReady;
- (BOOL)resetFallbackProxyAgent;
- (BOOL)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3;
- (BOOL)shouldBePenalized;
- (BOOL)validateTransparencyIfNecessaryWithCompletion:(id)a3;
- (NSData)obliviousConfig;
- (NSData)transparencyKeyBundle;
- (NSData)transparencyProof;
- (NSPObliviousPath)initWithCoder:(id)a3;
- (NSPObliviousPath)initWithDelegate:(id)a3 obliviousConfig:(id)a4 obliviousHTTPType:(int)a5 transparencyKeyBundle:(id)a6 transparencyProof:(id)a7 obliviousTarget:(id)a8 proxyInfo:(id)a9 allowFailOpen:(BOOL)a10 networkCharacteristics:(id)a11;
- (NSPObliviousPathDelegate)delegate;
- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration;
- (NSPPrivacyProxyNetworkRegistration)quicRegistration;
- (NSPPrivacyProxyObliviousTargetInfo)obliviousTarget;
- (NSPProxyAgentNetworkStatistics)statistics;
- (NSPProxyTokenInfo)proxyInfo;
- (NSString)description;
- (NSUUID)fallbackAgentUUID;
- (NSUUID)quicAgentUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)shortName;
- (int)obliviousHTTPType;
- (unsigned)transparencyState;
- (void)dealloc;
- (void)enableFailOpen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleNetworkCharacteristicsChange:(id)a3;
- (void)removeProxyAgents;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetError;
- (void)resetStats;
- (void)setAllowFailOpen:(BOOL)a3;
- (void)setDeferAgentCommit:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackAgentUUID:(id)a3;
- (void)setFallbackRegistration:(id)a3;
- (void)setObliviousAgentRegistered:(BOOL)a3;
- (void)setObliviousConfig:(id)a3;
- (void)setObliviousHTTPType:(int)a3;
- (void)setObliviousTarget:(id)a3;
- (void)setProxyInfo:(id)a3;
- (void)setQuicAgentUUID:(id)a3;
- (void)setQuicRegistration:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setTransparencyKeyBundle:(id)a3;
- (void)setTransparencyProof:(id)a3;
- (void)setTransparencyState:(unsigned __int8)a3;
- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3;
@end

@implementation NSPObliviousPath

- (NSPObliviousPath)initWithDelegate:(id)a3 obliviousConfig:(id)a4 obliviousHTTPType:(int)a5 transparencyKeyBundle:(id)a6 transparencyProof:(id)a7 obliviousTarget:(id)a8 proxyInfo:(id)a9 allowFailOpen:(BOOL)a10 networkCharacteristics:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v19 = a11;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NSPObliviousPath;
  v20 = -[NSPObliviousPath init](&v39, "init");
  v23 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v23->_obliviousConfig, a4);
    v23->_obliviousHTTPType = a5;
    objc_storeStrong((id *)&v23->_obliviousTarget, a8);
    objc_storeStrong((id *)&v23->_transparencyKeyBundle, a6);
    objc_storeStrong((id *)&v23->_transparencyProof, a7);
    objc_storeStrong((id *)&v23->_proxyInfo, a9);
    v23->_allowFailOpen = a10;
    v24 = objc_alloc_init(&OBJC_CLASS___NSPProxyAgentNetworkStatistics);
    statistics = v23->_statistics;
    v23->_statistics = v24;

    sub_100011668((uint64_t)v23->_statistics, v19);
    v23->_transparencyState = 0;
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    quicAgentUUID = v23->_quicAgentUUID;
    v23->_quicAgentUUID = (NSUUID *)v26;

    if (-[NSPObliviousPath allowFallback](v23, "allowFallback"))
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      fallbackAgentUUID = v23->_fallbackAgentUUID;
      v23->_fallbackAgentUUID = (NSUUID *)v28;
    }

    v30 = v23;
  }

  else
  {
    uint64_t v32 = nplog_obj(0LL, v21, v22);
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v23;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  v7 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  sub_100043E90(v7, v8, @"Oblivious target", a3, a4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  sub_100043E90(v7, v9, @"Proxy", a3, a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  sub_100043E90(v7, v10, @"QUIC Agent UUID", a3, a4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  sub_100043E90(v7, v11, @"Fallback Agent UUID", a3, a4);

  sub_1000446CC(v7, -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"), (uint64_t)@"Allow fail open", a3, a4);
  sub_100044730( v7,  -[NSPObliviousPath transparencyState](self, "transparencyState"),  (uint64_t)@"Transparency state",  a3,  a4);
  uint64_t v12 = -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType");
  if (v12 >= 3) {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v12));
  }
  else {
    v13 = *(&off_1000F9BD8 + (int)v12);
  }
  sub_100043E90(v7, v13, @"Oblivious HTTP type", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[NSPObliviousPath descriptionWithIndent:options:]( self,  "descriptionWithIndent:options:",  0LL,  14LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)deferCommit
{
  if (-[NSPObliviousPath deferAgentCommit](self, "deferAgentCommit")) {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
  unsigned __int8 v5 = [v4 deferCommit];

  return v5;
}

- (NSPObliviousPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___NSPObliviousPath;
  unsigned __int8 v5 = -[NSPObliviousPath init](&v30, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSPProxyTokenInfo) forKey:@"obliviousPathProxy"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPProxyTokenInfo *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"obliviousPathQUICAgentUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"obliviousPathFallbackAgentUUID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"obliviousPathConfig"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    obliviousConfig = v5->_obliviousConfig;
    v5->_obliviousConfig = (NSData *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSPPrivacyProxyObliviousTargetInfo) forKey:@"obliviousPathTarget"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    obliviousTarget = v5->_obliviousTarget;
    v5->_obliviousTarget = (NSPPrivacyProxyObliviousTargetInfo *)v19;

    v5->_allowFailOpen = [v4 decodeBoolForKey:@"obliviousPathAllowFailOpen"];
    v5->_obliviousHTTPType = [v4 decodeIntegerForKey:@"obliviousPathType"];
    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"obliviousPathTransparencyKeyBundle"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    transparencyKeyBundle = v5->_transparencyKeyBundle;
    v5->_transparencyKeyBundle = (NSData *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"obliviousPathTransparencyProof"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    transparencyProof = v5->_transparencyProof;
    v5->_transparencyProof = (NSData *)v25;

    unsigned __int8 v27 = [v4 decodeIntegerForKey:@"obliviousPathTransparencyState"];
    if (v27 == 1LL) {
      unsigned __int8 v28 = 0;
    }
    else {
      unsigned __int8 v28 = v27;
    }
    v5->_transparencyState = v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  [v11 encodeObject:v4 forKey:@"obliviousPathProxy"];

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  [v11 encodeObject:v5 forKey:@"obliviousPathQUICAgentUUID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  [v11 encodeObject:v6 forKey:@"obliviousPathFallbackAgentUUID"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  [v11 encodeObject:v7 forKey:@"obliviousPathConfig"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  [v11 encodeObject:v8 forKey:@"obliviousPathTarget"];

  objc_msgSend( v11,  "encodeBool:forKey:",  -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"),  @"obliviousPathAllowFailOpen");
  objc_msgSend( v11,  "encodeInteger:forKey:",  -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"),  @"obliviousPathType");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  [v11 encodeObject:v9 forKey:@"obliviousPathTransparencyKeyBundle"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
  [v11 encodeObject:v10 forKey:@"obliviousPathTransparencyProof"];

  if (-[NSPObliviousPath transparencyState](self, "transparencyState") != 1) {
    objc_msgSend( v11,  "encodeInteger:forKey:",  -[NSPObliviousPath transparencyState](self, "transparencyState"),  @"obliviousPathTransparencyState");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NSPObliviousPath init]( +[NSPObliviousPath allocWithZone:](&OBJC_CLASS___NSPObliviousPath, "allocWithZone:", a3),  "init");
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  -[NSPObliviousPath setObliviousConfig:](v4, "setObliviousConfig:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  -[NSPObliviousPath setObliviousTarget:](v4, "setObliviousTarget:", v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  -[NSPObliviousPath setProxyInfo:](v4, "setProxyInfo:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPObliviousPath setQuicAgentUUID:](v4, "setQuicAgentUUID:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  -[NSPObliviousPath setFallbackAgentUUID:](v4, "setFallbackAgentUUID:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  -[NSPObliviousPath setQuicRegistration:](v4, "setQuicRegistration:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  -[NSPObliviousPath setFallbackRegistration:](v4, "setFallbackRegistration:", v11);

  -[NSPObliviousPath setObliviousAgentRegistered:]( v4,  "setObliviousAgentRegistered:",  -[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered"));
  -[NSPObliviousPath setAllowFailOpen:]( v4,  "setAllowFailOpen:",  -[NSPObliviousPath allowFailOpen](self, "allowFailOpen"));
  -[NSPObliviousPath setObliviousHTTPType:]( v4,  "setObliviousHTTPType:",  -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  -[NSPObliviousPath setStatistics:](v4, "setStatistics:", v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  -[NSPObliviousPath setTransparencyKeyBundle:](v4, "setTransparencyKeyBundle:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
  -[NSPObliviousPath setTransparencyProof:](v4, "setTransparencyProof:", v14);

  -[NSPObliviousPath setTransparencyState:]( v4,  "setTransparencyState:",  -[NSPObliviousPath transparencyState](self, "transparencyState"));
  return v4;
}

- (void)enableFailOpen:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPObliviousPath allowFailOpen](self, "allowFailOpen") != a3)
  {
    -[NSPObliviousPath setAllowFailOpen:](self, "setAllowFailOpen:", v3);
    -[NSPObliviousPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    -[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:](self, "resetQUICProxyAgentForceUpdateDelegate:", 0LL);
  }

- (id)shortName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 targetHost]);

  return v3;
}

- (BOOL)matchIngress:(id)a3
{
  id v6 = (id *)a3;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
      id v9 = (void *)v8;
      if (v8) {
        uint64_t v10 = *(void **)(v8 + 24);
      }
      else {
        uint64_t v10 = 0LL;
      }
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 proxyURL]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6[3] proxyURL]);
      LOBYTE(v7) = [v12 isEqualToString:v13];
    }
  }

  else
  {
    uint64_t v15 = nplog_obj(0LL, v4, v5);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      id v18 = "-[NSPObliviousPath matchIngress:]";
      _os_log_fault_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "%s called with null proxyTokenInfo",  (uint8_t *)&v17,  0xCu);
    }

    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (id *)a3;
  __int128 buffer = 0u;
  memset(v40, 0, sizeof(v40));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID]);
  id v12 = v9;
  if (!v9)
  {
    uint64_t v13 = 0LL;
    goto LABEL_7;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPath pathForClientID:](&OBJC_CLASS___NWPath, "pathForClientID:", v9));
  uint64_t v13 = v9;
  if (!v9)
  {
LABEL_7:
    id v21 = 0LL;
    v14 = 0LL;
    goto LABEL_13;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 interface]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 parameters]);
  int v16 = [v15 pid];
  if (!v16)
  {
LABEL_11:
    id v21 = 0LL;
    goto LABEL_12;
  }

  int v17 = v16;
  uint64_t v18 = proc_pidinfo(v16, 13, 1uLL, &buffer, 64);
  if ((_DWORD)v18 != 64)
  {
    uint64_t v22 = nplog_obj(v18, v19, v20);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v31 = 67109120;
      int v32 = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Failed to convert from PID (%d) to process name",  (uint8_t *)&v31,  8u);
    }

    goto LABEL_11;
  }

  id v21 = (const char *)v40;
LABEL_12:

LABEL_13:
  uint64_t v24 = nplog_obj(v9, v10, v11);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v21) {
      uint64_t v26 = v21;
    }
    else {
      uint64_t v26 = "none";
    }
    unsigned __int8 v27 = sub_100044D90(v8);
    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v14 interfaceName]);
    int v31 = 67109890;
    int v32 = v6;
    __int16 v33 = 2080;
    id v34 = v26;
    __int16 v35 = 2112;
    id v36 = v28;
    __int16 v37 = 2112;
    v38 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Received error (%d) from %s for oblivious %@ agent on interface %@",  (uint8_t *)&v31,  0x26u);
  }

  if ((_DWORD)v6)
  {
    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    [v30 reportObliviousPathError:v6 interface:v14 obliviousPath:self];
  }
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  sub_100011668((uint64_t)v5, v4);

  uint64_t v6 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  if (v6)
  {
    v6[6] = 0u;
    v6[7] = 0u;
    v6[4] = 0u;
    v6[5] = 0u;
    v6[2] = 0u;
    v6[3] = 0u;
    v6[1] = 0u;
  }
}

- (void)resetStats
{
  v2 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  if (v2)
  {
    v2[6] = 0u;
    v2[7] = 0u;
    v2[4] = 0u;
    v2[5] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
    v2[1] = 0u;
  }
}

- (void)resetError
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  id v4 = (void *)v3;
  if (v3) {
    [*(id *)(v3 + 24) resetError];
  }

  uint64_t v5 = (id *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  if (v5)
  {
    uint64_t v6 = v5;
    [v5[3] resetError];
    uint64_t v5 = v6;
  }
}

- (BOOL)shouldBePenalized
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
  id v4 = (void *)v3;
  if (v3 && *(void *)(v3 + 80) > 2uLL)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
    uint64_t v6 = (void *)v5;
    if (v5 && *(void *)(v5 + 72) > 2uLL)
    {
      BOOL v7 = 1;
    }

    else
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
      id v9 = (void *)v8;
      if (v8 && *(void *)(v8 + 24) > 9uLL)
      {
        BOOL v7 = 1;
      }

      else
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
        uint64_t v11 = (void *)v10;
        if (v10 && *(void *)(v10 + 64) > 2uLL)
        {
          BOOL v7 = 1;
        }

        else
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
          uint64_t v13 = (void *)v12;
          if (v12 && *(void *)(v12 + 56) > 9uLL)
          {
            BOOL v7 = 1;
          }

          else
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath statistics](self, "statistics"));
            if (v14) {
              BOOL v7 = v14[4] > 2uLL;
            }
            else {
              BOOL v7 = 0;
            }
          }
        }
      }
    }
  }

  return v7;
}

- (BOOL)validateTransparencyIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));

  if (v5)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyTransparencyOHTTPEntry);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
    id v8 = [v6 initWithData:v7];

    if (v8)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 keyConfiguration]);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
      unsigned __int8 v14 = [v12 isEqualToData:v13];

      if ((v14 & 1) != 0)
      {
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 targetInformations]);
        id v19 = [v18 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v19)
        {
          id v20 = v19;
          v50 = v8;
          v51 = (void (**)(void, void))v4;
          char v21 = 0;
          uint64_t v22 = *(void *)v55;
          do
          {
            for (i = 0LL; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v55 != v22) {
                objc_enumerationMutation(v18);
              }
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 targetHost]);
              unsigned __int8 v27 = [v24 isEqualToString:v26];

              v21 |= v27;
            }

            id v20 = [v18 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }

          while (v20);

          id v8 = v50;
          id v4 = v51;
          if ((v21 & 1) != 0)
          {
            int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v50 configurationDeliveryStart]));
            int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v50 configurationDeliveryEnd]));
            __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
            unsigned __int8 v34 = [v33 configurationFetchDateIsWithinStart:v31 end:v32];

            if ((v34 & 1) != 0)
            {
              id v38 = [[SoftwareTransparency alloc] initWithApplication:0];
              BOOL v39 = v38 == 0LL;
              if (v38)
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyProof](self, "transparencyProof"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
                v52[0] = _NSConcreteStackBlock;
                v52[1] = 3221225472LL;
                v52[2] = sub_100012AF4;
                v52[3] = &unk_1000F9888;
                v53 = v51;
                [v38 verifyExpiringProofs:v40 for:v41 completion:v52];
              }

              else
              {
                v51[2](v51, 0LL);
              }
            }

            else
            {
              uint64_t v48 = nplog_obj(v35, v36, v37);
              v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v59 = v31;
                __int16 v60 = 2112;
                v61 = v32;
                _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "Configuration start time (%@) and end time (%@) are not valid, blocking installing oblivious config",  buf,  0x16u);
              }

              v51[2](v51, 0LL);
              BOOL v39 = 1;
            }

            goto LABEL_25;
          }
        }

        else
        {
        }

        uint64_t v46 = nplog_obj(v28, v29, v30);
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v44 = "Failed to find target info in transparency blob for oblivious config, blocking";
          goto LABEL_23;
        }

- (BOOL)pathReady
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (sub_10000C67C((uint64_t)v3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    unint64_t v5 = sub_10000E688((uint64_t)v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    unint64_t v7 = sub_10000F2E8((uint64_t)v6);

    if (v5 <= v7)
    {
      uint64_t v11 = nplog_obj(v8, v9, v10);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
        unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
        uint64_t v15 = sub_10000E688((uint64_t)v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v48 = v15;
        __int16 v49 = 2048;
        uint64_t v50 = sub_10000F2E8((uint64_t)v16);
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%p oblivious path [%@] is not ready due to insufficient ingress proxy tokens (cache+agent: %lu), (ingress prox y low-water mark: %lu)",  buf,  0x2Au);
      }

      return 0;
    }
  }

  else
  {
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath transparencyKeyBundle](self, "transparencyKeyBundle"));
  id v20 = (void *)v17;
  if (v17)
  {
    unsigned int v21 = -[NSPObliviousPath transparencyState](self, "transparencyState");

    if (v21 != 2)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000LL;
      LOBYTE(v48) = 1;
      if (-[NSPObliviousPath transparencyState](self, "transparencyState")) {
        goto LABEL_14;
      }
      -[NSPObliviousPath setTransparencyState:](self, "setTransparencyState:", 1LL);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10001314C;
      v42[3] = &unk_1000F9838;
      v42[4] = self;
      v42[5] = buf;
      BOOL v26 = -[NSPObliviousPath validateTransparencyIfNecessaryWithCompletion:]( self,  "validateTransparencyIfNecessaryWithCompletion:",  v42);
      if (v26)
      {
LABEL_14:
        uint64_t v29 = -[NSPObliviousPath transparencyState](self, "transparencyState");
        if ((_DWORD)v29 == 3)
        {
          uint64_t v32 = nplog_obj(v29, v30, v31);
          __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
            *(_DWORD *)v43 = 134218242;
            v44 = self;
            __int16 v45 = 2112;
            uint64_t v46 = v40;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%p oblivious path [%@] is not ready due to invalid transparency status",  v43,  0x16u);
          }
        }

        else
        {
          uint64_t v34 = -[NSPObliviousPath transparencyState](self, "transparencyState");
          if ((_DWORD)v34 != 1)
          {
            _Block_object_dispose(buf, 8);
            goto LABEL_9;
          }

          uint64_t v37 = nplog_obj(v34, v35, v36);
          __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
            *(_DWORD *)v43 = 134218242;
            v44 = self;
            __int16 v45 = 2112;
            uint64_t v46 = v41;
            _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%p oblivious path [%@] is not ready due to pending transparency status",  v43,  0x16u);
          }
        }
      }

      else
      {
        *(_BYTE *)(*(void *)&buf[8] + 24LL) = 0;
        uint64_t v38 = nplog_obj(v26, v27, v28);
        __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath shortName](self, "shortName"));
          *(_DWORD *)v43 = 134218242;
          v44 = self;
          __int16 v45 = 2112;
          uint64_t v46 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "%p oblivious path [%@] is not ready due to unknown transparency status",  v43,  0x16u);
        }
      }

      _Block_object_dispose(buf, 8);
      return 0;
    }
  }

- (BOOL)allowFallback
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  uint64_t v3 = v2;
  if (v2) {
    v2 = (void *)v2[3];
  }
  unsigned __int8 v4 = [v2 supportsFallback];

  return v4;
}

- (BOOL)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (!v5) {
    return v5;
  }
  id v6 = (void *)v5;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  if (!v7)
  {

    goto LABEL_14;
  }

  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));

  if (!v9)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));

  if (!v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[NSPObliviousPath setQuicAgentUUID:](self, "setQuicAgentUUID:", v11);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));

  if (!v12)
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyObliviousHopsNetworkRegistration);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 targetHost]);
    uint64_t v17 = sub_100046FA4((id *)&v13->super.super.isa, v14, v16, self);
    -[NSPObliviousPath setQuicRegistration:](self, "setQuicRegistration:", v17);

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
    if (!v18)
    {
      uint64_t v66 = nplog_obj(v19, v20, v21);
      v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v92 = "-[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_FAULT,  "%s called with null self.quicRegistration",  buf,  0xCu);
      }

      goto LABEL_14;
    }
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  if (!v22) {
    goto LABEL_15;
  }
  v23 = (void *)v22;
  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  if (!v24)
  {
    v85 = 0LL;
    v90 = 0LL;
    goto LABEL_12;
  }

  uint64_t v25 = (void *)v24;
  unsigned int v26 = [*(id *)(v24 + 24) isRegistered];

  if (!v26)
  {
LABEL_15:
    v85 = 0LL;
    v90 = 0LL;
    goto LABEL_16;
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  id v27 = sub_100045BD0((uint64_t)v23);
  v90 = (void *)objc_claimAutoreleasedReturnValue(v27);
LABEL_12:

LABEL_16:
  uint64_t v28 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  uint64_t v29 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v83 = (void *)v29;
  if (v29) {
    uint64_t v30 = *(void **)(v29 + 24);
  }
  else {
    uint64_t v30 = 0LL;
  }
  id v31 = v30;
  v88 = (void *)objc_claimAutoreleasedReturnValue([v31 proxyURL]);
  uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v81 = (void *)v32;
  if (v32) {
    __int16 v33 = *(void **)(v32 + 24);
  }
  else {
    __int16 v33 = 0LL;
  }
  id v34 = v33;
  v87 = (void *)objc_claimAutoreleasedReturnValue([v34 proxyKeyInfos]);
  uint64_t v35 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v79 = (void *)v35;
  if (v35) {
    uint64_t v36 = *(void **)(v35 + 24);
  }
  else {
    uint64_t v36 = 0LL;
  }
  id v37 = v36;
  v86 = (void *)objc_claimAutoreleasedReturnValue([v37 proxyVersion]);
  uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v77 = (void *)v38;
  if (v38) {
    BOOL v39 = *(void **)(v38 + 24);
  }
  else {
    BOOL v39 = 0LL;
  }
  id v40 = v39;
  unsigned int v41 = [v40 supportsResumption];
  uint64_t v42 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v75 = (void *)v42;
  int v73 = v41;
  if (v42) {
    v43 = *(void **)(v42 + 24);
  }
  else {
    v43 = 0LL;
  }
  id v44 = v43;
  unsigned int v45 = [v44 algorithm];
  uint64_t v46 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  BOOL v72 = sub_10000C67C(v46);
  v74 = (void *)v46;
  if (v72)
  {
    uint64_t v47 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    v70 = (void *)v47;
    if (v47) {
      uint64_t v48 = *(void **)(v47 + 48);
    }
    else {
      uint64_t v48 = 0LL;
    }
    id v71 = v48;
  }

  else
  {
    id v71 = 0LL;
  }

  uint64_t v49 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  uint64_t v50 = (void *)v49;
  BOOL v84 = a3;
  v89 = (id *)v28;
  v82 = v31;
  v80 = v34;
  v78 = v37;
  v76 = v40;
  if (v49) {
    v51 = *(void **)(v49 + 24);
  }
  else {
    v51 = 0LL;
  }
  BOOL v52 = v45 == 2;
  id v53 = v51;
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 tokenChallenge]);
  unsigned __int8 v55 = -[NSPObliviousPath allowFailOpen](self, "allowFailOpen");
  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v57 proxyURLPath]);
  unsigned __int8 v69 = v55;
  v59 = v85;
  sub_10004705C( (uint64_t)v89,  v88,  v87,  v86,  v73,  v52,  v71,  v54 != 0LL,  v85,  v69,  v56,  v58,  -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"),  v90);

  if (v72)
  {
  }

  if (v89
    && [v89[3] isRegistered]
    && (v84 || !-[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered")))
  {
    -[NSPObliviousPath setObliviousAgentRegistered:](self, "setObliviousAgentRegistered:", 1LL);
    __int16 v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 targetHost]);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 processes]);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
    [v60 obliviousHopAgentRegistered:self hostname:v62 processes:v64 agentUUID:v65];

    v59 = v85;
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)resetFallbackProxyAgent
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  if (!v3) {
    return v3;
  }
  unsigned __int8 v4 = (void *)v3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  if (!v5)
  {

    goto LABEL_24;
  }

  id v6 = (void *)v5;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));

  if (!v7)
  {
LABEL_24:
    LOBYTE(v3) = 0;
    return v3;
  }

  LODWORD(v3) = -[NSPObliviousPath allowFallback](self, "allowFallback");
  if (!(_DWORD)v3) {
    return v3;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));

  if (!v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[NSPObliviousPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", v9);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));

  if (!v10)
  {
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NSPPrivacyProxyObliviousHopsFallbackNetworkRegistration);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackAgentUUID](self, "fallbackAgentUUID"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 targetHost]);
    uint64_t v15 = sub_10004874C((id *)&v11->super.super.isa, v12, v14, self);
    -[NSPObliviousPath setFallbackRegistration:](self, "setFallbackRegistration:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
    if (!v16)
    {
      uint64_t v52 = nplog_obj(v17, v18, v19);
      id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v74 = "-[NSPObliviousPath resetFallbackProxyAgent]";
        _os_log_fault_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_FAULT,  "%s called with null self.fallbackRegistration",  buf,  0xCu);
      }

      goto LABEL_24;
    }
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  unsigned __int8 v69 = (void *)v21;
  if (v21) {
    uint64_t v22 = *(void **)(v21 + 24);
  }
  else {
    uint64_t v22 = 0LL;
  }
  id v23 = v22;
  v67 = (void *)objc_claimAutoreleasedReturnValue([v23 tcpProxyFqdn]);
  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  uint64_t v66 = (void *)v24;
  if (v24) {
    uint64_t v25 = *(void **)(v24 + 24);
  }
  else {
    uint64_t v25 = 0LL;
  }
  id v26 = v25;
  BOOL v72 = (void *)objc_claimAutoreleasedReturnValue([v26 proxyKeyInfos]);
  uint64_t v27 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v65 = (void *)v27;
  if (v27) {
    uint64_t v28 = *(void **)(v27 + 24);
  }
  else {
    uint64_t v28 = 0LL;
  }
  id v29 = v28;
  id v71 = (void *)objc_claimAutoreleasedReturnValue([v29 proxyVersion]);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v63 = (void *)v30;
  if (v30) {
    id v31 = *(void **)(v30 + 24);
  }
  else {
    id v31 = 0LL;
  }
  id v32 = v31;
  unsigned int v33 = [v32 supportsResumption];
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v64 = v29;
  v61 = (void *)v34;
  int v58 = v33;
  if (v34) {
    uint64_t v35 = *(void **)(v34 + 24);
  }
  else {
    uint64_t v35 = 0LL;
  }
  id v36 = v35;
  unsigned int v37 = [v36 algorithm];
  uint64_t v38 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  BOOL v39 = sub_10000C67C(v38);
  v62 = v32;
  if (v39)
  {
    uint64_t v40 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
    unsigned __int8 v55 = (void *)v40;
    if (v40) {
      unsigned int v41 = *(void **)(v40 + 48);
    }
    else {
      unsigned int v41 = 0LL;
    }
    id v56 = v41;
  }

  else
  {
    id v56 = 0LL;
  }

  uint64_t v42 = objc_claimAutoreleasedReturnValue(-[NSPObliviousPath proxyInfo](self, "proxyInfo"));
  v43 = (void *)v42;
  v70 = (void *)v20;
  v68 = v23;
  v59 = (void *)v38;
  __int16 v60 = v36;
  BOOL v57 = v39;
  if (v42) {
    id v44 = *(void **)(v42 + 24);
  }
  else {
    id v44 = 0LL;
  }
  BOOL v45 = v37 == 2;
  id v46 = v44;
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 tokenChallenge]);
  unsigned __int8 v48 = -[NSPObliviousPath allowFailOpen](self, "allowFailOpen");
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousConfig](self, "obliviousConfig"));
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 proxyURLPath]);
  sub_100048804( (uint64_t)v70,  v67,  v72,  v71,  v58,  v45,  v56,  v47 != 0LL,  v48,  v49,  v51,  -[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType"));

  if (v57)
  {
  }

  LOBYTE(v3) = 1;
  return v3;
}

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[NSPObliviousPath pathReady](self, "pathReady"))
  {
    -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 1LL);
    unsigned int v5 = -[NSPObliviousPath resetFallbackProxyAgent](self, "resetFallbackProxyAgent");
    unsigned __int8 v6 = -[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:]( self,  "resetQUICProxyAgentForceUpdateDelegate:",  v3);
    -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 0LL);
    if (((v6 & 1) != 0 || v5) && !-[NSPObliviousPath deferCommit](self, "deferCommit"))
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
      [v7 commit];
    }
  }

- (void)removeProxyAgents
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicAgentUUID](self, "quicAgentUUID"));
  -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 1LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath quicRegistration](self, "quicRegistration"));
  sub_100045950((uint64_t)v3);

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath fallbackRegistration](self, "fallbackRegistration"));
  sub_100045950((uint64_t)v4);

  -[NSPObliviousPath setDeferAgentCommit:](self, "setDeferAgentCommit:", 0LL);
  if (!-[NSPObliviousPath deferCommit](self, "deferCommit"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer"));
    [v5 commit];
  }

  if (-[NSPObliviousPath obliviousAgentRegistered](self, "obliviousAgentRegistered"))
  {
    -[NSPObliviousPath setObliviousAgentRegistered:](self, "setObliviousAgentRegistered:", 0LL);
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath delegate](self, "delegate"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPObliviousPath obliviousTarget](self, "obliviousTarget"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 targetHost]);
    [v6 obliviousHopAgentUnregistered:self hostname:v8 agentUUID:v9];
  }

  -[NSPObliviousPath setQuicAgentUUID:](self, "setQuicAgentUUID:", 0LL);
  -[NSPObliviousPath setFallbackAgentUUID:](self, "setFallbackAgentUUID:", 0LL);
  -[NSPObliviousPath setQuicRegistration:](self, "setQuicRegistration:", 0LL);
  -[NSPObliviousPath setFallbackRegistration:](self, "setFallbackRegistration:", 0LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPObliviousPath;
  -[NSPObliviousPath dealloc](&v3, "dealloc");
}

- (NSPObliviousPathDelegate)delegate
{
  return (NSPObliviousPathDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSData)obliviousConfig
{
  return self->_obliviousConfig;
}

- (void)setObliviousConfig:(id)a3
{
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
}

- (NSPPrivacyProxyObliviousTargetInfo)obliviousTarget
{
  return self->_obliviousTarget;
}

- (void)setObliviousTarget:(id)a3
{
}

- (NSPProxyTokenInfo)proxyInfo
{
  return self->_proxyInfo;
}

- (void)setProxyInfo:(id)a3
{
}

- (NSUUID)quicAgentUUID
{
  return self->_quicAgentUUID;
}

- (void)setQuicAgentUUID:(id)a3
{
}

- (NSUUID)fallbackAgentUUID
{
  return self->_fallbackAgentUUID;
}

- (void)setFallbackAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)quicRegistration
{
  return self->_quicRegistration;
}

- (void)setQuicRegistration:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration
{
  return self->_fallbackRegistration;
}

- (void)setFallbackRegistration:(id)a3
{
}

- (BOOL)obliviousAgentRegistered
{
  return self->_obliviousAgentRegistered;
}

- (void)setObliviousAgentRegistered:(BOOL)a3
{
  self->_obliviousAgentRegistered = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)deferAgentCommit
{
  return self->_deferAgentCommit;
}

- (void)setDeferAgentCommit:(BOOL)a3
{
  self->_deferAgentCommit = a3;
}

- (int)obliviousHTTPType
{
  return self->_obliviousHTTPType;
}

- (void)setObliviousHTTPType:(int)a3
{
  self->_obliviousHTTPType = a3;
}

- (NSPProxyAgentNetworkStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (unsigned)transparencyState
{
  return self->_transparencyState;
}

- (void)setTransparencyState:(unsigned __int8)a3
{
  self->_transparencyState = a3;
}

- (void).cxx_destruct
{
}

@end