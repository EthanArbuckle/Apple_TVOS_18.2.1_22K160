@interface TKSmartCardATR
- (NSArray)historicalRecords;
- (NSArray)protocols;
- (NSData)bytes;
- (NSData)historicalBytes;
- (TKSmartCardATR)initWithBytes:(NSData *)bytes;
- (TKSmartCardATR)initWithSource:(void *)source;
- (TKSmartCardATRInterfaceGroup)interfaceGroupAtIndex:(NSInteger)index;
- (TKSmartCardATRInterfaceGroup)interfaceGroupForProtocol:(TKSmartCardProtocol)protocol;
- (id)_formatHexData:(id)a3 to:(id)a4;
- (id)description;
- (id)parseFromSource:(id)a3;
@end

@implementation TKSmartCardATR

- (TKSmartCardATR)initWithBytes:(NSData *)bytes
{
  v5 = bytes;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TKSmartCardATR;
  v6 = -[TKSmartCardATR init](&v20, sel_init);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = [MEMORY[0x189603FA8] array];
    interfaces = v7->_interfaces;
    v7->_interfaces = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_bytes, bytes);
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    v10 = v5;
    uint64_t v19 = -[NSData bytes](v10, "bytes");
    uint64_t v11 = v17[3];
    uint64_t v12 = -[NSData length](v10, "length");
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __32__TKSmartCardATR_initWithBytes___block_invoke;
    v15[3] = &unk_189F8B580;
    v15[4] = &v16;
    v15[5] = v11 + v12;
    -[TKSmartCardATR parseFromSource:](v7, "parseFromSource:", v15);
    v13 = (TKSmartCardATR *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

uint64_t __32__TKSmartCardATR_initWithBytes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v2 = *(unsigned __int8 **)(v1 + 24);
  *(void *)(v1 + 24) = v2 + 1;
  return *v2;
}

- (TKSmartCardATR)initWithSource:(void *)source
{
  v4 = source;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TKSmartCardATR;
  v5 = -[TKSmartCardATR init](&v21, sel_init);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = [MEMORY[0x189603FA8] array];
    interfaces = v6->_interfaces;
    v6->_interfaces = (NSMutableArray *)v7;

    [MEMORY[0x189603FB8] data];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = MEMORY[0x1895F87A8];
    uint64_t v16 = 3221225472LL;
    v17 = __33__TKSmartCardATR_initWithSource___block_invoke;
    uint64_t v18 = &unk_189F8B5A8;
    id v20 = v4;
    id v10 = v9;
    id v19 = v10;
    -[TKSmartCardATR parseFromSource:](v6, "parseFromSource:", &v15);
    uint64_t v11 = (TKSmartCardATR *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x189603F48], "dataWithData:", v10, v15, v16, v17, v18);
      bytes = v11->_bytes;
      v11->_bytes = (NSData *)v12;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11;
}

uint64_t __33__TKSmartCardATR_initWithSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    char v5 = v2;
    [*(id *)(a1 + 32) appendBytes:&v5 length:1];
  }

  return v3;
}

- (id)parseFromSource:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v4 = (uint64_t (**)(void))a3;
  if ((((uint64_t (*)(void))v4[2])() & 0x80000000) != 0 || (int v5 = v4[2](v4), v5 < 0))
  {
    v17 = 0LL;
  }

  else
  {
    char v6 = 0;
    id v7 = 0LL;
    char v22 = v5 & 0xF0;
    uint64_t v8 = v5 & 0xF;
    char v21 = 1;
    do
    {
      v9 = v7;
      id v10 = -[TKSmartCardATRInterfaceGroup initWithProtocol:]( objc_alloc(&OBJC_CLASS___TKSmartCardATRInterfaceGroup),  "initWithProtocol:",  v7);
      id v20 = v7;
      -[TKSmartCardATRInterfaceGroup parseWithY:toProtocol:fromSource:hasNext:]( v10,  "parseWithY:toProtocol:fromSource:hasNext:",  &v22,  &v20,  v4,  &v21);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v7 = v20;

      if (!v11)
      {
        v17 = 0LL;
        goto LABEL_18;
      }

      -[NSMutableArray addObject:](self->_interfaces, "addObject:", v11);
      if (v7) {
        v6 |= [v7 unsignedIntegerValue] != 1;
      }
    }

    while (v21);
    if ((_DWORD)v8)
    {
      uint64_t v12 = v8;
      v13 = (char *)&v19 - (((_BYTE)v8 + 15) & 0x10);
      while (1)
      {
        int v14 = v4[2](v4);
        if (v14 < 0) {
          break;
        }
        *v13++ = v14;
        if (!--v12) {
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:
      [MEMORY[0x189603F48] dataWithBytes:(char *)&v19 - (((_BYTE)v8 + 15) & 0x10) length:v8];
      uint64_t v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      historicalBytes = self->_historicalBytes;
      self->_historicalBytes = v15;

      if ((v6 & 1) == 0 || (v4[2](v4) & 0x80000000) == 0)
      {
        v17 = self;
        goto LABEL_18;
      }
    }

    v17 = 0LL;
LABEL_18:
  }

  return v17;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupAtIndex:(NSInteger)index
{
  if (-[NSMutableArray count](self->_interfaces, "count") >= (unint64_t)index)
  {
    -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", index - 1);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v5 = 0LL;
  }

  return (TKSmartCardATRInterfaceGroup *)v5;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupForProtocol:(TKSmartCardProtocol)protocol
{
  if (protocol == 1) {
    unint64_t v5 = 1LL;
  }
  else {
    unint64_t v5 = 2LL;
  }
  for (i = self->_interfaces; v5 < -[NSMutableArray count](i, "count"); i = self->_interfaces)
  {
    -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 protocol];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9 == protocol) {
      return (TKSmartCardATRInterfaceGroup *)v7;
    }

    ++v5;
  }

  id v7 = 0LL;
  return (TKSmartCardATRInterfaceGroup *)v7;
}

- (NSArray)protocols
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSMutableArray count](self->_interfaces, "count"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TKSmartCardATR interfaceGroupAtIndex:](self, "interfaceGroupAtIndex:", 2LL);
  [v4 TA];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLong:", 1 << (objc_msgSend(v5, "unsignedCharValue") & 0xF));
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v6];
  }

  else
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = self->_interfaces;
    uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "protocol", (void)v23);
          if (v13)
          {
            int v14 = (void *)v13;
            [v12 protocol];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v16 = [v15 unsignedIntegerValue];

            if (!(v16 >> 15))
            {
              [v12 protocol];
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              char v18 = [v3 containsObject:v17];

              if ((v18 & 1) == 0)
              {
                [v12 protocol];
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v20 = [v19 unsignedIntegerValue];

                [v12 protocol];
                char v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20 == 2) {
                  [v3 insertObject:v21 atIndex:0];
                }
                else {
                  [v3 addObject:v21];
                }
              }
            }
          }
        }

        uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      }

      while (v9);
    }

    if (![v3 count]) {
      [v3 addObject:&unk_189F98660];
    }
  }

  return (NSArray *)v3;
}

