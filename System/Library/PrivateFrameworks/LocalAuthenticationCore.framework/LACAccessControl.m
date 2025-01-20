@interface LACAccessControl
+ (BOOL)checkACLAllowsAll:(id)a3;
+ (id)allowAllACL;
@end

@implementation LACAccessControl

+ (id)allowAllACL
{
  SecAccessControlRef v2 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x189604DB0], (CFTypeRef)*MEMORY[0x18960B868], 0LL, 0LL);
  v3 = (void *)SecAccessControlCopyData();
  CFRelease(v2);
  return v3;
}

+ (BOOL)checkACLAllowsAll:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = (void *)SecAccessControlCreateFromData();
  if (v3 && (SecAccessControlGetRequirePassword() & 1) == 0)
  {
    SecAccessControlGetConstraints();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    objc_msgSend(v5, "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      v10 = (const void *)*MEMORY[0x189604DE8];
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!CFEqual(*(CFTypeRef *)(*((void *)&v13 + 1) + 8 * i), v10))
          {
            BOOL v4 = 0;
            goto LABEL_14;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v4 = 1;
LABEL_14:
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

@end