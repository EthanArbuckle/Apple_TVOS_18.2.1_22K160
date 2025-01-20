@interface NSKeyedUnarchiver(LaunchServicesAdditions)
+ (id)ls_unarchivedObjectOfClass:()LaunchServicesAdditions fromData:error:;
@end

@implementation NSKeyedUnarchiver(LaunchServicesAdditions)

+ (id)ls_unarchivedObjectOfClass:()LaunchServicesAdditions fromData:error:
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    [MEMORY[0x189604010] setWithObject:a3];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = _LSIsKindOfClasses(v7, v8);

    if ((v9 & 1) == 0)
    {

      if (a5)
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"+[NSKeyedUnarchiver(LaunchServicesAdditions) ls_unarchivedObjectOfClass:fromData:error:]",  161LL,  0LL);
        v7 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v7 = 0LL;
      }
    }
  }

  return v7;
}

@end