@interface CXCallDTMFUpdate
- (id)tuCallDTMFUpdate;
@end

@implementation CXCallDTMFUpdate

- (id)tuCallDTMFUpdate
{
  id v3 = objc_alloc(&OBJC_CLASS___TUCallDTMFUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallDTMFUpdate digits](self, "digits"));
  id v5 = [v3 initWithDigits:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CXCallDTMFUpdate UUID](self, "UUID"));
  [v5 setUUID:v6];

  return v5;
}

@end