@interface TKLocalSEPRefKey
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)systemSessionKey;
- (aks_ref_key_s)AKSRefKey;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)description;
- (id)keySize;
- (id)keyType;
- (id)objectID;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation TKLocalSEPRefKey

- (id)description
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (self->_AKSRefKey)
  {
    unsigned int handle = aks_ref_key_get_handle();
    if (handle != 0 && handle < 0xFFFFFFFA) {
      v4 = "";
    }
    else {
      v4 = (&off_189F8B130)[handle + 6];
    }
    unsigned int v7 = aks_ref_key_get_type() - 1;
    if (v7 > 9) {
      v6 = "*";
    }
    else {
      v6 = off_189F8B168[v7];
    }
    unint64_t debugID = self->_debugID;
    if (!debugID)
    {
      aks_ref_key_get_public_key();
      v10[0] = 0LL;
      v10[1] = 0LL;
      int v11 = 0;
      ccsha1_di();
      ccdigest();
      uint64_t v8 = 0LL;
      unint64_t debugID = 0LL;
      do
        unint64_t debugID = *((unsigned __int8 *)v10 + v8++) | (debugID << 8);
      while (v8 != 8);
      self->_unint64_t debugID = debugID;
    }
  }

  else
  {
    unint64_t debugID = self->_debugID;
    v6 = "*";
    v4 = "";
  }

  objc_msgSend(NSString, "stringWithFormat:", @"<sepk:%s%s kid=%016llx>", v6, v4, debugID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keySize
{
  unsigned int v2 = aks_ref_key_get_type() - 1;
  if (v2 > 9) {
    return &unk_189F985D0;
  }
  else {
    return (id)qword_189F8B1B8[v2];
  }
}

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = -[TKLocalSEPKey _initWithAuthContext:caller:](self, "_initWithAuthContext:caller:", a4, a5);
  if (v13)
  {
    id v14 = v12;
    [(id)objc_opt_class() keybagHandleForceSystemSession:v8];
    id v15 = v14;
    [v15 bytes];
    [v15 length];
    uint64_t v16 = aks_ref_key_create_with_blob();
    if ((_DWORD)v16)
    {
      uint64_t v17 = v16;
      TK_LOG_sepkey_0();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [v13 callerName];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v34;
        __int16 v38 = 1024;
        int v39 = v17;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_error_impl( &dword_186E58000,  v18,  OS_LOG_TYPE_ERROR,  "objectID from %{public}@ contains invalid refkey (err: %d) data:%{public}@",  buf,  0x1Cu);
      }

      [v13 error:a7 withAKSReturn:v17 ACMHandle:0 AKSOperation:0 params:0 message:@"objectID contains invalid refkey data"];
      goto LABEL_18;
    }

    [MEMORY[0x189603F48] dataWithBytes:aks_ref_key_get_external_data() length:*(void *)buf];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v19);
    [v20 propertyList];
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    [v21 objectForKeyedSubscript:@"acl"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)SecAccessControlCreate();
    [v13 setSac:v23];

    v24 = (void *)objc_opt_class();
    [v24 protectionForKeyClass:aks_ref_key_get_key_class()];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 accessControl];
    if ((SecAccessControlSetProtection() & 1) == 0)
    {
      TK_LOG_sepkey_0();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.3();
      }
      goto LABEL_16;
    }

    if (v22)
    {
      [v13 accessControl];
      SecAccessControlSetConstraints();
    }

    int type = aks_ref_key_get_type();
    if ((type - 3) >= 8)
    {
      int v31 = type;
      if (type != 1)
      {
        TK_LOG_sepkey_0();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.2(v13, v31, v32);
        }

        if (!a7) {
          goto LABEL_17;
        }
        v33 = (void *)MEMORY[0x189607870];
        uint64_t v35 = *MEMORY[0x189607490];
        v36 = @"objectID contains invalid key type";
        [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        [v33 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v29];
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:
LABEL_18:

        id v28 = 0LL;
        goto LABEL_19;
      }
    }
  }

  TK_LOG_sepkey_0();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:].cold.1(v13);
  }

  id v28 = v13;
LABEL_19:

  return v28;
}

