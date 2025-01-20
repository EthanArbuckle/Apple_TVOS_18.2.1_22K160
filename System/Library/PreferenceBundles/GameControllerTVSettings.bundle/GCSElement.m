@interface GCSElement
+ (id)tvset_assetNameLookup;
- (GCSElement)initWithElement:(id)a3;
- (id)tvset_assetName;
@end

@implementation GCSElement

+ (id)tvset_assetNameLookup
{
  if (qword_56908 != -1) {
    dispatch_once(&qword_56908, &stru_4D018);
  }
  return (id)qword_56910;
}

- (id)tvset_assetName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GCSElement tvset_assetNameLookup](&OBJC_CLASS___GCSElement, "tvset_assetNameLookup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCSElement name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GCSElement name](self, "name"));
  }
  return v5;
}

- (GCSElement)initWithElement:(id)a3
{
  id v4 = a3;
  v5 = (GCSElement *)objc_claimAutoreleasedReturnValue([v4 unmappedNameLocalizationKey]);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 unmappedSfSymbolsName]);

    if (v6)
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___GCControllerButtonInput);
      if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
      {
        uint64_t v8 = 1LL;
      }

      else
      {
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___GCControllerDirectionPad);
        if ((objc_opt_isKindOfClass(v4, v9) & 1) != 0) {
          uint64_t v8 = 2LL;
        }
        else {
          uint64_t v8 = 0LL;
        }
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryAlias]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 unmappedNameLocalizationKey]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 unmappedSfSymbolsName]);
      self =  -[GCSElement initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:]( self,  "initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:",  v10,  v11,  v12,  [v4 remappingKey],  v8);

      v5 = self;
    }

    else
    {
      v5 = 0LL;
    }
  }

  return v5;
}

@end