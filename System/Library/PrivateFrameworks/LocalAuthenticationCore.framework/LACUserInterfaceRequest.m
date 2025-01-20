@interface LACUserInterfaceRequest
+ (BOOL)supportsSecureCoding;
+ (id)unknownInstance;
- (BOOL)isAuditTokenApplicationIdentity;
- (BOOL)isForSiri;
- (BOOL)isForSoftwareUpdate;
- (LACClientInfo)clientInfo;
- (LACUserInterfaceRequest)init;
- (LACUserInterfaceRequest)initWithCoder:(id)a3;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4;
- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4 contextID:(id)a5;
- (NSData)clientAuditTokenData;
- (NSString)description;
- (NSUUID)contextID;
- (int)clientProcessId;
- (unsigned)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setClientProcessId:(int)a3;
- (void)setContextID:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setIsAuditTokenApplicationIdentity:(BOOL)a3;
- (void)setIsForSiri:(BOOL)a3;
- (void)setIsForSoftwareUpdate:(BOOL)a3;
@end

@implementation LACUserInterfaceRequest

- (LACUserInterfaceRequest)init
{
  return -[LACUserInterfaceRequest initWithIdentifier:](self, "initWithIdentifier:", 0LL);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3
{
  return -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:contextID:]( self,  "initWithIdentifier:evaluationRequest:contextID:",  a3,  0LL,  0LL);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4
{
  return -[LACUserInterfaceRequest initWithIdentifier:evaluationRequest:contextID:]( self,  "initWithIdentifier:evaluationRequest:contextID:",  a3,  a4,  0LL);
}

- (LACUserInterfaceRequest)initWithIdentifier:(int64_t)a3 evaluationRequest:(id)a4 contextID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___LACUserInterfaceRequest;
  v10 = -[LACUserInterfaceRequest init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    -[LACUserInterfaceRequest setIdentifier:](v10, "setIdentifier:", a3);
    -[LACUserInterfaceRequest setContextID:](v11, "setContextID:", v9);
    [v8 client];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 options];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[LACClientInfoProvider infoForXPCClient:evaluationOptions:]( &OBJC_CLASS___LACClientInfoProvider,  "infoForXPCClient:evaluationOptions:",  v12,  v13);
    -[LACUserInterfaceRequest setClientInfo:](v11, "setClientInfo:", v14);

    [v8 payload];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"kLACEvaluationRequestPayloadKeyInternalInfo"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 options];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithInteger:1080];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:v18];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19) {
      char v20 = [v19 integerValue];
    }
    else {
      char v20 = 3;
    }
    -[LACUserInterfaceRequest setClientAuditTokenData:](v11, "setClientAuditTokenData:", 0LL);
    [v16 objectForKeyedSubscript:@"ProcessId"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceRequest setClientProcessId:](v11, "setClientProcessId:", [v21 intValue]);

    -[LACUserInterfaceRequest setIsAuditTokenApplicationIdentity:]( v11,  "setIsAuditTokenApplicationIdentity:",  (v20 & 4) != 0LL);
    [v16 objectForKeyedSubscript:@"SiriPlugin"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUserInterfaceRequest setIsForSiri:](v11, "setIsForSiri:", [v22 BOOLValue]);

    -[LACUserInterfaceRequest setIsForSoftwareUpdate:]( v11,  "setIsForSoftwareUpdate:",  [v8 policy] == 1010);
  }

  return v11;
}

+ (id)unknownInstance
{
  return objc_alloc_init(&OBJC_CLASS___LACUserInterfaceRequest);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[LACUserInterfaceRequest identifier](self, "identifier");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v5 forKey:v6];
  v7 = -[LACUserInterfaceRequest contextID](self, "contextID");
  NSStringFromSelector(sel_contextID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:v8];

  -[LACUserInterfaceRequest clientAuditTokenData](self, "clientAuditTokenData");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clientAuditTokenData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:v10];
  v11 = -[LACUserInterfaceRequest clientInfo](self, "clientInfo");
  NSStringFromSelector(sel_clientInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = -[LACUserInterfaceRequest clientProcessId](self, "clientProcessId");
  NSStringFromSelector(sel_clientProcessId);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeInt:v13 forKey:v14];

  BOOL v15 = -[LACUserInterfaceRequest isAuditTokenApplicationIdentity](self, "isAuditTokenApplicationIdentity");
  NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = -[LACUserInterfaceRequest isForSiri](self, "isForSiri");
  NSStringFromSelector(sel_isForSiri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = -[LACUserInterfaceRequest isForSoftwareUpdate](self, "isForSoftwareUpdate");
  NSStringFromSelector(sel_isForSoftwareUpdate);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v19 forKey:v20];
}

