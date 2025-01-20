@interface NEIKEv2IntermediatePacket
+ (id)copyTypeDescription;
+ (unint64_t)exchangeType;
- (id)authenticatedData;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2IntermediatePacket

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 56, 1));
    objc_setProperty_atomic(self, v6, newValue, 80LL);
  }

  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  if (self) {
    self = (NEIKEv2IntermediatePacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  v3 = self;
  uint64_t v4 = -[NEIKEv2IntermediatePacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v10, 64LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }

            v24 = v8;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v24, 1, (void)v19);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_20:
              v16 = v2;
              v17 = v13;
              ptrdiff_t v18 = 64LL;
              goto LABEL_23;
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_25;
            }
            if (v2 && objc_getProperty(v2, v14, 56LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v15, 56, 1), "arrayByAddingObject:", v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v23 = v8;
              objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v23, 1, (void)v19);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2) {
                goto LABEL_24;
              }
            }

            v16 = v2;
            v17 = v13;
            ptrdiff_t v18 = 56LL;
LABEL_23:
            objc_setProperty_atomic(v16, v12, v17, v18);
          }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"IKE_INTERMEDIATE";
}

+ (unint64_t)exchangeType
{
  return 43LL;
}

- (id)authenticatedData
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = a1;
    if (objc_getProperty(a1, a2, 96LL, 1))
    {
LABEL_3:
      a1 = objc_getProperty(v2, v3, 96LL, 1);
      return a1;
    }

    if (objc_getProperty(v2, v3, 48LL, 1))
    {
      id Property = objc_getProperty(v2, v4, 48LL, 1);
      if (Property && objc_getProperty(Property, v6, 24LL, 1))
      {
        id v8 = objc_getProperty(v2, v7, 48LL, 1);
        if (v8 && objc_getProperty(v8, v9, 16LL, 1))
        {
          id v11 = objc_getProperty(v2, v10, 48LL, 1);
          if (v11) {
            id v11 = objc_getProperty(v11, v12, 24LL, 1);
          }
          id v13 = v11;
          id v15 = objc_getProperty(v2, v14, 48LL, 1);
          if (v15) {
            id v15 = objc_getProperty(v15, v16, 16LL, 1);
          }
          id v17 = v15;
          if ((unint64_t)[v13 length] > 0x1F)
          {
            objc_msgSend(v13, "getBytes:range:", buf, 0, 28);
            objc_msgSend(v13, "getBytes:range:", v26, 28, 4);
            int v18 = [v17 length];
            __int16 v27 = bswap32(v18 + 4) >> 16;
            uint64_t v19 = (unsigned __int16)(v18 + 4) + 28;
            unsigned int v35 = bswap32(v19);
            char v34 = 46;
            __int128 v20 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v19];
            [v20 appendBytes:buf length:28];
            [v20 appendBytes:v26 length:4];
            [v20 appendData:v17];
            objc_setProperty_atomic(v2, v21, v20, 96LL);

            goto LABEL_3;
          }

          ne_log_obj();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v28 = 134218240;
            uint64_t v29 = [v13 length];
            __int16 v30 = 2048;
            uint64_t v31 = 32LL;
            _os_log_fault_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_FAULT,  "Authenticated header length %zu < minimum length %zu",  v28,  0x16u);
          }

LABEL_23:
          a1 = 0LL;
          return a1;
        }

        ne_log_obj();
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v33 = "-[NEIKEv2IntermediatePacket authenticatedData]";
          v23 = "%s called with null self.encryptedPayload.payloadData";
          goto LABEL_21;
        }

@end