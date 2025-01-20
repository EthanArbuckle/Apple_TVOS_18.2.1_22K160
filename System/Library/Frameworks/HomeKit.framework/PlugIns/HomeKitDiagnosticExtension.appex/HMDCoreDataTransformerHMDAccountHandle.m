@interface HMDCoreDataTransformerHMDAccountHandle
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation HMDCoreDataTransformerHMDAccountHandle

- (id)transformedValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[HMDAccountHandleFormatter defaultFormatter]( &OBJC_CLASS___HMDAccountHandleFormatter,  "defaultFormatter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForObjectValue:v3]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      v6 = v4;
    }
    else {
      v6 = 0LL;
    }
    id v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[HMDAccountHandleFormatter defaultFormatter]( &OBJC_CLASS___HMDAccountHandleFormatter,  "defaultFormatter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountHandleFromString:v7]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

@end