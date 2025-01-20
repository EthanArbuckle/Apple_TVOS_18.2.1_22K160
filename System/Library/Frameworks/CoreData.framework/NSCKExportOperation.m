@interface NSCKExportOperation
+ (NSString)entityPath;
- (unint64_t)status;
- (void)setStatus:(unint64_t)a3;
@end

@implementation NSCKExportOperation

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (unint64_t)status
{
  return objc_msgSend((id)-[NSCKExportOperation statusNum](self, "statusNum"), "unsignedIntegerValue");
}

- (void)setStatus:(unint64_t)a3
{
}

@end