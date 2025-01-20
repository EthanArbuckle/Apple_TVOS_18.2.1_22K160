@interface CKReference
- (CKReference)initWithCPLArchiver:(id)a3;
@end

@implementation CKReference

- (CKReference)initWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(CKRecordID) forKey:@"recordID"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeIntegerForKey:@"referenceAction"];

  v8 = -[CKReference initWithRecordID:action:](self, "initWithRecordID:action:", v6, v7);
  return v8;
}

@end