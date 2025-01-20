@interface NSCoder(LaunchServicesAdditions)
- (id)ls_decodeArrayWithValuesOfClass:()LaunchServicesAdditions forKey:;
- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClass:forKey:;
- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClasses:forKey:;
- (id)ls_decodeObjectOfClass:()LaunchServicesAdditions forKey:;
- (id)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:;
- (id)ls_decodeSetWithValuesOfClass:()LaunchServicesAdditions forKey:;
@end

@implementation NSCoder(LaunchServicesAdditions)

- (id)ls_decodeObjectOfClass:()LaunchServicesAdditions forKey:
{
  uint64_t v10 = a3;
  v5 = (objc_class *)MEMORY[0x189604010];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithObjects:&v10 count:1];
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x186E2A59C]();
  if (_LSClassListContainsBundleRecord(v6))
  {
    _LSDefaultLog();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = [v6 setByAddingObject:objc_opt_class()];

    id v6 = (id)v17;
  }

  [a1 decodeObjectOfClasses:v6 forKey:v7];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);
  if (v18 && (_LSIsKindOfClasses(v18, v6) & 1) == 0)
  {

    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeObjectOfClasses:forKey:]",  197LL,  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 failWithError:v19];

    v18 = 0LL;
  }

  return v18;
}

- (id)ls_decodeArrayWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  id v6 = (void *)MEMORY[0x189604010];
  id v7 = a4;
  objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [MEMORY[0x189604010] setWithObject:a3];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = _LSIsArrayWithValuesOfClasses(v9, v10);

    if ((v11 & 1) == 0)
    {

      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeArrayWithValuesOfClass:forKey:]",  210LL,  0LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 failWithError:v12];

      v9 = 0LL;
    }
  }

  return v9;
}

- (id)ls_decodeSetWithValuesOfClass:()LaunchServicesAdditions forKey:
{
  id v6 = (void *)MEMORY[0x189604010];
  id v7 = a4;
  objc_msgSend(v6, "setWithObjects:", objc_opt_class(), a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (_LSIsSetWithValuesOfClass(v9, a3) & 1) == 0)
  {

    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeSetWithValuesOfClass:forKey:]",  222LL,  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 failWithError:v10];

    v9 = 0LL;
  }

  return v9;
}

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClass:forKey:
{
  v8 = (void *)MEMORY[0x189604010];
  id v9 = a5;
  [v8 setWithObject:a4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", a3, v10, v9);
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)ls_decodeDictionaryWithKeysOfClass:()LaunchServicesAdditions valuesOfClasses:forKey:
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  v17[0] = objc_opt_class();
  v17[1] = a3;
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:2];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setByAddingObjectsFromArray:v10];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ls_decodeObjectOfClasses:forKey:", v11, v9);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!a3)
    {
      if ((_LSIsDictionaryWithKeysAndValuesOfClasses(v12, 0LL, v8) & 1) != 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    [MEMORY[0x189604010] setWithObject:a3];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = _LSIsDictionaryWithKeysAndValuesOfClasses(v12, v13, v8);

    if ((v14 & 1) == 0)
    {
LABEL_4:

      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[NSCoder(LaunchServicesAdditions) ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:]",  241LL,  0LL);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [a1 failWithError:v15];

      uint64_t v12 = 0LL;
    }
  }

- (void)ls_decodeObjectOfClasses:()LaunchServicesAdditions forKey:.cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end