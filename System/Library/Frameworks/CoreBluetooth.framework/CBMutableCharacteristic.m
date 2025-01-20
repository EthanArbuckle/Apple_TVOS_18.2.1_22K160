@interface CBMutableCharacteristic
- (BOOL)handleCentralSubscribed:(id)a3;
- (BOOL)handleCentralUnsubscribed:(id)a3;
- (CBAttributePermissions)permissions;
- (CBMutableCharacteristic)initWithService:(id)a3 dictionary:(id)a4;
- (CBMutableCharacteristic)initWithType:(CBUUID *)UUID properties:(CBCharacteristicProperties)properties value:(NSData *)value permissions:(CBAttributePermissions)permissions;
- (NSArray)subscribedCentrals;
- (NSNumber)ID;
- (id)description;
- (void)dealloc;
- (void)handlePowerNotOn;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setID:(id)a3;
- (void)setPermissions:(CBAttributePermissions)permissions;
@end

@implementation CBMutableCharacteristic

- (CBMutableCharacteristic)initWithType:(CBUUID *)UUID properties:(CBCharacteristicProperties)properties value:(NSData *)value permissions:(CBAttributePermissions)permissions
{
  v10 = value;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CBMutableCharacteristic;
  v11 = -[CBAttribute initWithUUID:](&v16, sel_initWithUUID_, UUID);
  v12 = v11;
  if (v11)
  {
    -[CBCharacteristic setValue:](v11, "setValue:", v10);
    v12->_permissions = permissions;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    subscribedCentrals = v12->_subscribedCentrals;
    v12->_subscribedCentrals = v13;

    -[CBCharacteristic setProperties:](v12, "setProperties:", properties);
    -[CBMutableCharacteristic addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"properties",  0LL,  0LL);
    -[CBMutableCharacteristic addObserver:forKeyPath:options:context:]( v12,  "addObserver:forKeyPath:options:context:",  v12,  @"descriptors",  0LL,  0LL);
  }

  return v12;
}

- (CBMutableCharacteristic)initWithService:(id)a3 dictionary:(id)a4
{
  id v5 = a4;
  [v5 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v6);
  [v5 objectForKeyedSubscript:@"kCBMsgArgCharacteristicProperties"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 integerValue];

  [v5 objectForKeyedSubscript:@"kCBMsgArgAttributePermissions"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 integerValue];

  [v5 objectForKeyedSubscript:@"kCBMsgArgData"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CBMutableCharacteristic initWithType:properties:value:permissions:]( self,  "initWithType:properties:value:permissions:",  v7,  v9,  v12,  v11);
  if (v13)
  {
    uint64_t v14 = [v5 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
    ID = v13->_ID;
    v13->_ID = (NSNumber *)v14;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CBMutableCharacteristic;
  -[CBMutableCharacteristic dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if ([v8 isEqualToString:@"descriptors"])
  {
    SEL v26 = a2;
    id v27 = v8;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    -[CBCharacteristic descriptors](self, "descriptors");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      int v12 = 0;
      uint64_t v29 = *(void *)v31;
      v13 = off_189FB1000;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          while (1)
          {
            v15 = self;
            if (*(void *)v31 != v29) {
              objc_enumerationMutation(obj);
            }
            objc_super v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            [v16 UUID];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[__objc2_class UUIDWithString:](v13[16], "UUIDWithString:", @"2901");
            int v19 = [v17 isEqual:v18];

            if (!v19) {
              break;
            }
            self = v15;
            if ((v11 & 1) != 0)
            {
              [MEMORY[0x1896077D8] currentHandler];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v23 handleFailureInMethod:v26 object:v15 file:@"CBCharacteristic.m" lineNumber:194 description:@"Cannot have more than one User Description descriptor per characteristic"];
              char v11 = 1;
              goto LABEL_17;
            }

            char v11 = 1;
LABEL_13:
            v13 = off_189FB1000;
            [v16 setCharacteristic:self];
            if (v10 == ++i) {
              goto LABEL_4;
            }
          }

          [v16 UUID];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[__objc2_class UUIDWithString:](v13[16], "UUIDWithString:", @"2904");
          int v22 = [v20 isEqual:v21];

          if ((v22 & v12) != 1)
          {
            v12 |= v22;
            self = v15;
            goto LABEL_13;
          }

          [MEMORY[0x1896077D8] currentHandler];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          self = v15;
          [v23 handleFailureInMethod:v26 object:v15 file:@"CBCharacteristic.m" lineNumber:198 description:@"Cannot have more than one Format descriptor per characteristic"];
          int v12 = 1;
LABEL_17:
          v13 = off_189FB1000;

          [v16 setCharacteristic:self];
        }

- (BOOL)handleCentralSubscribed:(id)a3
{
  id v4 = a3;
  char v5 = -[NSMutableArray containsObject:](self->_subscribedCentrals, "containsObject:", v4);
  if ((v5 & 1) == 0) {
    -[NSMutableArray addObject:](self->_subscribedCentrals, "addObject:", v4);
  }

  return v5 ^ 1;
}

- (BOOL)handleCentralUnsubscribed:(id)a3
{
  id v4 = a3;
  int v5 = -[NSMutableArray containsObject:](self->_subscribedCentrals, "containsObject:", v4);
  if (v5) {
    -[NSMutableArray removeObject:](self->_subscribedCentrals, "removeObject:", v4);
  }

  return v5;
}

- (void)handlePowerNotOn
{
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  -[CBAttribute UUID](self, "UUID");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CBCharacteristic value](self, "value");
  CBCharacteristicProperties v7 = -[CBCharacteristic properties](self, "properties");
  CBAttributePermissions v8 = -[CBMutableCharacteristic permissions](self, "permissions");
  -[CBCharacteristic descriptors](self, "descriptors");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %p UUID = %@, Value = %@, Properties = 0x%lX, Permissions = 0x%lX, Descriptors = %@, SubscribedCentrals = %@>", v4, self, v5, v6, v7, v8, v9, self->_subscribedCentrals];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)subscribedCentrals
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (CBAttributePermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(CBAttributePermissions)permissions
{
  self->_permissions = permissions;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end