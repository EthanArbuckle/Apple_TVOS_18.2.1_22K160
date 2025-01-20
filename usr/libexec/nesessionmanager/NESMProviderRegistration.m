@interface NESMProviderRegistration
- (BOOL)isEqual:(id)a3;
@end

@implementation NESMProviderRegistration

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NESMProviderRegistration);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    BOOL v8 = 0;
    goto LABEL_7;
  }

  if (!v4)
  {
    uint64_t v6 = 0LL;
    if (self) {
      goto LABEL_4;
    }
LABEL_9:
    unint64_t token = 0LL;
    goto LABEL_5;
  }

  uint64_t v6 = v4[1];
  if (!self) {
    goto LABEL_9;
  }
LABEL_4:
  unint64_t token = self->_token;
LABEL_5:
  BOOL v8 = v6 == token;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
}

@end