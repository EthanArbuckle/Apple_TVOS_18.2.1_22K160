@interface _LSValidationToken
+ (BOOL)supportsSecureCoding;
- (_LSValidationToken)initWithCoder:(id)a3;
- (_LSValidationToken)initWithPayload:(id)a3;
- (id)setOwner:(id *)result;
- (uint64_t)isCorrectForPayload:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSValidationToken

- (_LSValidationToken)initWithPayload:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____LSValidationToken;
  v5 = -[_LSValidationToken init](&v13, sel_init);
  _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken initWithPayload:]");
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x20uLL, bytes);
    uint64_t v8 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:bytes length:32];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v8;

    uint64_t v10 = _LSValidationTokenComputeHMAC(v5->_payload, v5->_nonce);
    HMAC = v5->_HMAC;
    v5->_HMAC = (NSData *)v10;
  }

  return v5;
}

- (uint64_t)isCorrectForPayload:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken isCorrectForPayload:]");
    if (*(void *)(a1 + 8))
    {
      if (*(void *)(a1 + 16))
      {
        id v4 = *(void **)(a1 + 24);
        if (v4)
        {
          id v5 = v4;
          _LSValidationTokenComputeHMAC(v3, *(NSData **)(a1 + 16));
          uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6 && (size_t v7 = [v5 length], v7 == objc_msgSend(v6, "length")))
          {
            id v8 = v5;
            v9 = (const void *)[v8 bytes];
            id v10 = v6;
            int v11 = timingsafe_bcmp(v9, (const void *)[v10 bytes], v7);

            if (!v11)
            {
              a1 = 1LL;
              goto LABEL_20;
            }
          }

          else
          {
          }
        }
      }
    }

    if ([(id)__LSDefaultsGetSharedInstance() isAppleInternal])
    {
      v12 = (id *)(a1 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

      if (WeakRetained)
      {
        _LSDefaultLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_LSValidationToken isCorrectForPayload:].cold.3(v12, v14);
        }
      }

      else
      {
        _LSDefaultLog();
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[_LSValidationToken isCorrectForPayload:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
    }

    _LSDefaultLog();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_LSValidationToken isCorrectForPayload:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    a1 = 0LL;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_payload forKey:@"payload"];
  [v4 encodeObject:self->_nonce forKey:@"nonce"];
  [v4 encodeObject:self->_HMAC forKey:@"HMAC"];
}

- (_LSValidationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____LSValidationToken;
  id v5 = -[_LSValidationToken init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"payload");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"nonce");
    size_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"HMAC");
    v9 = (void *)v8;
    if (v6 && v7 && v8)
    {
      objc_storeStrong((id *)&v5->_payload, v6);
      objc_storeStrong((id *)&v5->_nonce, v7);
      objc_storeStrong((id *)&v5->_HMAC, v9);
      if (![(id)__LSDefaultsGetSharedInstance() isServer]
        || (-[_LSValidationToken isCorrectForPayload:]((uint64_t)v5, v5->_payload) & 1) != 0)
      {
        goto LABEL_10;
      }

      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[_LSValidationToken initWithCoder:]",  114LL,  0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 failWithError:v10];
    }

    else
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4865LL,  (uint64_t)"-[_LSValidationToken initWithCoder:]",  118LL,  0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 failWithError:v10];
    }

    id v5 = 0LL;
LABEL_10:
  }

  return v5;
}

- (id)setOwner:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 4, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)isCorrectForPayload:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)isCorrectForPayload:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)isCorrectForPayload:(id *)a1 .cold.3(id *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained(a1);
  int v4 = 138543362;
  id v5 = WeakRetained;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Token validation failed against object %{public}@.",  (uint8_t *)&v4,  0xCu);
}

@end