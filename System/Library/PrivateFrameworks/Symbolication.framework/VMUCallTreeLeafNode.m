@interface VMUCallTreeLeafNode
- (VMUCallTreeLeafNode)init;
- (VMUCallTreeLeafNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6;
- (void)addAddress:(unint64_t)a3;
- (void)getBrowserName:(id)a3;
@end

@implementation VMUCallTreeLeafNode

- (VMUCallTreeLeafNode)initWithName:(id)a3 address:(unint64_t)a4 count:(unsigned int)a5 numBytes:(unint64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VMUCallTreeLeafNode;
  v6 = -[VMUCallTreeNode initWithName:address:count:numBytes:]( &v10,  sel_initWithName_address_count_numBytes_,  a3,  a4,  *(void *)&a5,  a6);
  if (v6)
  {
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x189607838]);
    addresses = v6->_addresses;
    v6->_addresses = v7;
  }

  return v6;
}

- (VMUCallTreeLeafNode)init
{
  return -[VMUCallTreeLeafNode initWithName:address:count:numBytes:]( self,  "initWithName:address:count:numBytes:",  &stru_189E010C8,  0LL,  0LL,  0LL);
}

- (void)addAddress:(unint64_t)a3
{
  addresses = self->_addresses;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](addresses, "addObject:", v5);

  combinedName = self->_combinedName;
  self->_combinedName = 0LL;
}

- (void)getBrowserName:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x186E32E40]();
  v6 = (void *)v5;
  if (!self->_combinedName)
  {
    v27 = (void *)v5;
    id v28 = v4;
    id v39 = 0LL;
    uint64_t v40 = 0LL;
    id v37 = 0LL;
    id v38 = 0LL;
    -[VMUCallTreeNode parseNameIntoSymbol:library:loadAddress:offset:address:suffix:]( self,  "parseNameIntoSymbol:library:loadAddress:offset:address:suffix:",  &v39,  &v38,  0LL,  0LL,  &v40,  &v37);
    id v26 = v39;
    id v25 = v38;
    id v24 = v37;
    v7 = -[NSCountedSet allObjects](self->_addresses, "allObjects");
    v36[0] = MEMORY[0x1895F87A8];
    v36[1] = 3221225472LL;
    v36[2] = __38__VMUCallTreeLeafNode_getBrowserName___block_invoke;
    v36[3] = &unk_189E00040;
    v36[4] = self;
    [v7 sortedArrayUsingComparator:v36];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    id v9 = objc_alloc_init(MEMORY[0x189607940]);
    id v10 = objc_alloc_init(MEMORY[0x189607940]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v33;
      while (2)
      {
        uint64_t v16 = 0LL;
        uint64_t v29 = v14 + v13;
        uint64_t v30 = v14;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = v14 + v16;
          if ((unint64_t)(v14 + v16) > 1)
          {
            if (v17 == 2)
            {
              [v9 appendString:@",..."];
              [v10 appendString:@",..."];
              goto LABEL_16;
            }
          }

          else
          {
            v18 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
            if (v17 == 1)
            {
              [v9 appendString:@","];
              uint64_t v14 = v30;
              [v10 appendString:@","];
            }

            uint64_t v19 = [v18 unsignedLongLongValue];
            [v9 appendFormat:@"%qu", v19 - v40];
            [v10 appendFormat:@"0x%qx" v19];
          }

          ++v16;
        }

        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v41 count:16];
        uint64_t v14 = v29;
        if (v13) {
          continue;
        }
        break;
      }
    }

uint64_t __38__VMUCallTreeLeafNode_getBrowserName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:v5];
  unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:v6];
  if (v7 <= v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = -1LL;
  }
  if (v7 < v8) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v7 == v8)
  {
    unint64_t v11 = [v5 unsignedLongLongValue];
    if (v11 < [v6 unsignedLongLongValue]) {
      uint64_t v12 = -1LL;
    }
    else {
      uint64_t v12 = v10;
    }
    unint64_t v13 = [v5 unsignedLongLongValue];
    if (v13 > [v6 unsignedLongLongValue]) {
      uint64_t v10 = 1LL;
    }
    else {
      uint64_t v10 = v12;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end