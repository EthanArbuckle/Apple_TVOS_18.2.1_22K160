@interface AMFIPathValidator_ios
- (AMFIPathValidator_ios)initWithURL:(id)a3;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4 withFlags:(int)a5;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffsetAsNumber:(id)a4 withFlags:(int)a5;
- (AMFIPathValidator_ios)initWithURL:(id)a3 withFlags:(int)a4;
- (BOOL)areEntitlementsValidated;
- (BOOL)computedCdHash:(unsigned __int8)a3[20];
- (BOOL)isValid;
- (BOOL)validateWithError:(id *)a3;
- (NSData)profileAuxSig;
- (NSData)profileData;
- (NSError)error;
- (int)isSignerType;
- (unsigned)signerType;
@end

@implementation AMFIPathValidator_ios

- (AMFIPathValidator_ios)initWithURL:(id)a3
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:]( self,  "initWithURL:withFileOffsetAsNumber:withFlags:",  a3,  0LL,  0LL);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFlags:(int)a4
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:]( self,  "initWithURL:withFileOffsetAsNumber:withFlags:",  a3,  0LL,  *(void *)&a4);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4
{
  return -[AMFIPathValidator_ios initWithURL:withFileOffset:withFlags:]( self,  "initWithURL:withFileOffset:withFlags:",  a3,  a4,  0LL);
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffset:(unint64_t)a4 withFlags:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = (void *)MEMORY[0x189607968];
  id v9 = a3;
  [v8 numberWithUnsignedLongLong:a4];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AMFIPathValidator_ios initWithURL:withFileOffsetAsNumber:withFlags:]( self,  "initWithURL:withFileOffsetAsNumber:withFlags:",  v9,  v10,  v5);

  return v11;
}

- (AMFIPathValidator_ios)initWithURL:(id)a3 withFileOffsetAsNumber:(id)a4 withFlags:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AMFIPathValidator_ios;
  v11 = -[AMFIPathValidator_ios init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_offset, a4);
    v12->_bootargs = 0LL;
    v12->_flags = a5;
    v12->_isValid = 0;
    v12->_validated = 0;
    v12->_signerType = 0;
    v12->_areEntitlementsValidated = 0;
    cdhash = v12->_cdhash;
    v12->_cdhash = 0LL;

    profileData = v12->_profileData;
    v12->_profileData = 0LL;

    amfi_interface_query_bootarg_state(&v12->_bootargs);
  }

  return v12;
}

- (BOOL)computedCdHash:(unsigned __int8)a3[20]
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  cdhash = self->_cdhash;
  if (cdhash) {
    -[NSData getBytes:length:](cdhash, "getBytes:length:", a3, 20LL);
  }
  return cdhash != 0LL;
}

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  self->_validated = 1;
  uint64_t v5 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithBool:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKey:*MEMORY[0x189616008]];

  [MEMORY[0x189607968] numberWithBool:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v7 forKey:*MEMORY[0x189615FE0]];

  offset = self->_offset;
  if (offset) {
    [v5 setObject:offset forKey:*MEMORY[0x189615FF8]];
  }
  -[NSURL path](self->_url, "path", &self->_url);
  id v9 = (os_log_s *)MISValidateSignatureAndCopyInfo();
  [0 objectForKey:*MEMORY[0x189615F60]];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v12 = v11;
  }
  else {
    v12 = 0LL;
  }
  id v13 = v12;

  unint64_t v14 = 0x189D45000uLL;
  if ((_DWORD)v9)
  {
    id v15 = v13;
    objc_super v16 = a3;
    v17 = (void *)MISCopyErrorStringForErrorCode();
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      [*v33 path];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138412802;
      *(void *)&cf[1] = v31;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = (_DWORD)v9;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v17;
      _os_log_error_impl(&dword_183D14000, v18, OS_LOG_TYPE_ERROR, "%@ not valid: 0x%x: %@", (uint8_t *)cf, 0x1Cu);
    }

    v19 = -[AMFIError initWithMISError:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithMISError:withURL:",  v9,  self->_url);
    error = self->_error;
    self->_error = &v19->super;

    unint64_t v14 = 6607360000LL;
    a3 = v16;
    id v13 = v15;
  }

  else
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [*v33 path];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138413058;
      *(void *)&cf[1] = v32;
      __int16 v35 = 2112;
      *(void *)v36 = v5;
      *(_WORD *)&v36[8] = 2112;
      *(void *)&v36[10] = 0LL;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_error_impl( &dword_183D14000,  v9,  OS_LOG_TYPE_ERROR,  "MIS Validation successful, but unexpected info? path: '%@', options: %@, info: %@, cdhash: %@",  (uint8_t *)cf,  0x2Au);
    }

    v21 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -401LL,  self->_url);
    LODWORD(v9) = 0;
    v17 = self->_error;
    self->_error = &v21->super;
  }

  if ((self->_flags & 1) != 0)
  {
    self->_BOOL isValid = 0;
    [*(id *)(v14 + 3168) generic];
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AMFIPathValidator_ios validateWithError:].cold.1(v33, v22);
    }

    v23 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -430LL,  self->_url);
    v24 = self->_error;
    self->_error = &v23->super;
  }

  BOOL isValid = self->_isValid;
  if (self->_isValid || (_DWORD)v9 == -402620388)
  {
LABEL_23:
    if (!a3) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }

  if ((self->_bootargs & 6) != 0)
  {
    [*(id *)(v14 + 3168) generic];
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      [*v33 path];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      cf[0] = 138412290;
      *(void *)&cf[1] = v27;
      _os_log_impl( &dword_183D14000,  v26,  OS_LOG_TYPE_INFO,  "boot-args allow process with invalid signature: %@",  (uint8_t *)cf,  0xCu);
    }

    self->_BOOL isValid = 1;
    v28 = self->_error;
    self->_error = 0LL;

    BOOL isValid = self->_isValid;
    goto LABEL_23;
  }

  BOOL isValid = 0;
  if (!a3) {
    goto LABEL_26;
  }
LABEL_24:
  if (!isValid)
  {
    *a3 = self->_error;
    BOOL isValid = self->_isValid;
  }

- (BOOL)isValid
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  return self->_isValid;
}

- (BOOL)areEntitlementsValidated
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  return self->_areEntitlementsValidated;
}

- (int)isSignerType
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  return self->_signerType;
}

- (NSData)profileData
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  return self->_profileData;
}

- (NSData)profileAuxSig
{
  if (!self->_validated) {
    -[AMFIPathValidator_ios validateWithError:](self, "validateWithError:", 0LL);
  }
  return self->_profileAuxSig;
}

- (NSError)error
{
  return self->_error;
}

- (unsigned)signerType
{
  return self->_signerType;
}

- (void).cxx_destruct
{
}

- (void)validateWithError:(id *)a1 .cold.1(id *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [*a1 path];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( &dword_183D14000,  a2,  OS_LOG_TYPE_ERROR,  "dyld_sim policy is not allowed on iOS: %@",  (uint8_t *)&v4,  0xCu);
}

- (void)validateWithError:(os_log_s *)a3 .cold.2(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [*a1 path];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_183D14000,  a3,  OS_LOG_TYPE_ERROR,  "Unable to extract signer type? path: '%@', info: '%@'",  (uint8_t *)&v6,  0x16u);
}

@end