@interface CBCharacteristic
- (BOOL)isBroadcasted;
- (BOOL)isNotifying;
- (CBCharacteristic)initWithService:(id)a3 dictionary:(id)a4;
- (CBCharacteristicProperties)properties;
- (CBPeripheral)peripheral;
- (CBService)service;
- (NSArray)descriptors;
- (NSData)value;
- (NSNumber)handle;
- (NSNumber)valueHandle;
- (id)description;
- (id)handleDescriptorsDiscovered:(id)a3;
- (id)handleValueBroadcasted:(id)a3;
- (id)handleValueNotifying:(id)a3;
- (id)handleValueUpdated:(id)a3;
- (unint64_t)valueTimestamp;
- (void)invalidate;
- (void)setDescriptors:(id)a3;
- (void)setIsNotifying:(BOOL)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CBCharacteristic

- (CBCharacteristic)initWithService:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v8);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CBCharacteristic;
  v10 = -[CBAttribute initWithUUID:](&v21, sel_initWithUUID_, v9);

  if (v10)
  {
    [v7 objectForKeyedSubscript:@"kCBMsgArgCharacteristicProperties"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_properties = [v11 unsignedIntegerValue];

    uint64_t v12 = [v7 objectForKeyedSubscript:@"kCBMsgArgCharacteristicHandle"];
    handle = v10->_handle;
    v10->_handle = (NSNumber *)v12;

    uint64_t v14 = [v7 objectForKeyedSubscript:@"kCBMsgArgCharacteristicValueHandle"];
    valueHandle = v10->_valueHandle;
    v10->_valueHandle = (NSNumber *)v14;

    uint64_t v16 = [v7 objectForKeyedSubscript:@"kCBMsgArgData"];
    value = v10->_value;
    v10->_value = (NSData *)v16;

    v10->_valueTimestamp = 0LL;
    uint64_t v18 = [v6 peripheral];
    peripheral = v10->_peripheral;
    v10->_peripheral = (CBPeripheral *)v18;

    objc_storeWeak((id *)&v10->_service, v6);
    v10->_isBroadcasted = 0;
    v10->_isNotifying = 0;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = -[CBAttribute UUID](self, "UUID");
  unint64_t properties = self->_properties;
  uint64_t v7 = -[CBCharacteristic value](self, "value");
  v8 = (void *)v7;
  if (self->_isNotifying) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 stringWithFormat:@"<%@: %p, UUID = %@, unint64_t properties = 0x%lX, value = %@, notifying = %@>", v4, self, v5, properties, v7, v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = self->_descriptors;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invalidate", (void)v8);
      }

      while (v5 != v7);
      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[CBCharacteristic setDescriptors:](self, "setDescriptors:", 0LL);
  -[CBPeripheral removeAttributeForHandle:](self->_peripheral, "removeAttributeForHandle:", self->_valueHandle);
  -[CBPeripheral removeAttributeForHandle:](self->_peripheral, "removeAttributeForHandle:", self->_handle);
}

- (id)handleValueUpdated:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"kCBMsgArgData"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"kCBMsgArgTimestamp"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBCharacteristic setValue:](self, "setValue:", v5);
  self->_valueTimestamp = [v6 unsignedLongLongValue];

  return self;
}

- (id)handleValueBroadcasted:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isBroadcasted = [v4 BOOLValue];

  return self;
}

- (id)handleValueNotifying:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isNotifying = [v4 BOOLValue];

  return self;
}

- (id)handleDescriptorsDiscovered:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"kCBMsgArgDescriptors"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:self->_descriptors];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v6 = v4;
  uint64_t v24 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v24)
  {
LABEL_25:

    v19 = (void *)[v5 copy];
    -[CBCharacteristic setDescriptors:](v25, "setDescriptors:", v19);

    uint64_t v18 = v25;
    goto LABEL_26;
  }

  uint64_t v8 = *(void *)v27;
  *(void *)&__int128 v7 = 138412546LL;
  __int128 v21 = v7;
  v22 = v6;
  v23 = v5;
LABEL_4:
  uint64_t v9 = 0LL;
  while (1)
  {
    if (*(void *)v27 != v8) {
      objc_enumerationMutation(v6);
    }
    __int128 v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
    objc_msgSend(v10, "objectForKeyedSubscript:", @"kCBMsgArgDescriptorHandle", v21);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBPeripheral attributeForHandle:](v25->_peripheral, "attributeForHandle:", v11);
    uint64_t v12 = (CBDescriptor *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (([v5 containsObject:v12] & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_5;
    }

    [v10 objectForKeyedSubscript:@"kCBMsgArgUUID"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v13 length] != 2 && objc_msgSend(v13, "length") != 4 && objc_msgSend(v13, "length") != 16)
    {
      break;
    }

    uint64_t v12 = -[CBDescriptor initWithCharacteristic:dictionary:]( objc_alloc(&OBJC_CLASS___CBDescriptor),  "initWithCharacteristic:dictionary:",  v25,  v10);
    peripheral = v25->_peripheral;
    v15 = -[CBDescriptor handle](v12, "handle");
    -[CBPeripheral setAttribute:forHandle:](peripheral, "setAttribute:forHandle:", v12, v15);

    id v6 = v22;
    uint64_t v5 = v23;
    if (([v23 containsObject:v12] & 1) == 0)
    {
LABEL_16:
      [v5 addObject:v12];
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v16 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v21;
        v31 = v12;
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_debug_impl(&dword_186F9B000, v16, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }

- (CBService)service
{
  return (CBService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
}

- (CBCharacteristicProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(unint64_t)a3
{
  self->_unint64_t properties = a3;
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setValue:(id)a3
{
}

- (NSArray)descriptors
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDescriptors:(id)a3
{
}

- (BOOL)isBroadcasted
{
  return self->_isBroadcasted;
}

- (BOOL)isNotifying
{
  return self->_isNotifying;
}

- (void)setIsNotifying:(BOOL)a3
{
  self->_isNotifying = a3;
}

- (unint64_t)valueTimestamp
{
  return self->_valueTimestamp;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (NSNumber)handle
{
  return self->_handle;
}

- (NSNumber)valueHandle
{
  return self->_valueHandle;
}

- (void).cxx_destruct
{
}

- (void)handleDescriptorsDiscovered:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl( &dword_186F9B000,  log,  OS_LOG_TYPE_DEBUG,  "Data in %@ does not contain a valid UUID for descriptor handle = %@",  (uint8_t *)&v3,  0x16u);
}

@end