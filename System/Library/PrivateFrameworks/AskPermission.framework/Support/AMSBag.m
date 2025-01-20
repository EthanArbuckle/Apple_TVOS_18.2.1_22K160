@interface AMSBag
+ (id)sharedBag;
- (AMSBagValue)countryCode;
- (AMSBagValue)localeIdentifier;
- (AMSBagValue)retrieveRequestURL;
- (AMSBagValue)updateRequestURL;
@end

@implementation AMSBag

+ (id)sharedBag
{
  return +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"AskPermission",  @"1");
}

- (AMSBagValue)countryCode
{
  return (AMSBagValue *)-[AMSBag stringForKey:](self, "stringForKey:", @"countryCode");
}

- (AMSBagValue)localeIdentifier
{
  return (AMSBagValue *)-[AMSBag stringForKey:](self, "stringForKey:", @"language-tag");
}

- (AMSBagValue)retrieveRequestURL
{
  return (AMSBagValue *)-[AMSBag URLForKey:](self, "URLForKey:", @"familyPermissionGetRequestInfoSrv");
}

- (AMSBagValue)updateRequestURL
{
  return (AMSBagValue *)-[AMSBag URLForKey:](self, "URLForKey:", @"familyPermissionUpdateRequestSrv");
}

@end