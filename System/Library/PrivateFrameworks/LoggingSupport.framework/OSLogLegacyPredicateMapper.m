@interface OSLogLegacyPredicateMapper
@end

@implementation OSLogLegacyPredicateMapper

void __68___OSLogLegacyPredicateMapper_mapLeftExpression_andRightExpression___block_invoke()
{
  v0 = (void *)mapLeftExpression_andRightExpression__keypathMaps_349;
  mapLeftExpression_andRightExpression__keypathMaps_349 = (uint64_t)&unk_189F1D4C8;
}

void __44___OSLogLegacyPredicateMapper_validKeyPaths__block_invoke()
{
  v9[11] = *MEMORY[0x1895F89C0];
  id v0 = objc_alloc_init(MEMORY[0x189603FE0]);
  v1 = (void *)validKeyPaths__legacyValidKeyPaths;
  validKeyPaths__legacyValidKeyPaths = (uint64_t)v0;

  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  v9[4] = objc_opt_class();
  v9[5] = objc_opt_class();
  v9[6] = objc_opt_class();
  v9[7] = objc_opt_class();
  v9[8] = objc_opt_class();
  v9[9] = objc_opt_class();
  uint64_t v2 = 0LL;
  v9[10] = objc_opt_class();
  do
  {
    v3 = class_copyPropertyList((Class)v9[v2], &outCount);
    if (v3)
    {
      v4 = v3;
      if (outCount)
      {
        for (unint64_t i = 0LL; i < outCount; ++i)
        {
          v6 = (void *)validKeyPaths__legacyValidKeyPaths;
          [NSString stringWithUTF8String:property_getName(v4[i])];
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 addObject:v7];
        }
      }

      free(v4);
    }

    ++v2;
  }

  while (v2 != 11);
}

@end