- (id)keyType
{
  uint64_t type = aks_ref_key_get_type();
  switch((int)type)
  {
    case 1:
      v5 = (id *)MEMORY[0x18960B9F0];
      goto LABEL_10;
    case 3:
      v5 = (id *)MEMORY[0x18960B9C0];
      goto LABEL_10;
    case 4:
    case 7:
      v5 = (id *)MEMORY[0x18960B9B0];
      goto LABEL_10;
    case 5:
    case 8:
      v5 = (id *)MEMORY[0x18960B9B8];
      goto LABEL_10;
    case 6:
      char options = aks_ref_key_get_options();
      v5 = (id *)MEMORY[0x18960B9E8];
      if ((options & 0x40) != 0) {
        v5 = (id *)MEMORY[0x18960B9E0];
      }
      goto LABEL_10;
    case 9:
    case 10:
      v5 = (id *)MEMORY[0x18960B9C8];
LABEL_10:
      unsigned int v7 = (__CFString *)*v5;
      break;
    default:
      [MEMORY[0x1896077D8] currentHandler];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TKLocalSEPKey.m",  865,  @"Unexpected aks_key_type %d",  type);

      unsigned int v7 = &stru_189F8C1A8;
      break;
  }

  return v7;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  v46[1] = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a6;
  uint64_t v17 = -[TKLocalSEPKey _initWithAuthContext:caller:](self, "_initWithAuthContext:caller:", a7, a8);
  v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 authContextWithError:a10];
    if (!v19)
    {
LABEL_24:
      uint64_t v42 = 0LL;
      goto LABEL_29;
    }

    v20 = (void *)v19;
    if (([v15 isEqual:*MEMORY[0x18960B9E8]] & 1) == 0
      && ([v15 isEqual:*MEMORY[0x18960B9E0]] & 1) == 0
      && ![v15 isEqual:*MEMORY[0x18960B9B8]]
      && ([v15 isEqual:*MEMORY[0x18960B9C0]] & 1) == 0
      && ([v15 isEqual:*MEMORY[0x18960B9F0]] & 1) == 0)
    {
      [v15 isEqual:*MEMORY[0x18960B9C8]];
    }

    [v18 setSac:a5];
    v21 = (void *)objc_opt_class();
    [v18 accessControl];
    [v21 keyClassForProtection:SecAccessControlGetProtection()];
    [v20 ACMHandle];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 parametersWithACMHandle:v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v18 accessControl])
    {
      [v18 accessControl];
      SecAccessControlGetConstraints();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
        v45 = @"acl";
        v46[0] = v24;
        [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[TKBERTLVRecord initWithPropertyList:](v25, "initWithPropertyList:", v26);
        -[TKTLVRecord data](v27, "data");
        id v28 = (void *)objc_claimAutoreleasedReturnValue();

        [v23 setData:v28 forKey:2];
      }
    }

    [v16 objectForKeyedSubscript:*MEMORY[0x18960BD50]];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    int v30 = [v29 BOOLValue];

    if (v30) {
      uint64_t v31 = 4LL;
    }
    else {
      uint64_t v31 = 0LL;
    }
    [v16 objectForKeyedSubscript:@"ECCompactable"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    int v33 = [v32 BOOLValue];

    if (v33) {
      v31 |= 0x10uLL;
    }
    [v16 objectForKeyedSubscript:*MEMORY[0x18960BD88]];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v35 = [v34 BOOLValue];

    uint64_t v36 = v31 | v35;
    [v16 objectForKeyedSubscript:*MEMORY[0x18960BD98]];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    int v38 = [v37 BOOLValue];

    if (v38) {
      uint64_t v39 = v36 | 0x100;
    }
    else {
      uint64_t v39 = v36;
    }
    else {
      uint64_t v40 = v39;
    }
    if (v40) {
      [v23 setNumber:v40 forKey:9];
    }
    [(id)objc_opt_class() keybagHandleForceSystemSession:a9];
    [v23 bytes];
    [v23 length];
    uint64_t v41 = aks_ref_key_create();
    if ((_DWORD)v41)
    {
      v18[6] = 0LL;
      [v18 error:a10 withAKSReturn:v41 ACMHandle:0 AKSOperation:0 params:v23 message:@"unable to generate key"];

      goto LABEL_24;
    }
  }

  TK_LOG_sepkey_0();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[TKLocalSEPRefKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:].cold.1(v18);
  }

  uint64_t v42 = v18;
LABEL_29:

  return v42;
}

- (id)objectID
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)systemSessionKey
{
  return aks_ref_key_get_handle() == -6;
}

