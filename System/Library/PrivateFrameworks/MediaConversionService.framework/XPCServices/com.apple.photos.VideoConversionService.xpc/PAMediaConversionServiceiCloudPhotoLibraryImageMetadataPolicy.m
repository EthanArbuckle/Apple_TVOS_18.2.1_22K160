@interface PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy
+ (id)standardPolicy;
- (id)processMetadata:(id)a3;
@end

@implementation PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy

- (id)processMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [[PFMetadata alloc] initWithImageProperties:v4 contentType:0 timeZoneLookup:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 livePhotoPairingIdentifier]);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy;
  id v7 = -[PAMediaConversionServiceDefaultImageMetadataPolicy processMetadata:](&v14, "processMetadata:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v6)
  {
    id v9 = [v8 mutableCopy];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 livePhotoPairingIdentifierMetadataKey]);
    unsigned int v11 = +[PFMetadataUtilities addMakerApplePropertyWithKey:value:toProperties:]( &OBJC_CLASS___PFMetadataUtilities,  "addMakerApplePropertyWithKey:value:toProperties:",  v10,  v6,  v9);

    if (v11)
    {
      id v12 = v9;

      v8 = v12;
    }
  }

  return v8;
}

+ (id)standardPolicy
{
  id v4 = (void *)objc_opt_class(a1);
  if (([v4 isEqual:objc_opt_class(PAMediaConversionServiceiCloudPhotoLibraryImageMetadataPolicy)] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 297, @"Subclasses must override %@", v8 object file lineNumber description];
  }

  if (qword_100039778 != -1) {
    dispatch_once(&qword_100039778, &stru_1000309F0);
  }
  return (id)qword_100039770;
}

@end