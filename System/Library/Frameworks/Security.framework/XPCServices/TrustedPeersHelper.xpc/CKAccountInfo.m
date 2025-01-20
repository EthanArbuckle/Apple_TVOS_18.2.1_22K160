@interface CKAccountInfo
- (id)description;
@end

@implementation CKAccountInfo

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKAccountInfo CKPropertiesDescription](self, "CKPropertiesDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKAccountInfo: %@>",  v2));

  return v3;
}

@end