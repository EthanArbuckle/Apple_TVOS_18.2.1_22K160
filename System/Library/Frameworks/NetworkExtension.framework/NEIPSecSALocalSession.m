@interface NEIPSecSALocalSession
- (BOOL)addLarvalSA:(id)a3;
- (NEIPSecSALocalSession)initWithName:(id)a3 delegate:(id)a4;
- (id)description;
@end

@implementation NEIPSecSALocalSession

- (NEIPSecSALocalSession)initWithName:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEIPSecSALocalSession;
  v4 = -[NEIPSecSASession initWithName:delegate:](&v10, sel_initWithName_delegate_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }

  else
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "[super initWithName:delegate] failed", v9, 2u);
    }
  }

  return v5;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self) {
    unint64_t uniqueIndex = self->super._uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0LL;
  }
  v5 = -[NEIPSecSASession name](self, "name");
  v6 = (void *)[v3 initWithFormat:@"LocalSASession[%llu, %@]", uniqueIndex, v5];

  return v6;
}

- (BOOL)addLarvalSA:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v4 = a3;
  int v5 = [v4 spi];
  if (v5)
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      v13 = self;
      __int16 v14 = 1024;
      unsigned int v15 = bswap32([v4 spi]);
      _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, "%@ SPI is not 0, it is %X", (uint8_t *)&v12, 0x12u);
    }

    ne_log_obj();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "SPI is not 0", (uint8_t *)&v12, 2u);
    }
  }

  else
  {
    uint32_t v8 = arc4random();
    if (v4) {
      v4[5] = v8;
    }
    if (self) {
      id Property = objc_getProperty(self, v9, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property addObject:v4];
  }

  return v5 == 0;
}

@end