@interface HMDOPACKTransformer
+ (BOOL)isStructuredDataCompatible;
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
- (id)OPACKFromValue:(id)a3 error:(id *)a4;
- (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDOPACKTransformer

- (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v8 = (void *)objc_opt_class(self, v7);
  id v9 = [v8 valueClass];
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue([v8 OPACKFromValue:v6 error:a4]);
  }

  else if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Expected %@", v9));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v10));

    a4 = 0LL;
  }

  return a4;
}

- (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    if (qword_100032CF0 != -1) {
      dispatch_once(&qword_100032CF0, &stru_100028978);
    }
    CFTypeID v7 = CFGetTypeID(v6);
    if (v7 == qword_100032CB0
      || v7 == qword_100032CB8
      || v7 == qword_100032CC0
      || v7 == qword_100032CC8
      || v7 == qword_100032CD0
      || v7 == qword_100032CD8
      || v7 == qword_100032CE0
      || v7 == qword_100032CE8)
    {
    }

    else
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSUUID, v8);
      char isKindOfClass = objc_opt_isKindOfClass(v6, v9);

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_13;
      }
    }

    id v13 = objc_msgSend((id)objc_opt_class(self, v11), "valueFromOPACK:error:", v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_17;
  }

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___HMDOPACKTransformer, a2) == a1) {
    return +[HMDOPACKTransformer allocWithZone:](&OBJC_CLASS___HMDDefaultOPACKTransformer, "allocWithZone:", a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HMDOPACKTransformer;
  return objc_msgSendSuper2(&v6, "allocWithZone:", a3);
}

+ (Class)valueClass
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (Class)+[HMDOPACKTransformer isStructuredDataCompatible](v6, v7);
}

+ (BOOL)isStructuredDataCompatible
{
  return 1;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "OPACKFromValue:error:", a3));
  id v6 = (void *)v5;
  if (v5)
  {
    int v12 = -6700;
    SEL v7 = (void *)OPACKEncoderCreateData(v5, 8LL, &v12);
    uint64_t v8 = v7;
    if (!v7 || v12)
    {
      if (a4)
      {
        if (!v12)
        {
          id v9 = 0LL;
          *a4 = 0LL;
          goto LABEL_11;
        }

        id v10 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain));
        *a4 = v10;
      }

      id v9 = 0LL;
    }

    else
    {
      id v9 = v7;
    }

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  int v9 = -6705;
  id v6 = (void *)OPACKDecodeData(a3, 8LL, &v9);
  if (!v6 || v9)
  {
    if (a4)
    {
      id v7 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6705LL, 0LL));
      *a4 = v7;

      a4 = 0LL;
    }
  }

  else
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue([a1 valueFromOPACK:v6 error:a4]);
  }

  return a4;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return +[HMDOPACKTransformer valueFromOPACK:error:](v10, v11, v12, v13);
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return +[HMDDefaultOPACKTransformer description](v10, v11);
}

@end