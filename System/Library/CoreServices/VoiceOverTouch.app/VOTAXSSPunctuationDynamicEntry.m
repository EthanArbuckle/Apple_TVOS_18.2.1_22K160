@interface VOTAXSSPunctuationDynamicEntry
- (id)dynamicReplacement;
- (id)replacement;
- (void)setDynamicReplacement:(id)a3;
@end

@implementation VOTAXSSPunctuationDynamicEntry

- (id)replacement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTAXSSPunctuationDynamicEntry dynamicReplacement](self, "dynamicReplacement"));

  if (v3)
  {
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[VOTAXSSPunctuationDynamicEntry dynamicReplacement](self, "dynamicReplacement"));
    uint64_t v5 = v4[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    return v6;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___VOTAXSSPunctuationDynamicEntry;
    id v8 = -[VOTAXSSPunctuationDynamicEntry replacement](&v9, "replacement");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }

- (id)dynamicReplacement
{
  return self->_dynamicReplacement;
}

- (void)setDynamicReplacement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end