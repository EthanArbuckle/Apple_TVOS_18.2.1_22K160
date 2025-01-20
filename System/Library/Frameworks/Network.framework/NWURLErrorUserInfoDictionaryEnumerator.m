@interface NWURLErrorUserInfoDictionaryEnumerator
- (NSEnumerator)userInfoKeyEnumerator;
- (NWURLError)error;
- (id)nextObject;
- (void)setError:(id)a3;
- (void)setUserInfoKeyEnumerator:(id)a3;
@end

@implementation NWURLErrorUserInfoDictionaryEnumerator

- (id)nextObject
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 nextObject];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    while (1)
    {
      v5 = +[NWURLError allUserInfoKeys](&OBJC_CLASS___NWURLError, "allUserInfoKeys");
      [v5 objectForKeyedSubscript:v4];
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = NSSelectorFromString(v6);
      v8 = -[NWURLErrorUserInfoDictionaryEnumerator error](self, "error");
      [v8 v7];
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9) {
        break;
      }
      v10 = -[NWURLErrorUserInfoDictionaryEnumerator userInfoKeyEnumerator](self, "userInfoKeyEnumerator");
      uint64_t v11 = [v10 nextObject];

      v4 = (void *)v11;
      if (!v11) {
        goto LABEL_4;
      }
    }

    id v12 = v4;
  }

  else
  {
LABEL_4:
    id v12 = 0LL;
  }

  return v12;
}

- (NWURLError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSEnumerator)userInfoKeyEnumerator
{
  return self->_userInfoKeyEnumerator;
}

- (void)setUserInfoKeyEnumerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end