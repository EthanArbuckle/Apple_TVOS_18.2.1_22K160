@interface DMPluginSpecificUtilitiesManager
+ (id)_uniqueNameFromPluginIdentifier:(id)a3;
+ (id)utilitiesForPluginIdentifier:(id)a3;
@end

@implementation DMPluginSpecificUtilitiesManager

+ (id)utilitiesForPluginIdentifier:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _uniqueNameFromPluginIdentifier:v5]);
  if (v6)
  {
    v7 = (NSString *)objc_claimAutoreleasedReturnValue([@"DMPlugin" stringByAppendingString:v6]);
    Class v8 = NSClassFromString(v7);
    if (v8
      && (v9 = v8,
          (-[objc_class conformsToProtocol:]( v8,  "conformsToProtocol:",  &OBJC_PROTOCOL___DMPluginSpecificUtilities) & 1) != 0))
    {
      id v10 = objc_alloc_init(v9);
      v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        _DMLogFunc(v3, 3LL);
      }
    }

    else
    {
      _DMLogFunc(v3, 3LL);
      v11 = 0LL;
    }
  }

  else
  {
    _DMLogFunc(v3, 3LL);
    v11 = 0LL;
  }

  return v11;
}

+ (id)_uniqueNameFromPluginIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  if ((unint64_t)[v3 count] >= 3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subarrayWithRange:", 2, (char *)objc_msgSend(v3, "count") - 2));

    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:&stru_10000C478]);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"-0" withString:&stru_10000C478]);

    uint64_t v3 = v5;
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end