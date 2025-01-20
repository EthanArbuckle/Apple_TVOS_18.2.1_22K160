@interface SUCoreConnectMessage
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateMessageDictionary:(id)a3;
+ (id)nameForMessageType:(int64_t)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken;
- (NSDictionary)message;
- (NSError)error;
- (NSSet)allowlistedClasses;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)messageName;
- (SUCoreConnectMessage)initWithCoder:(id)a3;
- (SUCoreConnectMessage)initWithType:(int64_t)a3 messageName:(id)a4 clientID:(id)a5 version:(id)a6 message:(id)a7;
- (SUCoreConnectVersion)version;
- (id)description;
- (id)summary;
- (int)clientProcessIdentifier;
- (int64_t)messageType;
- (void)encodeWithCoder:(id)a3;
- (void)setClientConnectionAuditToken:(id *)a3;
@end

@implementation SUCoreConnectMessage

- (SUCoreConnectMessage)initWithType:(int64_t)a3 messageName:(id)a4 clientID:(id)a5 version:(id)a6 message:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    [MEMORY[0x189612778] sharedDiag];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a non-nil messageName";
LABEL_10:
    [v26 trackAnomaly:@"SUCoreConnectMessage" forReason:v28 withResult:8102 withError:0];

    v25 = 0LL;
    goto LABEL_11;
  }

  if (!v14)
  {
    [MEMORY[0x189612778] sharedDiag];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a non-nil clientID";
    goto LABEL_10;
  }

  if (!+[SUCoreConnectMessage validateMessageDictionary:]( &OBJC_CLASS___SUCoreConnectMessage,  "validateMessageDictionary:",  v16))
  {
    [MEMORY[0x189612778] sharedDiag];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = @"SUCoreConnectMessage requires a valid message dictionary";
    goto LABEL_10;
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___SUCoreConnectMessage;
  v17 = -[SUCoreConnectMessage init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_messageType = a3;
    objc_storeStrong((id *)&v17->_messageName, a4);
    v19 = (void *)NSString;
    [MEMORY[0x1896079D8] processInfo];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v19 stringWithFormat:@"%@.<%d>", v14, objc_msgSend(v20, "processIdentifier")];
    clientID = v18->_clientID;
    v18->_clientID = (NSString *)v21;

    objc_storeStrong((id *)&v18->_clientIDRaw, a5);
    [MEMORY[0x1896079D8] processInfo];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v18->_clientProcessIdentifier = [v23 processIdentifier];

    objc_storeStrong((id *)&v18->_version, a6);
    error = v18->_error;
    v18->_error = 0LL;

    objc_storeStrong((id *)&v18->_message, a7);
  }

  self = v18;
  v25 = self;
LABEL_11:

  return v25;
}

+ (BOOL)validateMessageDictionary:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInteger:forKey:",  -[SUCoreConnectMessage messageType](self, "messageType"),  @"MessageType");
  v5 = -[SUCoreConnectMessage messageName](self, "messageName");
  [v4 encodeObject:v5 forKey:@"MessageName"];
  v6 = -[SUCoreConnectMessage clientID](self, "clientID");
  [v4 encodeObject:v6 forKey:@"ClientID"];
  v7 = -[SUCoreConnectMessage clientIDRaw](self, "clientIDRaw");
  [v4 encodeObject:v7 forKey:@"ClientIDRaw"];

  objc_msgSend( v4,  "encodeInt:forKey:",  -[SUCoreConnectMessage clientProcessIdentifier](self, "clientProcessIdentifier"),  @"ClientProcessIdentifier");
  v8 = -[SUCoreConnectMessage version](self, "version");
  [v4 encodeObject:v8 forKey:@"Version"];
  v9 = -[SUCoreConnectMessage error](self, "error");
  [v4 encodeObject:v9 forKey:@"Error"];

  -[SUCoreConnectMessage message](self, "message");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"Message"];
}

