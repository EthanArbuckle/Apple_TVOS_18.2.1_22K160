@interface LACACMHelper
+ (id)createACMContext;
- (BOOL)setVariable:(unsigned int)a3 value:(id)a4 error:(id *)a5;
- (LACACMHelper)initWithACMContext:(__ACMHandle *)a3;
- (LACACMHelper)initWithExternalizedContext:(id)a3;
- (NSData)externalizedContext;
- (__ACMHandle)acmContext;
- (id)exchangeControlData:(id)a3 error:(id *)a4;
- (id)initAndCreateContext;
- (void)dealloc;
- (void)setAcmContext:(__ACMHandle *)a3;
@end

@implementation LACACMHelper

- (id)initAndCreateContext
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[LACACMHelper initWithExternalizedContext:](self, "initWithExternalizedContext:", v3);
    v4 = self;
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (LACACMHelper)initWithACMContext:(__ACMHandle *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACACMHelper;
  result = -[LACACMHelper init](&v5, sel_init);
  if (result) {
    result->_acmContext = a3;
  }
  return result;
}

- (LACACMHelper)initWithExternalizedContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LACACMHelper;
  objc_super v5 = -[LACACMHelper init](&v8, sel_init);
  if (v5)
  {
    id v6 = v4;
    v5->_acmContext = (__ACMHandle *)ACMContextCreateWithExternalForm( (_OWORD *)[v6 bytes],  objc_msgSend(v6, "length"));
    v5->_contextOwner = 1;
  }

  return v5;
}

- (void)dealloc
{
  acmContext = self->_acmContext;
  if (acmContext && self->_contextOwner) {
    ACMContextDelete(acmContext, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LACACMHelper;
  -[LACACMHelper dealloc](&v4, sel_dealloc);
}

- (NSData)externalizedContext
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = 0LL;
  acmContext = self->_acmContext;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__LACACMHelper_externalizedContext__block_invoke;
  v5[3] = &unk_18A369FD8;
  v5[4] = &v6;
  ACMContextGetExternalForm(acmContext, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __35__LACACMHelper_externalizedContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)setVariable:(unsigned int)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  LACLogACM();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_189219000, v9, OS_LOG_TYPE_DEFAULT, "Setting ACM envrionment variable: %d", buf, 8u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = 0LL;
  uint64_t bag_uuid = aks_get_bag_uuid(0, buf);
  if ((_DWORD)bag_uuid)
  {
    if (!a5)
    {
LABEL_10:
      BOOL v14 = 0;
      goto LABEL_11;
    }

    objc_msgSend( NSString,  "stringWithFormat:",  @"Unable to get keybag UUID with code: %d",  bag_uuid,  v17);
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](&OBJC_CLASS___LACError, "errorWithCode:debugDescription:", -1000LL, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

  acmContext = self->_acmContext;
  id v12 = v8;
  uint64_t v13 = ACMSetEnvironmentVariableWithAccessPolicy( v6,  acmContext,  buf,  16,  (const void *)[v12 bytes],  objc_msgSend(v12, "length"));
  BOOL v14 = (_DWORD)v13 == 0;
  if (a5 && (_DWORD)v13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unable to set variable: %d with status: %d", v6, v13);
    goto LABEL_9;
  }

- (id)exchangeControlData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__4;
  uint64_t v19 = __Block_byref_object_dispose__4;
  id v20 = (id)objc_opt_new();
  acmContext = self->_acmContext;
  id v8 = v6;
  v9 = (const void *)[v8 bytes];
  size_t v10 = [v8 length];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __42__LACACMHelper_exchangeControlData_error___block_invoke;
  v14[3] = &unk_18A369FD8;
  v14[4] = &v15;
  uint64_t v11 = ACMSEPControlEx((uint64_t)acmContext, 0LL, 0, v9, v10, (uint64_t)v14);
  if ((_DWORD)v11)
  {
    if (a4)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"Control exchange data failed with error code: %d",  v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0LL;
    }
  }

  else
  {
    a4 = (id *)(id)v16[5];
  }

  _Block_object_dispose(&v15, 8);

  return a4;
}

void __42__LACACMHelper_exchangeControlData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      uint64_t v4 = [MEMORY[0x189603F48] dataWithBytes:a2 length:a3];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }

+ (id)createACMContext
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v7 = 0LL;
  int v2 = ACMContextCreate((uint64_t *)&v7);
  if (v2)
  {
    LACLogACM();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v2;
      _os_log_impl(&dword_189219000, v3, OS_LOG_TYPE_DEFAULT, "Unable to create ACM context with status: %d", buf, 8u);
    }

    return 0LL;
  }

  else
  {
    *(void *)buf = 0LL;
    v9 = buf;
    uint64_t v10 = 0x3032000000LL;
    uint64_t v11 = __Block_byref_object_copy__4;
    id v12 = __Block_byref_object_dispose__4;
    id v13 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __32__LACACMHelper_createACMContext__block_invoke;
    v6[3] = &unk_18A369FD8;
    v6[4] = buf;
    ACMContextGetExternalForm(v7, (uint64_t)v6);
    id v5 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);

    return v5;
  }

void __32__LACACMHelper_createACMContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [objc_alloc(MEMORY[0x189603F48]) initWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (__ACMHandle)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(__ACMHandle *)a3
{
  self->_acmContext = a3;
}

@end