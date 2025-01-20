@interface LWCRTypeErrorContext
- (LWCRTypeErrorContext)init;
- (id)synthesizeError;
- (void)popKey;
- (void)pushKey:(id)a3;
- (void)setError:(unsigned int)a3;
@end

@implementation LWCRTypeErrorContext

- (LWCRTypeErrorContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LWCRTypeErrorContext;
  v2 = -[LWCRTypeErrorContext init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keyContext = v2->keyContext;
    v2->keyContext = (NSMutableArray *)v3;

    v2->code = 0;
  }

  return v2;
}

- (void)pushKey:(id)a3
{
}

- (void)popKey
{
}

- (void)setError:(unsigned int)a3
{
  self->code = a3;
}

- (id)synthesizeError
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (void *)objc_opt_new();
  objc_msgSend( v3,  "appendFormat:",  @"Error: %s, Context: ",  LWCRTypeVerificationBackend_errorStringForCode(self->code));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = self->keyContext;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        else {
          [v3 appendFormat:@" -> %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
      }

      v7 += v6;
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  v10 = (void *)objc_opt_new();
  [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x1896075E0]];
  [MEMORY[0x189607870] errorWithDomain:@"LWCRVerificationError" code:self->code userInfo:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
}

@end