@interface RMAssetPayload
- (id)reportDetails;
@end

@implementation RMAssetPayload

- (id)reportDetails
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMAssetPayload;
  id v3 = -[RMDeclarationPayload reportDetails](&v9, "reportDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[RMAssetPayload prefetch](self, "prefetch")));
  [v5 setObject:v6 forKeyedSubscript:@"prefetch"];

  id v7 = [v5 copy];
  return v7;
}

@end