@interface MSCMSAppleHashAgilityV2Attribute
- (MSCMSAppleHashAgilityV2Attribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleHashAgilityV2Attribute)initWithHashAgilityValues:(id)a3;
- (MSOID)attributeType;
- (NSDictionary)hashAgilityValues;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleHashAgilityV2Attribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113635.100.9.2",  0LL);
}

- (MSCMSAppleHashAgilityV2Attribute)initWithAttribute:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MSCMSAppleHashAgilityV2Attribute;
  v7 = -[MSCMSAppleHashAgilityV2Attribute init](&v33, sel_init);
  [v6 attributeValues];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = (void *)MEMORY[0x189603FC8];
    [v6 attributeValues];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    [v6 attributeValues];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      v26 = v7;
      while (2)
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          int v19 = nsheim_decode_AppleAgileHash(v18);
          if (v19)
          {
            v7 = v26;
            if (a4)
            {
              +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorASN1Domain[0],  v19,  *a4,  @"unable to decode Apple Hash Agility V2 Agile Hash");
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_20;
          }

          [MEMORY[0x189603F48] dataWithBytes:*((void *)&v28 + 1) length:(void)v28];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[MSOID OIDWithAsn1OID:error:](&OBJC_CLASS___MSOID, "OIDWithAsn1OID:error:", &v27, a4);
          [v21 OIDString];
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22) {
            BOOL v23 = v20 == 0LL;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            free_AppleAgileHash();

            v7 = v26;
LABEL_20:

            v24 = 0LL;
            goto LABEL_21;
          }

          [v12 setObject:v20 forKeyedSubscript:v22];
          free_AppleAgileHash();
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        v7 = v26;
        if (v15) {
          continue;
        }
        break;
      }
    }

    v7 = -[MSCMSAppleHashAgilityV2Attribute initWithHashAgilityValues:](v7, "initWithHashAgilityValues:", v12);
    v24 = v7;
LABEL_21:
  }

  else if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  MSErrorCMSDomain[0],  -50LL,  *a4,  @"Apple Hash Agility V2 Attribute must have one value");
    v24 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

- (MSCMSAppleHashAgilityV2Attribute)initWithHashAgilityValues:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSCMSAppleHashAgilityV2Attribute;
  id v6 = -[MSCMSAppleHashAgilityV2Attribute init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hashAgilityValues, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189603FA8];
  -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](self, "hashAgilityValues");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v34 = self;
  v8 = -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](self, "hashAgilityValues");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id obj = v8;
    uint64_t v33 = *(void *)v37;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v37 != v33) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * v11);
      v13 = -[MSCMSAppleHashAgilityV2Attribute hashAgilityValues](v34, "hashAgilityValues", obj);
      [v13 objectForKeyedSubscript:v12];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", v12, a3);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15) {
        goto LABEL_18;
      }
      uint64_t v16 = v15;
      v17 = v7;
      [v15 Asn1OID];
      id v18 = v14;
      [v18 bytes];
      [v18 length];
      uint64_t v19 = length_AppleAgileHash();
      [MEMORY[0x189603FB8] dataWithLength:v19];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20) {
        break;
      }
      id v21 = v20;
      [v21 mutableBytes];
      int v22 = encode_AppleAgileHash();
      if (v22)
      {
        int v27 = v22;

        uint64_t v26 = v27;
        goto LABEL_15;
      }

      if (v19 != v35) {
        asn1_abort();
      }
      v7 = v17;
      [v17 addObject:v21];

      if (v10 == ++v11)
      {
        v8 = obj;
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    uint64_t v26 = 12LL;
LABEL_15:
    v7 = v17;
    if (a3)
    {
      __int128 v28 = a3;
      __int128 v29 = (void *)MEMORY[0x189607870];
      uint64_t v40 = *MEMORY[0x1896075E0];
      v41 = @"Failed encoding type AppleAgileHash";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 errorWithDomain:@"com.apple.HeimASN1" code:v26 userInfo:v30];
      *__int128 v28 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_18:
    v25 = 0LL;
    v24 = obj;
    goto LABEL_19;
  }

- (NSDictionary)hashAgilityValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end