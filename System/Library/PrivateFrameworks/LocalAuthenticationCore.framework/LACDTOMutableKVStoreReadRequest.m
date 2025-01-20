@interface LACDTOMutableKVStoreReadRequest
- (BOOL)bypassEntitlements;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableKVStoreReadRequest)initWithKey:(int64_t)a3;
- (NSString)description;
- (NSXPCConnection)connection;
- (int64_t)key;
- (void)setBypassEntitlements:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setKey:(int64_t)a3;
@end

@implementation LACDTOMutableKVStoreReadRequest

- (LACDTOMutableKVStoreReadRequest)initWithKey:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACDTOMutableKVStoreReadRequest;
  result = -[LACDTOMutableKVStoreReadRequest init](&v5, sel_init);
  if (result) {
    result->_key = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C79A9F0])
  {
    id v5 = v4;
    int64_t v6 = -[LACDTOMutableKVStoreReadRequest key](self, "key");
    if (v6 == [v5 key])
    {
      v7 = -[LACDTOMutableKVStoreReadRequest connection](self, "connection");
      uint64_t v8 = [v5 connection];
      if (v7 == (void *)v8)
      {
      }

      else
      {
        v9 = (void *)v8;
        v10 = -[LACDTOMutableKVStoreReadRequest connection](self, "connection");
        [v5 connection];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }

      BOOL v14 = -[LACDTOMutableKVStoreReadRequest bypassEntitlements](self, "bypassEntitlements");
      int v13 = v14 ^ [v5 bypassEntitlements] ^ 1;
      goto LABEL_9;
    }

- (NSString)description
{
  v18[3] = *MEMORY[0x1895F89C0];
  v17 = (void *)NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = (void *)NSString;
  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", -[LACDTOMutableKVStoreReadRequest key](self, "key"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"key: %@", v5];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)NSString;
  -[LACDTOMutableKVStoreReadRequest connection](self, "connection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"connection: %@", v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)NSString;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LACDTOMutableKVStoreReadRequest bypassEntitlements](self, "bypassEntitlements"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 stringWithFormat:@"bypassEntitlements: %@", v11];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:3];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 componentsJoinedByString:@"; "];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
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