- (BOOL)deleteWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v5 = -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:");
  v6 = v5;
  if (v5)
  {
    [v5 ACMHandle];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v7);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 bytes];
    [v8 length];
    uint64_t v9 = aks_ref_key_delete();
    uint64_t v10 = v9;
    if ((_DWORD)v9 != -536363001)
    {
      if (!(_DWORD)v9)
      {
LABEL_8:
        TK_LOG_sepkey_0();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey deleteWithError:].cold.1();
        }

        BOOL v13 = 1;
        goto LABEL_13;
      }

      if ((_DWORD)v9 != -536362989)
      {
        [v6 ACMHandle];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a3,  v10,  v14,  @"odel",  v8,  @"unable to delete key");

        BOOL v13 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }

    TK_LOG_sepkey_0();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109120;
      v16[1] = v10;
      _os_log_impl( &dword_186E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "detected error %08x while deleting refkey, ignoring this error",  (uint8_t *)v16,  8u);
    }

    goto LABEL_8;
  }

  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (id)publicKeyWithError:(id *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7;
  if (v7)
  {
    [v7 ACMHandle];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_sign();
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      [v8 ACMHandle];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a4,  v13,  v14,  @"osgn",  v10,  @"unable to sign digest");
      id v15 = 0LL;
    }

    else
    {
      TK_LOG_sepkey_0();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPRefKey signDigest:error:].cold.1();
      }

      [MEMORY[0x189603F48] dataWithBytesNoCopy:v20 length:v19];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v17);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 value];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7;
  if (v7)
  {
    [v7 ACMHandle];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_compute_key();
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      [v8 ACMHandle];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a4,  v13,  v14,  @"ock",  v10,  @"unable to compute shared secret");
      id v15 = 0LL;
    }

    else
    {
      TK_LOG_sepkey_0();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPRefKey computeSharedSecret:error:].cold.1();
      }

      [MEMORY[0x189603F48] dataWithBytesNoCopy:v20 length:v19];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v17);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 value];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  v52[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a5);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [v9 objectForKeyedSubscript:*MEMORY[0x18960BD58]];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v46 = v8;
      [v10 ACMHandle];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v12);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v14 = *MEMORY[0x18960BD80];
      [v9 objectForKeyedSubscript:*MEMORY[0x18960BD80]];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        [v13 setData:v15 forKey:10];
      }
      id v47 = v11;
      uint64_t v16 = *MEMORY[0x18960BD68];
      [v9 objectForKeyedSubscript:*MEMORY[0x18960BD68]];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17) {
        [v13 setData:v17 forKey:11];
      }
      [v9 objectForKeyedSubscript:*MEMORY[0x18960BD60]];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 objectForKeyedSubscript:v14];

      if (v19) {
        [v13 setData:v19 forKey:12];
      }
      v45 = (void *)v19;
      uint64_t v20 = [v18 objectForKeyedSubscript:v16];

      if (v20) {
        [v13 setData:v20 forKey:13];
      }
      v43 = (void *)v20;
      uint64_t v21 = *MEMORY[0x18960BD70];
      uint64_t v22 = [v9 objectForKeyedSubscript:*MEMORY[0x18960BD70]];
      v23 = (void *)v22;
      if (v22) {
        v24 = (void *)v22;
      }
      else {
        v24 = &unk_189F985E8;
      }
      id v25 = v24;

      uint64_t v26 = [v18 objectForKeyedSubscript:v21];
      v27 = (void *)v26;
      if (v26) {
        id v28 = (void *)v26;
      }
      else {
        id v28 = &unk_189F985E8;
      }
      id v29 = v28;

      v44 = v25;
      if ([v25 integerValue] == 128 && objc_msgSend(v29, "integerValue") == 128)
      {
        id v30 = v29;
        [v13 bytes];
        [v13 length];
        id v31 = v47;
        [v31 bytes];
        [v31 length];
        id v8 = v46;
        id v32 = v46;
        [v32 bytes];
        [v32 length];
        uint64_t v33 = aks_ref_key_ecies_transcode();
        if ((_DWORD)v33)
        {
          uint64_t v34 = v33;
          objc_msgSend(v10, "ACMHandle", v48);
          unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a5,  v34,  v35,  @"oect",  v13,  @"unable to recrypt");

          uint64_t v36 = 0LL;
        }

        else
        {
          TK_LOG_sepkey_0();
          uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            -[TKLocalSEPRefKey recryptData:attributes:error:].cold.1();
          }

          objc_msgSend(MEMORY[0x189603F48], "dataWithBytesNoCopy:length:", v48[1], v48[0], v48);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v40 = v45;
        id v29 = v30;
      }

      else
      {
        id v8 = v46;
        if (a5)
        {
          int v38 = (void *)MEMORY[0x189607870];
          uint64_t v49 = *MEMORY[0x189607490];
          v50 = @"Bad kSecKeyEncryptionParameterSymmetricKeySizeInBits - if present, must be set to 128 for both input and output crypto operation";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          [v38 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v39];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        uint64_t v36 = 0LL;
        uint64_t v40 = v45;
      }

      id v11 = v47;
    }

    else
    {
      if (!a5)
      {
        uint64_t v36 = 0LL;
LABEL_34:

        goto LABEL_35;
      }

      v37 = (void *)MEMORY[0x189607870];
      uint64_t v51 = *MEMORY[0x189607490];
      v52[0] = @"Bad or missing kSecKeyEncryptionParameterRecryptCertificate";
      [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v13];
      uint64_t v36 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_34;
  }

  uint64_t v36 = 0LL;