- (SUCoreConnectMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___SUCoreConnectMessage;
  v5 = -[SUCoreConnectMessage init](&v39, sel_init);
  if (v5)
  {
    v5->_int64_t messageType = [v4 decodeIntegerForKey:@"MessageType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MessageName"];
    messageName = v5->_messageName;
    v5->_messageName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientIDRaw"];
    clientIDRaw = v5->_clientIDRaw;
    v5->_clientIDRaw = (NSString *)v10;

    v5->_clientProcessIdentifier = [v4 decodeIntForKey:@"ClientProcessIdentifier"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Version"];
    version = v5->_version;
    v5->_version = (SUCoreConnectVersion *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Error"];
    error = v5->_error;
    v5->_error = (NSError *)v14;

    int64_t messageType = v5->_messageType;
    if (messageType == 2)
    {
      v17 = +[SUCoreConnectClientPolicy getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "getAllowlistedClassesForKey:",  v5->_messageName);
      if (v17)
      {
LABEL_7:
        uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"Message"];
        message = v5->_message;
        v5->_message = (NSDictionary *)v18;

LABEL_13:
        goto LABEL_14;
      }

      v24 = (void *)[objc_alloc(NSString) initWithFormat:@"client policy does not define allowlisted classes for key: %@", v5->_messageName];
      [MEMORY[0x189612760] sharedCore];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v34 buildError:8902 underlying:v5->_error description:v24];
      v36 = v5->_error;
      v5->_error = (NSError *)v35;

      v37 = v5->_message;
      v5->_message = 0LL;

      [MEMORY[0x189612778] sharedDiag];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      uint64_t v33 = 8902LL;
    }

    else
    {
      if (messageType != 1)
      {
        v17 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"no connect policy type could be determined for message with type: %ld",  v5->_messageType);
        [MEMORY[0x189612760] sharedCore];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 buildError:8901 underlying:v5->_error description:v17];
        v22 = v5->_error;
        v5->_error = (NSError *)v21;

        v23 = v5->_message;
        v5->_message = 0LL;

        [MEMORY[0x189612778] sharedDiag];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 trackError:@"SUCoreConnectMessageDecode" forReason:v17 withResult:8901 withError:v5->_error];
LABEL_12:

        goto LABEL_13;
      }
      v17 = +[SUCoreConnectServerPolicy getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "getAllowlistedClassesForKey:",  v5->_messageName);
      if (v17) {
        goto LABEL_7;
      }
      v24 = (void *)[objc_alloc(NSString) initWithFormat:@"server policy does not define allowlisted classes for key: %@", v5->_messageName];
      [MEMORY[0x189612760] sharedCore];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v25 buildError:8904 underlying:v5->_error description:v24];
      v27 = v5->_error;
      v5->_error = (NSError *)v26;

      v28 = v5->_message;
      v5->_message = 0LL;

      [MEMORY[0x189612778] sharedDiag];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_super v30 = v29;
      v31 = v5->_error;
      v32 = v24;
      uint64_t v33 = 8904LL;
    }

    [v29 trackError:@"SUCoreConnectMessageDecode" forReason:v32 withResult:v33 withError:v31];

    goto LABEL_12;
  }

+ (id)nameForMessageType:(int64_t)a3
{
  if (a3 == 1) {
    return @"CLIENT_MESSAGE";
  }
  if (a3 == 2)
  {
    v3 = @"SERVER_MESSAGE";
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UNKNOWN_TYPE(%lu)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)summary
{
  v3 = (void *)NSString;
  -[SUCoreConnectMessage clientID](self, "clientID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SUCoreConnectMessage nameForMessageType:]( &OBJC_CLASS___SUCoreConnectMessage,  "nameForMessageType:",  -[SUCoreConnectMessage messageType](self, "messageType"));
  -[SUCoreConnectMessage messageName](self, "messageName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCoreConnectMessage(clientID:%@|type:%@|name:%@)", v4, v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  v2 = self;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  v3 = -[SUCoreConnectMessage message](self, "message");
  id v4 = @"[>>>\n";
  if (!v3) {
    id v4 = 0LL;
  }
  v5 = v4;

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  -[SUCoreConnectMessage message](v2, "message");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v6 = *(void *)v44;
    uint64_t v33 = *(void *)v44;
    v34 = v2;
    do
    {
      for (uint64_t i = 0LL; i != v37; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v9 = -[SUCoreConnectMessage message](v2, "message");
        [v9 objectForKey:v8];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v38 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = v5;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v40;
            id v15 = @"{\n";
            do
            {
              uint64_t v16 = 0LL;
              v17 = v15;
              do
              {
                if (*(void *)v40 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * v16);
                [v11 objectForKey:v18];
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", @"\t\t%@: %@\n", v18, v19);
                id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

                ++v16;
                v17 = v15;
              }

              while (v13 != v16);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }

            while (v13);
          }

          else
          {
            id v15 = @"{\n";
          }

          v20 = v36;
          -[__CFString stringByAppendingFormat:](v36, "stringByAppendingFormat:", @"\t%@: %@\n\t}\n", v8, v15);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v6 = v33;
          v2 = v34;
        }

        else
        {
          -[SUCoreConnectMessage message](v2, "message");
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v20 = -[__CFString objectForKey:](v15, "objectForKey:", v8);
          uint64_t v21 = -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", @"\t%@: %@\n", v8, v20);

          v5 = (__CFString *)v21;
        }
      }

      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v37);
  }

  if (v5)
  {
    v22 = -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", @"<<<]");
  }

  else
  {
    v22 = 0LL;
  }

  v23 = (void *)NSString;
  v24 = +[SUCoreConnectMessage nameForMessageType:]( &OBJC_CLASS___SUCoreConnectMessage,  "nameForMessageType:",  -[SUCoreConnectMessage messageType](v2, "messageType"));
  v25 = -[SUCoreConnectMessage messageName](v2, "messageName");
  -[SUCoreConnectMessage clientID](v2, "clientID");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[SUCoreConnectMessage clientIDRaw](v2, "clientIDRaw");
  uint64_t v28 = -[SUCoreConnectMessage clientProcessIdentifier](v2, "clientProcessIdentifier");
  v29 = -[SUCoreConnectMessage version](v2, "version");
  -[SUCoreConnectMessage error](v2, "error");
  objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 stringWithFormat:@"SUCoreConnectMessage(type:%@|name:%@|clientID:%@|clientIDRaw:%@|clientProcessIdentifier:%d|version:%@|error:%@|message:%@)", v24, v25, v26, v27, v28, v29, v30, v22];
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (SUCoreConnectVersion)version
{
  return self->_version;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)message
{
  return self->_message;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  __int128 v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = v3;
}

- (NSSet)allowlistedClasses
{
  return self->_allowlistedClasses;
}

- (void).cxx_destruct
{
}

@end