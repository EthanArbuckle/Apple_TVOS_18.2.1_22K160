@interface CBService
- (BOOL)isPrimary;
- (CBPeripheral)peripheral;
- (CBService)initWithPeripheral:(id)a3 dictionary:(id)a4;
- (NSArray)characteristics;
- (NSArray)includedServices;
- (NSNumber)endHandle;
- (NSNumber)startHandle;
- (id)description;
- (id)handleCharacteristicsDiscovered:(id)a3;
- (id)handleIncludedServicesDiscovered:(id)a3;
- (void)invalidate;
- (void)setCharacteristics:(id)a3;
- (void)setIncludedServices:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
@end

@implementation CBService

- (CBService)initWithPeripheral:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v8);
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CBService;
  v10 = -[CBAttribute initWithUUID:](&v17, sel_initWithUUID_, v9);

  if (v10)
  {
    objc_storeWeak((id *)&v10->_peripheral, v6);
    [v7 objectForKeyedSubscript:@"kCBMsgArgType"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_isPrimary = [v11 BOOLValue];

    uint64_t v12 = [v7 objectForKeyedSubscript:@"kCBMsgArgServiceStartHandle"];
    startHandle = v10->_startHandle;
    v10->_startHandle = (NSNumber *)v12;

    uint64_t v14 = [v7 objectForKeyedSubscript:@"kCBMsgArgServiceEndHandle"];
    endHandle = v10->_endHandle;
    v10->_endHandle = (NSNumber *)v14;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isPrimary) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  -[CBAttribute UUID](self, "UUID");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %p, isPrimary = %@, UUID = %@>", v4, self, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v3 = self->_includedServices;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) invalidate];
      }

      while (v5 != v7);
      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v5);
  }

  -[CBService setIncludedServices:](self, "setIncludedServices:", 0LL);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v8 = self->_characteristics;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "invalidate", (void)v14);
      }

      while (v10 != v12);
      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v22,  16LL);
    }

    while (v10);
  }

  -[CBService setCharacteristics:](self, "setCharacteristics:", 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
  [WeakRetained removeAttributeForHandle:self->_startHandle];
}

- (id)handleIncludedServicesDiscovered:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"kCBMsgArgServices"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:self->_includedServices];
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v6 = v4;
  uint64_t v7 = self;
  id v8 = v6;
  uint64_t v32 = [v6 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v32)
  {
LABEL_25:

    v28 = v7;
    v29 = (void *)[v5 copy];
    -[CBService setIncludedServices:](v28, "setIncludedServices:", v29);

    v27 = v28;
    goto LABEL_26;
  }

  uint64_t v10 = *(void *)v35;
  *(void *)&__int128 v9 = 138412546LL;
  __int128 v31 = v9;
LABEL_4:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v35 != v10) {
      objc_enumerationMutation(v8);
    }
    uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
    uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"kCBMsgArgServiceStartHandle", v31);
    p_peripheral = (id *)&v7->_peripheral;
    id WeakRetained = objc_loadWeakRetained((id *)&v7->_peripheral);
    v33 = (void *)v13;
    [WeakRetained attributeForHandle:v13];
    __int128 v16 = (CBService *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (([v5 containsObject:v16] & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_5;
    }

    [v12 objectForKeyedSubscript:@"kCBMsgArgUUID"];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v17 length] != 2 && objc_msgSend(v17, "length") != 4 && objc_msgSend(v17, "length") != 16)
    {
      break;
    }

    __int128 v18 = objc_alloc(&OBJC_CLASS___CBService);
    uint64_t v19 = v10;
    __int128 v20 = v5;
    id v21 = v8;
    v22 = v7;
    id v23 = objc_loadWeakRetained((id *)&v7->_peripheral);
    __int128 v16 = -[CBService initWithPeripheral:dictionary:](v18, "initWithPeripheral:dictionary:", v23, v12);

    id v24 = objc_loadWeakRetained(p_peripheral);
    v25 = -[CBService startHandle](v16, "startHandle");
    [v24 setAttribute:v16 forHandle:v25];

    uint64_t v7 = v22;
    id v8 = v21;
    uint64_t v5 = v20;
    uint64_t v10 = v19;

    if (([v5 containsObject:v16] & 1) == 0)
    {
LABEL_16:
      [v5 addObject:v16];
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      v26 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v31;
        v39 = v16;
        __int16 v40 = 2112;
        v41 = v7;
        _os_log_debug_impl(&dword_186F9B000, v26, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }

- (id)handleCharacteristicsDiscovered:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  [a3 objectForKeyedSubscript:@"kCBMsgArgCharacteristics"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithArray:self->_characteristics];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
  id v25 = v6;
  if (!v7)
  {
LABEL_25:

    v22 = (void *)[v5 copy];
    -[CBService setCharacteristics:](self, "setCharacteristics:", v22);

    id v6 = v25;
    id v21 = self;
    goto LABEL_26;
  }

  uint64_t v9 = v7;
  uint64_t v26 = *(void *)v28;
  *(void *)&__int128 v8 = 138412546LL;
  __int128 v24 = v8;
LABEL_4:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v28 != v26) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
    objc_msgSend(v11, "objectForKeyedSubscript:", @"kCBMsgArgCharacteristicHandle", v24);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_peripheral);
    [WeakRetained attributeForHandle:v12];
    __int128 v14 = (CBCharacteristic *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (([v5 containsObject:v14] & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_5;
    }

    [v11 objectForKeyedSubscript:@"kCBMsgArgUUID"];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v15 length] != 2 && objc_msgSend(v15, "length") != 4 && objc_msgSend(v15, "length") != 16)
    {
      break;
    }

    __int128 v14 = -[CBCharacteristic initWithService:dictionary:]( objc_alloc(&OBJC_CLASS___CBCharacteristic),  "initWithService:dictionary:",  self,  v11);
    id v16 = objc_loadWeakRetained((id *)&self->_peripheral);
    -[CBCharacteristic handle](v14, "handle");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setAttribute:v14 forHandle:v17];

    id v18 = objc_loadWeakRetained((id *)&self->_peripheral);
    -[CBCharacteristic valueHandle](v14, "valueHandle");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setAttribute:v14 forHandle:v19];

    id v6 = v25;
    if (([v5 containsObject:v14] & 1) == 0)
    {
LABEL_16:
      [v5 addObject:v14];
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      __int128 v20 = (os_log_s *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v24;
        uint64_t v32 = v14;
        __int16 v33 = 2112;
        __int128 v34 = self;
        _os_log_debug_impl(&dword_186F9B000, v20, OS_LOG_TYPE_DEBUG, "Added %@ to %@", buf, 0x16u);
      }
    }

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_loadWeakRetained((id *)&self->_peripheral);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSArray)includedServices
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setIncludedServices:(id)a3
{
}

- (NSArray)characteristics
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCharacteristics:(id)a3
{
}

- (NSNumber)startHandle
{
  return self->_startHandle;
}

- (NSNumber)endHandle
{
  return self->_endHandle;
}

- (void).cxx_destruct
{
}

- (void)handleIncludedServicesDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_0_1( &dword_186F9B000,  v0,  v1,  "Data in %@ does not contain a valid UUID for included service handle = %@");
}

- (void)handleCharacteristicsDiscovered:.cold.1()
{
  OUTLINED_FUNCTION_0_1( &dword_186F9B000,  v0,  v1,  "Data in %@ does not contain a valid UUID for characteristic handle = %@");
}

@end