@interface B2PDataSessionDiscoveryResponse
- (B2PDataSessionDiscoveryResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 data:(id)a5;
- (BOOL)parseResponse:(id)a3;
- (NSArray)entries;
- (id)description;
@end

@implementation B2PDataSessionDiscoveryResponse

- (B2PDataSessionDiscoveryResponse)initWithRoute:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___B2PDataSessionDiscoveryResponse;
  return -[B2PResponse initWithOpCode:route:status:data:]( &v6,  sel_initWithOpCode_route_status_data_,  39LL,  a3,  *(void *)&a4,  a5);
}

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189603FA8] array];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  v7 = (unsigned __int8 *)[v6 bytes];
  unint64_t v8 = [v6 length];
  if (v8 >= 2)
  {
    unint64_t v9 = v8;
    do
    {
      v10 = v7 + 2;
      v9 -= 2LL;
      if (!v7[1]) {
        goto LABEL_6;
      }
      if (v9 < v7[1])
      {
        BOOL v16 = 0;
        goto LABEL_10;
      }

      v11 = (__CFString *)[objc_alloc(NSString) initWithBytes:v7 + 2 length:v7[1] encoding:4];
      uint64_t v12 = v7[1];
      v10 += v12;
      v9 -= v12;
      if (!v11) {
LABEL_6:
      }
        v11 = &stru_18A3C7A18;
      v13 = -[B2PDataSessionDiscoveryEntry initWithSessionID:tag:]( objc_alloc(&OBJC_CLASS___B2PDataSessionDiscoveryEntry),  "initWithSessionID:tag:",  *v7,  v11);
      [v5 addObject:v13];

      v7 = v10;
    }

    while (v9 > 1);
  }

  [MEMORY[0x189603F18] arrayWithArray:v5];
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  entries = self->_entries;
  self->_entries = v14;

  BOOL v16 = 1;
LABEL_10:

  return v16;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x189607940];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___B2PDataSessionDiscoveryResponse;
  -[B2PResponse description](&v19, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = self->_entries;
  uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        [v5 appendString:@"\tEntry:\n"];
        objc_msgSend(v5, "appendFormat:", @"\t\tSession ID: %u\n", objc_msgSend(v11, "sessionID"));
        [v11 tag];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 appendFormat:@"\t\tTag: %@\n", v12];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v8);
  }

  [NSString stringWithString:v5];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)entries
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end