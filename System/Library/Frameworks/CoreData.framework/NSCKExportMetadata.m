@interface NSCKExportMetadata
+ (NSString)entityPath;
@end

@implementation NSCKExportMetadata

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

@end