@interface PAMediaConversionServiceImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)standardPolicy;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceImageMetadataPolicy

- (BOOL)metadataNeedsProcessing:(id)a3
{
  return 0;
}

- (id)processMetadata:(id)a3
{
  return a3;
}

+ (id)standardPolicy
{
  v4 = (void *)objc_opt_class(a1);
  if (([v4 isEqual:objc_opt_class(PAMediaConversionServiceImageMetadataPolicy)] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 33, @"Subclasses must override %@", v8 object file lineNumber description];
  }

  if (qword_100039758 != -1) {
    dispatch_once(&qword_100039758, &stru_1000309B0);
  }
  return (id)qword_100039750;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end