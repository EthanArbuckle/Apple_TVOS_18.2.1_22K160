@interface HMDMatterCommandsTransformer
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
- (id)OPACKFromValue:(id)a3 error:(id *)a4;
- (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDMatterCommandsTransformer

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  return +[HMDMatterCommandActionUtilities commandsInStoreRepresentation:]( &OBJC_CLASS___HMDMatterCommandActionUtilities,  "commandsInStoreRepresentation:",  a3,  a4);
}

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    v8 = v5;
  }
  else {
    v8 = 0LL;
  }
  id v9 = v8;
  if (v9)
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue( +[HMDMatterCommandActionUtilities commandsInMemoryRepresentation:]( &OBJC_CLASS___HMDMatterCommandActionUtilities,  "commandsInMemoryRepresentation:",  v9));
  }

  else if (a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Expected NSArray value to create commands: %@",  v5));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError hmfErrorWithCode:reason:]( &OBJC_CLASS___NSError,  "hmfErrorWithCode:reason:",  3LL,  v10));

    a4 = 0LL;
  }

  return a4;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSArray, a2);
}

- (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "OPACKFromValue:error:", v6, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "valueFromOPACK:error:", v6, a4);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

@end