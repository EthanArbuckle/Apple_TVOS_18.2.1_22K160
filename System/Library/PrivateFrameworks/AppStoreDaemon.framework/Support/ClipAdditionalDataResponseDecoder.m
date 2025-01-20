@interface ClipAdditionalDataResponseDecoder
- (id)resultFromResult:(id)a3 error:(id *)a4;
@end

@implementation ClipAdditionalDataResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_self(&OBJC_CLASS___ClipAdditionalDataResponseDecoder);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 response]);
    v11 = -[NSIndexSet initWithIndexesInRange:]( objc_alloc(&OBJC_CLASS___NSIndexSet),  "initWithIndexesInRange:",  200LL,  100LL);
    unsigned int v12 = -[NSIndexSet containsIndex:](v11, "containsIndex:", [v10 statusCode]);
    if ((v12 & 1) != 0)
    {
      id v13 = 0LL;
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Invalid Status Code: %lu",  [v10 statusCode]));
      uint64_t v18 = ASDErrorWithDescription(AMSErrorDomain, 301LL, v17);
      id v13 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    id v16 = v13;
    if (v12)
    {
      id v19 = v5;
      objc_opt_self(&OBJC_CLASS___ClipAdditionalDataResponseDecoder);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 object]);
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
      char v23 = objc_opt_isKindOfClass(v20, v22);

      if ((v23 & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v19 object]);
        id v25 = sub_1001DF39C(v24, @"status", 0LL);
        id v26 = v16;
        if (v25)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid Response Status: %lu",  v25));
          uint64_t v28 = ASDErrorWithDescription(ASDErrorDomain, 507LL, v27);
          id v26 = (id)objc_claimAutoreleasedReturnValue(v28);
        }
      }

      else
      {
        uint64_t v29 = ASDErrorWithDescription(ASDErrorDomain, 507LL, @"Response is not of type NSDictionary");
        id v26 = (id)objc_claimAutoreleasedReturnValue(v29);
      }

      id v30 = v26;
      id v16 = v30;
    }
  }

  else
  {
    uint64_t v14 = ASDErrorWithDescription(AMSErrorDomain, 301LL, @"Response is not of type NSHTTPURLResponse");
    id v15 = (id)objc_claimAutoreleasedReturnValue(v14);

    id v16 = v15;
  }

  if (v16)
  {
    v31 = 0LL;
    if (a4) {
      *a4 = v16;
    }
  }

  else
  {
    v31 = -[ClipAdditionalDataResult initWithResult:]( objc_alloc(&OBJC_CLASS___ClipAdditionalDataResult),  "initWithResult:",  v5);
  }

  return v31;
}

@end