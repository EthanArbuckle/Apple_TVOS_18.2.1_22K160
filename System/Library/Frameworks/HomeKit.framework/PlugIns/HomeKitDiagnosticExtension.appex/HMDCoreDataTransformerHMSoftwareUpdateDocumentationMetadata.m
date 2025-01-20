@interface HMDCoreDataTransformerHMSoftwareUpdateDocumentationMetadata
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerHMSoftwareUpdateDocumentationMetadata

+ (id)allowedTopLevelClasses
{
  v8[0] = objc_opt_class(&OBJC_CLASS___HMSoftwareUpdateDocumentationMetadata, a2);
  v8[1] = objc_opt_class(&OBJC_CLASS___NSURL, v2);
  v8[2] = objc_opt_class(&OBJC_CLASS___HMFDigest, v3);
  v8[3] = objc_opt_class(&OBJC_CLASS___NSUUID, v4);
  v8[4] = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  v8[5] = objc_opt_class(&OBJC_CLASS___NSData, v6);
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v8,  6LL));
}

@end