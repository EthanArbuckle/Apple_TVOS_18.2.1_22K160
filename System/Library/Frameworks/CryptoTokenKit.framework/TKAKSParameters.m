@interface TKAKSParameters
+ (void)_dumpPlist:(id)a3 into:(id)a4;
- (NSData)data;
- (TKAKSParameters)init;
- (TKAKSParameters)initWithParameters:(id)a3;
- (const)bytes;
- (id)description;
- (unint64_t)length;
- (void)data;
- (void)dealloc;
- (void)setData:(id)a3 forKey:(unsigned int)a4;
- (void)setNumber:(int64_t)a3 forKey:(unsigned int)a4;
@end

@implementation TKAKSParameters

+ (void)_dumpPlist:(id)a3 into:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  v6 = (__CFString *)a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = v6;
LABEL_26:
    [v8 appendString:v9];
    goto LABEL_27;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v6;
    uint64_t v11 = -[__CFString bytes](v10, "bytes");
    if (-[__CFString length](v10, "length"))
    {
      unint64_t v12 = 0LL;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v11 + v12++));
      while (v12 < -[__CFString length](v10, "length"));
    }

    goto LABEL_27;
  }

  CFTypeID v13 = CFGetTypeID(v6);
  if (v13 == CFBooleanGetTypeID())
  {
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x189604DE8])) {
      v9 = @"true";
    }
    else {
      v9 = @"false";
    }
LABEL_25:
    v8 = v7;
    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v7 appendFormat:@"%@", v6];
    goto LABEL_27;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v7 appendString:@"["];
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    v14 = v6;
    uint64_t v15 = -[__CFString countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      char v18 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if ((v18 & 1) == 0) {
            [v7 appendString:@","];
          }
          [a1 _dumpPlist:v20 into:v7];
          char v18 = 0;
        }

        uint64_t v16 = -[__CFString countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
        char v18 = 0;
      }

      while (v16);
    }

    v9 = @"]";
    goto LABEL_25;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v7 appendString:@"{"];
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    v29 = v6;
    v21 = v6;
    uint64_t v22 = -[__CFString countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
    if (v22)
    {
      uint64_t v23 = v22;
      char v24 = 1;
      uint64_t v25 = *(void *)v31;
      do
      {
        uint64_t v26 = 0LL;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v26);
          if ((v24 & 1) == 0) {
            [v7 appendString:@","];
          }
          [a1 _dumpPlist:v27 into:v7];
          [v7 appendString:@":"];
          if ([(id)_dumpPlist_into__deniedKeys containsObject:v27])
          {
            [v7 appendFormat:@"###"];
          }

          else
          {
            v28 = -[__CFString objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v27);
            [a1 _dumpPlist:v28 into:v7];
          }

          char v24 = 0;
          ++v26;
        }

        while (v23 != v26);
        uint64_t v23 = -[__CFString countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v38,  16LL);
        char v24 = 0;
      }

      while (v23);
    }

    [v7 appendString:@"}"];
    v6 = v29;
  }

void __35__TKAKSParameters__dumpPlist_into___block_invoke()
{
  v0 = (void *)_dumpPlist_into__deniedKeys;
  _dumpPlist_into__deniedKeys = (uint64_t)&unk_189F986C8;
}

- (id)description
{
  v3 = (void *)[@"<AKSp:" mutableCopy];
  v4 = -[TKAKSParameters data](self, "data");
  v5 = +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v4);
  [v5 propertyList];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [(id)objc_opt_class() _dumpPlist:v6 into:v3];
  }

  else
  {
    id v7 = -[TKAKSParameters data](self, "data");
    uint64_t v8 = [v7 bytes];
    v9 = -[TKAKSParameters data](self, "data");
    uint64_t v10 = [v9 length];

    if (v10)
    {
      unint64_t v11 = 0LL;
      do
      {
        objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v8 + v11++));
        -[TKAKSParameters data](self, "data");
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = [v12 length];
      }

      while (v11 < v13);
    }
  }

  [v3 appendString:@">"];
  v14 = (void *)[v3 copy];

  return v14;
}

- (TKAKSParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TKAKSParameters;
  v5 = -[TKAKSParameters init](&v8, sel_init);
  if (v5)
  {
    id v6 = v4;
    [v6 bytes];
    [v6 length];
    v5->_params = (aks_params_s *)aks_params_create();
  }

  return v5;
}

- (TKAKSParameters)init
{
  return -[TKAKSParameters initWithParameters:](self, "initWithParameters:", 0LL);
}

- (void)setData:(id)a3 forKey:(unsigned int)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  aks_params_set_data();
  encoded = self->_encoded;
  self->_encoded = 0LL;
}

- (void)setNumber:(int64_t)a3 forKey:(unsigned int)a4
{
  encoded = self->_encoded;
  self->_encoded = 0LL;
}

- (NSData)data
{
  encoded = self->_encoded;
  if (!encoded)
  {
    uint64_t v4 = MEMORY[0x18959C258](self->_params, &v11, &v10);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      TK_LOG_sepkey_0();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TKAKSParameters data].cold.1();
      }

      objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A58],  @"failed to get DER-encoded aks_params_t (err=%d)",  v5);
    }

    [MEMORY[0x189603F48] dataWithBytesNoCopy:v11 length:v10];
    id v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    objc_super v8 = self->_encoded;
    self->_encoded = v7;

    encoded = self->_encoded;
  }

  return encoded;
}

- (const)bytes
{
  id v2 = -[TKAKSParameters data](self, "data");
  v3 = (const void *)[v2 bytes];

  return v3;
}

- (unint64_t)length
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 length];

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKAKSParameters;
  -[TKAKSParameters dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)data
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12_1();
  _os_log_error_impl(&dword_186E58000, v0, OS_LOG_TYPE_ERROR, "failed to get DER-encoded aks_params_t (err=%d)", v1, 8u);
  OUTLINED_FUNCTION_8();
}

@end