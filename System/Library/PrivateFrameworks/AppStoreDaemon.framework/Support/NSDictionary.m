@interface NSDictionary
- (id)_tcr_associatedReader;
@end

@implementation NSDictionary

- (id)_tcr_associatedReader
{
  v11.receiver = self;
  v11.super_class = &OBJC_CLASS___NSDictionary;
  id v3 = -[NSDictionary _tcr_associatedReader](&v11, "_tcr_associatedReader");
  v4 = (TypeCheckedDictionaryReader *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TypeCheckedDictionaryReader, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v7 = objc_alloc(&OBJC_CLASS___TypeCheckedDictionaryReader);
    v8 = self;
    if (v7)
    {
      v12.receiver = v7;
      v12.super_class = (Class)&OBJC_CLASS___TypeCheckedDictionaryReader;
      v9 = -[NSDictionary init](&v12, "init");
      v7 = (TypeCheckedDictionaryReader *)v9;
      if (v9) {
        objc_storeWeak((id *)&v9[1].super.isa, v8);
      }
    }

    -[NSDictionary _tcr_associateWithReader:](v8, "_tcr_associateWithReader:", v7);
    v4 = v7;
  }

  return v4;
}

@end