- (LACUserInterfaceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[LACUserInterfaceRequest init](self, "init");
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIdentifier:](v5, "setIdentifier:", [v4 decodeIntegerForKey:v6]);

  uint64_t v7 = objc_opt_class();
  NSStringFromSelector(sel_contextID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v7 forKey:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setContextID:](v5, "setContextID:", v9);

  uint64_t v10 = objc_opt_class();
  NSStringFromSelector(sel_clientAuditTokenData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v10 forKey:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientAuditTokenData:](v5, "setClientAuditTokenData:", v12);

  uint64_t v13 = objc_opt_class();
  NSStringFromSelector(sel_clientInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:v13 forKey:v14];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientInfo:](v5, "setClientInfo:", v15);

  NSStringFromSelector(sel_clientProcessId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setClientProcessId:](v5, "setClientProcessId:", [v4 decodeIntForKey:v16]);

  NSStringFromSelector(sel_isAuditTokenApplicationIdentity);
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIsAuditTokenApplicationIdentity:]( v5,  "setIsAuditTokenApplicationIdentity:",  [v4 decodeBoolForKey:v17]);

  NSStringFromSelector(sel_isForSiri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequest setIsForSiri:](v5, "setIsForSiri:", [v4 decodeBoolForKey:v18]);

  NSStringFromSelector(sel_isForSoftwareUpdate);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v4 decodeBoolForKey:v19];

  -[LACUserInterfaceRequest setIsForSoftwareUpdate:](v5, "setIsForSoftwareUpdate:", v20);
  return v5;
}

- (NSString)description
{
  v37[8] = *MEMORY[0x1895F89C0];
  v32 = (void *)NSString;
  uint64_t v31 = objc_opt_class();
  v3 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[LACUserInterfaceRequest identifier](self, "identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"identifier: %@", v36];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  id v4 = (void *)NSString;
  uint64_t v5 = -[LACUserInterfaceRequest contextID](self, "contextID");
  v34 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x189603FE8] null];
  }

  v25 = (void *)v5;
  [v4 stringWithFormat:@"contextID: %@", v5];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  v6 = (void *)NSString;
  uint64_t v7 = -[LACUserInterfaceRequest clientAuditTokenData](self, "clientAuditTokenData");
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x189603FE8] null];
  }

  objc_super v24 = (void *)v7;
  [v6 stringWithFormat:@"clientAuditTokenData: %@", v7];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v30;
  id v9 = (void *)NSString;
  v29 = -[LACUserInterfaceRequest clientInfo](self, "clientInfo");
  [v9 stringWithFormat:@"clientInfo: %@", v29];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v28;
  uint64_t v10 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[LACUserInterfaceRequest clientProcessId](self, "clientProcessId"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"clientProcessId: %@", v27];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v26;
  v11 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUserInterfaceRequest isAuditTokenApplicationIdentity](self, "isAuditTokenApplicationIdentity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 stringWithFormat:@"isAuditTokenApplicationIdentity: %@", v12];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v13;
  v14 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", -[LACUserInterfaceRequest isForSiri](self, "isForSiri"));
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 stringWithFormat:@"isForSiri: %@", v15];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v16;
  BOOL v17 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACUserInterfaceRequest isForSoftwareUpdate](self, "isForSoftwareUpdate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"isForSoftwareUpdate: %@", v18];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v19;
  [MEMORY[0x189603F18] arrayWithObjects:v37 count:8];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 componentsJoinedByString:@"; "];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 stringWithFormat:@"<%@ %p; %@>", v31, self, v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
  if (!v34)
  }

  return (NSString *)v22;
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (LACClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (int)clientProcessId
{
  return self->_clientProcessId;
}

- (void)setClientProcessId:(int)a3
{
  self->_clientProcessId = a3;
}

- (BOOL)isAuditTokenApplicationIdentity
{
  return self->_isAuditTokenApplicationIdentity;
}

- (void)setIsAuditTokenApplicationIdentity:(BOOL)a3
{
  self->_isAuditTokenApplicationIdentity = a3;
}

- (BOOL)isForSiri
{
  return self->_isForSiri;
}

- (void)setIsForSiri:(BOOL)a3
{
  self->_isForSiri = a3;
}

- (BOOL)isForSoftwareUpdate
{
  return self->_isForSoftwareUpdate;
}

- (void)setIsForSoftwareUpdate:(BOOL)a3
{
  self->_isForSoftwareUpdate = a3;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end