LABEL_35:

  return v36;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a4);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7)
  {
    [v7 ACMHandle];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 bytes];
    [v10 length];
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    uint64_t v12 = aks_ref_key_decapsulate();
    if ((_DWORD)v12)
    {
      uint64_t v13 = v12;
      [v8 ACMHandle];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a4,  v13,  v14,  @"okd",  v10,  @"unable to decapsulate shared key");

      id v15 = 0LL;
    }

    else
    {
      [MEMORY[0x189603F48] dataWithBytesNoCopy:v18 length:v17];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (-[TKLocalSEPKey callerHasEntitlement:error:]( self,  "callerHasEntitlement:error:",  @"com.apple.security.attestation.access",  a5))
  {
    -[TKLocalSEPKey authContextWithError:](self, "authContextWithError:", a5);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (!v10)
    {
      uint64_t v18 = 0LL;
LABEL_19:

      goto LABEL_20;
    }

    [v10 ACMHandle];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKLocalSEPKey parametersWithACMHandle:](self, "parametersWithACMHandle:", v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9) {
      [v13 setData:v9 forKey:4];
    }
    id v14 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v13 bytes];
      [v13 length];
      uint64_t v15 = aks_ref_key_attest();
      TK_LOG_sepkey_0();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138544130;
        v27 = self;
        __int16 v28 = 2112;
        id v29 = v13;
        __int16 v30 = 2114;
        id v31 = v14;
        __int16 v32 = 1024;
        int v33 = v15;
        _os_log_debug_impl( &dword_186E58000,  v16,  OS_LOG_TYPE_DEBUG,  "aks_ref_key_attest(%{public}@, %@, attested: %{public}@) -> %08x",  buf,  0x26u);
      }

      if (!(_DWORD)v15)
      {
        TK_LOG_sepkey_0();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[TKLocalSEPRefKey attestKey:nonce:error:].cold.1();
        }

        [MEMORY[0x189603F48] dataWithBytesNoCopy:v25 length:v24];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }

      [v11 ACMHandle];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:]( self,  "error:withAKSReturn:ACMHandle:AKSOperation:params:message:",  a5,  v15,  v17,  @"oa",  v13,  @"unable to attest refkey->refkey");
    }

    else
    {
      if (a5)
      {
        uint64_t v19 = (void *)MEMORY[0x189607870];
        uint64_t v34 = *MEMORY[0x189607490];
        v35[0] = @"unsuitable key for attesting";
        [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:&v34 count:1];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v20];
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      TK_LOG_sepkey_0();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[TKLocalSEPRefKey attestKey:nonce:error:].cold.2();
      }
    }

    uint64_t v18 = 0LL;
LABEL_18:

    goto LABEL_19;
  }

  uint64_t v18 = 0LL;
LABEL_20:

  return v18;
}

- (void)dealloc
{
  if (self->_AKSRefKey) {
    aks_ref_key_free();
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKLocalSEPRefKey;
  -[TKLocalSEPRefKey dealloc](&v3, sel_dealloc);
}

- (aks_ref_key_s)AKSRefKey
{
  return self->_AKSRefKey;
}

- (void)_initWithObjectID:(void *)a1 authContext:caller:forceSystemSession:error:.cold.1(void *a1)
{
  OUTLINED_FUNCTION_7_0( &dword_186E58000,  v2,  v3,  "%{public}@ parsed for %{public}@ from objectID: ACL=%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4_1();
}

- (void)_initWithObjectID:(os_log_s *)a3 authContext:caller:forceSystemSession:error:.cold.2( void *a1,  int a2,  os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [a1 callerName];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "Request from %{public}@ for key with objectID containing invalid key type (%d)",  v6,  0x12u);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithObjectID:authContext:caller:forceSystemSession:error:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl( &dword_186E58000,  v1,  OS_LOG_TYPE_ERROR,  "Failed to set protection %{public}@ for ACL (error: %{public}@)",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_initWithKeyType:(void *)a1 keySize:accessControl:options:authContext:caller:forceSystemSession:error:.cold.1( void *a1)
{
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0( &dword_186E58000,  v1,  v2,  "%{public}@ generated for %{public}@: ACL=%{public}@",  v3,  v4,  v5,  v6,  2u);

  OUTLINED_FUNCTION_4_1();
}

- (void)deleteWithError:.cold.1()
{
}

- (void)signDigest:error:.cold.1()
{
}

- (void)computeSharedSecret:error:.cold.1()
{
}

- (void)recryptData:attributes:error:.cold.1()
{
}

- (void)attestKey:nonce:error:.cold.1()
{
}

- (void)attestKey:nonce:error:.cold.2()
{
}

@end