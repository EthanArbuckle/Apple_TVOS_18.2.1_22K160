@interface NSUUID(LaunchServicesAdditions)
+ (id)_LS_UUIDWithData:()LaunchServicesAdditions digestType:;
+ (id)_LS_nullUUID;
@end

@implementation NSUUID(LaunchServicesAdditions)

+ (id)_LS_nullUUID
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  uuid_clear(uu);
  return (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uu];
}

+ (id)_LS_UUIDWithData:()LaunchServicesAdditions digestType:
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if ([v7 bytes])
    {
      if ([v7 length])
      {
        if (a4 == 2)
        {
          id v12 = v7;
          v13 = (const void *)[v12 bytes];
          CC_LONG v14 = [v12 length];

          CC_MD5(v13, v14, (unsigned __int8 *)&v22);
          unsigned __int8 v15 = BYTE6(v22);
          char v16 = 48;
        }

        else
        {
          if (a4 == 1)
          {
            id v17 = v7;
            v18 = (const void *)[v17 bytes];
            CC_LONG v19 = [v17 length];

            CC_SHA1(v18, v19, md);
          }

          else
          {
            if (a4)
            {
LABEL_13:
              uint64_t v11 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v22];
              goto LABEL_14;
            }

            id v8 = v7;
            v9 = (const void *)[v8 bytes];
            CC_LONG v10 = [v8 length];

            CC_SHA256(v9, v10, md);
          }

          __int128 v22 = *(_OWORD *)md;
          unsigned __int8 v15 = md[6];
          char v16 = 80;
        }

        BYTE6(v22) = v16 & 0xF0 | v15 & 0xF;
        BYTE8(v22) = BYTE8(v22) & 0x3F | 0x80;
        goto LABEL_13;
      }
    }
  }

  uint64_t v11 = objc_msgSend(MEMORY[0x189607AB8], "_LS_nullUUID");
LABEL_14:
  v20 = (void *)v11;

  return v20;
}

@end