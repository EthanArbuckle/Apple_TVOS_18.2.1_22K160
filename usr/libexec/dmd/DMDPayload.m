@interface DMDPayload
- (id)description;
- (id)identifier;
@end

@implementation DMDPayload

- (id)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayload payloadDictionary](self, "payloadDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Identifier"]);

  return v3;
}

- (id)description
{
  v7[0] = @"objectID";
  v7[1] = @"identifier";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end