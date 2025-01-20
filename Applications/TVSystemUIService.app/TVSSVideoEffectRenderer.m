@interface TVSSVideoEffectRenderer
- (BOOL)isFocusable;
@end

@implementation TVSSVideoEffectRenderer

- (BOOL)isFocusable
{
  v7[2] = self;
  v7[1] = (id)a2;
  id v4 = -[TVSSVideoEffectRenderer content](self, "content");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSVideoEffect);
  id v5 = sub_100114594(v4, v2);

  v7[0] = v5;
  unsigned int v6 = [v5 isUnavailable] ^ 1;
  objc_storeStrong(v7, 0LL);
  return v6 & 1;
}

@end