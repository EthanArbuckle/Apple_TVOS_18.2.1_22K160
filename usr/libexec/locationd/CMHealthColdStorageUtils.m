@interface CMHealthColdStorageUtils
+ (id)getSystemFieldsFromCKRecord:(id)a3;
@end

@implementation CMHealthColdStorageUtils

+ (id)getSystemFieldsFromCKRecord:(id)a3
{
  v4 =  -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  [a3 encodeSystemFieldsWithCoder:v4];
  -[NSKeyedArchiver finishEncoding](v4, "finishEncoding");
  return -[NSKeyedArchiver encodedData](v4, "encodedData");
}

@end