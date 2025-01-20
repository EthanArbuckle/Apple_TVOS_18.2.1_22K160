@interface UARPDynamicAssetVersions
+ (id)tag;
- (BOOL)decomposeUARP;
- (NSArray)partnerSerialNumbers;
- (UARPDynamicAssetVersions)init;
- (UARPDynamicAssetVersions)initWithURL:(id)a3;
- (id)description;
- (void)decomposeUARP;
@end

@implementation UARPDynamicAssetVersions

- (UARPDynamicAssetVersions)init
{
  return 0LL;
}

- (UARPDynamicAssetVersions)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetVersions;
  v5 = -[UARPDynamicAssetVersions init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    serialNumbers = v5->_serialNumbers;
    v5->_serialNumbers = v8;
  }

  return v5;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189607940]);
  [v3 appendFormat:@"Partner Serial Numbers: "];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = self->_serialNumbers;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (BOOL)decomposeUARP
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL)) {
    return 0;
  }
  -[UARPSuperBinaryAsset tlvs](self->_asset, "tlvs");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVsWithType:tlvs:",  1155952129LL,  v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "valueAsString", (void)v15);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetVersions decomposeUARP].cold.1();
          }

          BOOL v13 = 0;
          goto LABEL_17;
        }

        -[NSMutableArray addObject:](self->_serialNumbers, "addObject:", v12);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v13 = 1;
  }

- (NSArray)partnerSerialNumbers
{
  return (NSArray *)[MEMORY[0x189603F18] arrayWithArray:self->_serialNumbers];
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructVersions();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (void).cxx_destruct
{
}

- (void)decomposeUARP
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( &dword_187DC0000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Process VERS tlv is not of type string",  v0,  2u);
}

@end