- (id)_formatHexData:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    [MEMORY[0x189607940] string];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  if ([v5 length])
  {
    unint64_t v7 = 0LL;
    do
    {
      id v8 = v5;
      objc_msgSend(v6, "appendFormat:", @"%02x", *(unsigned __int8 *)(objc_msgSend(v8, "bytes") + v7++));
    }

    while (v7 < [v8 length]);
  }

  return v6;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  @"<TKSmartCardATR: %p %02x",  self,  *(unsigned __int8 *)-[NSData bytes](self->_bytes, "bytes"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_interfaces, "count"))
  {
    unint64_t v4 = 0LL;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", v4);
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 description];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 appendFormat:@" %@", v6];

      ++v4;
    }

    while (v4 < -[NSMutableArray count](self->_interfaces, "count"));
  }

  [v3 appendString:@";"];
  -[TKSmartCardATR historicalRecords](self, "historicalRecords");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      uint64_t v12 = "";
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          int v14 = v3;
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v15 tag];
          [v15 value];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKSmartCardATR _formatHexData:to:](self, "_formatHexData:to:", v17, 0LL);
          char v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = v16;
          uint64_t v3 = v14;
          [v14 appendFormat:@"%s%x(%@)", v12, v21, v18];

          uint64_t v12 = " ";
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v10);
    }
  }

  else
  {
    id v19 = -[TKSmartCardATR _formatHexData:to:](self, "_formatHexData:to:", self->_historicalBytes, v3);
  }

  [v3 appendString:@">"];

  return v3;
}

- (NSArray)historicalRecords
{
  if (!-[NSData length](self->_historicalBytes, "length")) {
    goto LABEL_5;
  }
  uint64_t v3 = -[NSData bytes](self->_historicalBytes, "bytes");
  NSUInteger v4 = -[NSData length](self->_historicalBytes, "length");
  id v5 = 0LL;
  unint64_t v6 = v4 - 1;
  int v9 = *v3;
  id v8 = v3 + 1;
  int v7 = v9;
  if (v9 != 128)
  {
    if (v7) {
      return (NSArray *)v5;
    }
    if (v6 < 3)
    {
LABEL_5:
      id v5 = 0LL;
      return (NSArray *)v5;
    }

    unint64_t v6 = v4 - 4;
    uint64_t v10 = objc_alloc(&OBJC_CLASS___TKCompactTLVRecord);
    [MEMORY[0x189603F48] dataWithBytes:&v8[v6] length:3];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = -[TKCompactTLVRecord initWithTag:value:](v10, "initWithTag:value:", 8LL, v11);
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v8 length:v6 freeWhenDone:0];
  +[TKTLVRecord sequenceOfRecordsFromData:](&OBJC_CLASS___TKCompactTLVRecord, "sequenceOfRecordsFromData:", v12);
  uint64_t v13 = (TKCompactTLVRecord *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  if (v5)
  {
    uint64_t v15 = -[TKCompactTLVRecord arrayByAddingObject:](v13, "arrayByAddingObject:", v5);

    int v14 = (TKCompactTLVRecord *)v15;
  }

  id v5 = v14;
  return (NSArray *)v5;
}

- (NSData)bytes
{
  return self->_bytes;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (void).cxx_destruct
{
}

@end