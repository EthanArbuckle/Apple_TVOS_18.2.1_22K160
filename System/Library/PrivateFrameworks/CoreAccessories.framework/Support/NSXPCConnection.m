@interface NSXPCConnection
- (BOOL)hasCategory:(id)a3 forEntitlement:(id)a4;
- (BOOL)hasEntitlement:(id)a3;
@end

@implementation NSXPCConnection

- (BOOL)hasEntitlement:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a3));
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && ([v3 BOOLValue] & 1) != 0
      || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
    {
      char isKindOfClass = 1;
    }

    else
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      char isKindOfClass = objc_opt_isKindOfClass(v3, v7);
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)hasCategory:(id)a3 forEntitlement:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", a4));
  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
  if (objc_opt_isKindOfClass(v7, v8) & 1) != 0 && ([v7 containsObject:v6])
  {
    unsigned __int8 v9 = 1;
    goto LABEL_14;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
  {
LABEL_9:
    unsigned __int8 v9 = 0;
    goto LABEL_14;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);
      unsigned __int8 v9 = [v14 BOOLValue];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

LABEL_14:
  return v9;
}

@end