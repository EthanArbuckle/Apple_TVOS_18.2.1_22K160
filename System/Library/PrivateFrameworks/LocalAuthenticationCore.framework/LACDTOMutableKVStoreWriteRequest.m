@interface LACDTOMutableKVStoreWriteRequest
- (BOOL)bypassEntitlements;
- (BOOL)isEqual:(id)a3;
- (LACDTOKVStoreValue)value;
- (LACDTOMutableKVStoreWriteRequest)initWithKey:(int64_t)a3 value:(id)a4;
- (NSString)description;
- (NSUUID)contextUUID;
- (NSXPCConnection)connection;
- (int64_t)key;
- (void)setBypassEntitlements:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setContextUUID:(id)a3;
- (void)setKey:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation LACDTOMutableKVStoreWriteRequest

- (LACDTOMutableKVStoreWriteRequest)initWithKey:(int64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LACDTOMutableKVStoreWriteRequest;
  v8 = -[LACDTOMutableKVStoreWriteRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_key = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C791F10])
  {
    id v5 = v4;
    int64_t v6 = -[LACDTOMutableKVStoreWriteRequest key](self, "key");
    if (v6 == [v5 key])
    {
      -[LACDTOMutableKVStoreWriteRequest value](self, "value");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v5 value];
      if (v7 == (void *)v8)
      {
      }

      else
      {
        v9 = (void *)v8;
        v10 = -[LACDTOMutableKVStoreWriteRequest value](self, "value");
        [v5 value];
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_14;
        }
      }
      v14 = -[LACDTOMutableKVStoreWriteRequest connection](self, "connection");
      uint64_t v15 = [v5 connection];
      if (v14 == (void *)v15)
      {
      }

      else
      {
        v16 = (void *)v15;
        v17 = -[LACDTOMutableKVStoreWriteRequest connection](self, "connection");
        [v5 connection];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_14;
        }
      }
      v20 = -[LACDTOMutableKVStoreWriteRequest contextUUID](self, "contextUUID");
      uint64_t v21 = [v5 contextUUID];
      if (v20 == (void *)v21)
      {
      }

      else
      {
        v22 = (void *)v21;
        v23 = -[LACDTOMutableKVStoreWriteRequest contextUUID](self, "contextUUID");
        [v5 contextUUID];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_14;
        }
      }

      BOOL v27 = -[LACDTOMutableKVStoreWriteRequest bypassEntitlements](self, "bypassEntitlements");
      int v13 = v27 ^ [v5 bypassEntitlements] ^ 1;
      goto LABEL_15;
    }

- (NSString)description
{
  v24[5] = *MEMORY[0x1895F89C0];
  v20 = (void *)NSString;
  uint64_t v19 = objc_opt_class();
  v3 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LACDTOMutableKVStoreWriteRequest key](self, "key"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"key: %@", v23];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  id v4 = (void *)NSString;
  -[LACDTOMutableKVStoreWriteRequest value](self, "value");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"value: %@", v21];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  int64_t v6 = (void *)NSString;
  -[LACDTOMutableKVStoreWriteRequest connection](self, "connection");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFormat:@"connection: %@", v7];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  v9 = (void *)NSString;
  v10 = -[LACDTOMutableKVStoreWriteRequest contextUUID](self, "contextUUID");
  [v9 stringWithFormat:@"contextUUID: %@", v10];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  int v12 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableKVStoreWriteRequest bypassEntitlements](self, "bypassEntitlements"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 stringWithFormat:@"bypassEntitlements: %@", v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v14;
  [MEMORY[0x189603F18] arrayWithObjects:v24 count:5];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 componentsJoinedByString:@"; "];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 stringWithFormat:@"<%@ %p; %@>", v19, self, v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (LACDTOKVStoreValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
}

- (BOOL)bypassEntitlements
{
  return self->_bypassEntitlements;
}

- (void)setBypassEntitlements:(BOOL)a3
{
  self->_bypassEntitlements = a3;
}

- (void).cxx_destruct
{
}

@end