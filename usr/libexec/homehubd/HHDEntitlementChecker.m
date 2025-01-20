@interface HHDEntitlementChecker
+ (id)entitlementCheckerWithConnection:(id)a3;
- (BOOL)hasEntitlement:(unint64_t)a3;
- (HHDEntitlementChecker)initWithEntitlementArray:(id)a3;
@end

@implementation HHDEntitlementChecker

- (HHDEntitlementChecker)initWithEntitlementArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HHDEntitlementChecker;
  v5 = -[HHDEntitlementChecker init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    entitlements = v5->_entitlements;
    v5->_entitlements = v6;
  }

  return v5;
}

+ (id)entitlementCheckerWithConnection:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.homehubd"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    v6 = v3;
  }
  else {
    v6 = 0LL;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v24 + 1) + 8LL * (void)v13);
          v15 = sub_1000065A8(0LL);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          unsigned __int8 v17 = objc_msgSend(v14, "isEqualToString:", v16, (void)v24);

          uint64_t v18 = 0LL;
          if ((v17 & 1) != 0
            || (v19 = sub_1000065A8(1uLL),
                v20 = (void *)objc_claimAutoreleasedReturnValue(v19),
                unsigned int v21 = [v14 isEqualToString:v20],
                v20,
                uint64_t v18 = 1LL,
                v21))
          {

            id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v18));
            [v8 addObject:v14];
          }

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v11);
    }

    if ([v8 count]) {
      v22 = -[HHDEntitlementChecker initWithEntitlementArray:]( objc_alloc(&OBJC_CLASS___HHDEntitlementChecker),  "initWithEntitlementArray:",  v8);
    }
    else {
      v22 = 0LL;
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (BOOL)hasEntitlement:(unint64_t)a3
{
  entitlements = self->_entitlements;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  LOBYTE(entitlements) = -[NSArray containsObject:](entitlements, "containsObject:", v4);

  return (char)entitlements;
}

- (void).cxx_destruct
{
}

@end