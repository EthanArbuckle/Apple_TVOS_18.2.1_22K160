@interface NWURLErrorUserInfoDictionary
- (NWURLError)error;
- (NWURLErrorUserInfoDictionary)initWithError:(id)a3;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)setError:(id)a3;
@end

@implementation NWURLErrorUserInfoDictionary

- (NWURLErrorUserInfoDictionary)initWithError:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWURLErrorUserInfoDictionary;
  v5 = -[NWURLErrorUserInfoDictionary init](&v8, sel_init);
  v6 = v5;
  if (v5) {
    -[NWURLErrorUserInfoDictionary setError:](v5, "setError:", v4);
  }

  return v6;
}

- (unint64_t)count
{
  uint64_t v7 = 0LL;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v3 = +[NWURLError allUserInfoKeys](&OBJC_CLASS___NWURLError, "allUserInfoKeys");
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __37__NWURLErrorUserInfoDictionary_count__block_invoke;
  v6[3] = &unk_189BC6CA8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = +[NWURLError allUserInfoKeys](&OBJC_CLASS___NWURLError, "allUserInfoKeys");
  [v5 objectForKeyedSubscript:v4];
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = NSSelectorFromString(v6);

  if (v7)
  {
    -[NWURLErrorUserInfoDictionary error](self, "error");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 v7];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (![(id)*MEMORY[0x189607758] isEqual:v4])
    {
      uint64_t v9 = 0LL;
      goto LABEL_7;
    }

    -[NWURLErrorUserInfoDictionary error](self, "error");
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 failingURL];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 absoluteString];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

- (id)keyEnumerator
{
  v3 = objc_alloc_init(&OBJC_CLASS___NWURLErrorUserInfoDictionaryEnumerator);
  -[NWURLErrorUserInfoDictionary error](self, "error");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLErrorUserInfoDictionaryEnumerator setError:](v3, "setError:", v4);
  v5 = +[NWURLError allUserInfoKeys](&OBJC_CLASS___NWURLError, "allUserInfoKeys");
  [v5 keyEnumerator];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWURLErrorUserInfoDictionaryEnumerator setUserInfoKeyEnumerator:](v3, "setUserInfoKeyEnumerator:", v6);

  return v3;
}

- (NWURLError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

void __37__NWURLErrorUserInfoDictionary_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = a3;
  [v4 error];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = NSSelectorFromString(v5);

  [v6 v7];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
}

@end