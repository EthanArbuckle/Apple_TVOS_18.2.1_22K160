@interface NSCKExportedObject
+ (NSString)entityPath;
- (int64_t)changeType;
- (unint64_t)type;
- (void)setChangeType:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NSCKExportedObject

+ (NSString)entityPath
{
  v2 = (void *)NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace]( &OBJC_CLASS___PFCloudKitMetadataModel,  "ancillaryModelNamespace");
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

- (unint64_t)type
{
  return objc_msgSend((id)-[NSCKExportedObject typeNum](self, "typeNum"), "unsignedIntegerValue");
}

- (void)setType:(unint64_t)a3
{
}

- (int64_t)changeType
{
  return objc_msgSend((id)-[NSCKExportedObject changeTypeNum](self, "changeTypeNum"), "unsignedIntegerValue");
}

- (void)setChangeType:(int64_t)a3
{
}

@end