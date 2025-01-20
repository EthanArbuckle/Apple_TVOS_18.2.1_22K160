@interface NSMutableDictionary(DIExtension)
- (id)popObjectForKey:()DIExtension;
- (uint64_t)validateAndPopObjectForKey:()DIExtension className:isOptional:error:;
- (uint64_t)validateObjWithKey:()DIExtension className:isOptional:error:;
@end

@implementation NSMutableDictionary(DIExtension)

- (id)popObjectForKey:()DIExtension
{
  id v4 = a3;
  [a1 objectForKey:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 removeObjectForKey:v4];

  return v5;
}

- (uint64_t)validateAndPopObjectForKey:()DIExtension className:isOptional:error:
{
  id v10 = a3;
  uint64_t v11 = [a1 validateObjWithKey:v10 className:a4 isOptional:a5 error:a6];
  id v12 = (id)[a1 popObjectForKey:v10];

  return v11;
}

- (uint64_t)validateObjWithKey:()DIExtension className:isOptional:error:
{
  id v9 = a3;
  [a1 objectForKey:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if (a6 && (isKindOfClass & 1) == 0)
  {
    [NSString stringWithFormat:@"Validation failed for dictionary key %@.", v9];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DIError errorWithPOSIXCode:verboseInfo:](&OBJC_CLASS___DIError, "errorWithPOSIXCode:verboseInfo:", 22LL, v11);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return isKindOfClass & 1;
}

@end