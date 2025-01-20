@interface NEIKEv2FollowupKEPacket
+ (id)copyTypeDescription;
+ (unint64_t)exchangeType;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2FollowupKEPacket

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self)
  {
    if (objc_getProperty(self, v3, 88LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v4, 88, 1));
    }
    if (objc_getProperty(self, v4, 96LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v5, 96, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v5, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80LL);
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
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  if (self) {
    self = (NEIKEv2FollowupKEPacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  v3 = self;
  uint64_t v4 = -[NEIKEv2FollowupKEPacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v8;
            if (v2 && objc_getProperty(v2, v10, 64LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }

            v26 = v11;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v26, 1, (void)v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2) {
LABEL_20:
            }
              objc_setProperty_atomic(v2, v13, v14, 64LL);

            if (v11 && v2 && v11[3] == 16441LL)
            {
              ptrdiff_t v18 = 96LL;
              v19 = v2;
              v20 = v11;
              goto LABEL_27;
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_29;
            }
            if (v2 && objc_getProperty(v2, v15, 56LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 56, 1), "arrayByAddingObject:", v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              v25 = v8;
              objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v25, 1, (void)v21);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v2) {
                goto LABEL_28;
              }
            }

            v19 = v2;
            v20 = v11;
            ptrdiff_t v18 = 56LL;
LABEL_27:
            objc_setProperty_atomic(v19, v17, v20, v18);
          }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"IKE_FOLLOWUP_KE";
}

+ (unint64_t)exchangeType
{
  return 44LL;
}

@end