@interface TUContinuitySessionContact
- (NSString)givenNameFirstSortName;
- (NSString)lastNameFirstSortName;
@end

@implementation TUContinuitySessionContact

- (NSString)lastNameFirstSortName
{
  return (NSString *)sub_100086FDC(self, (uint64_t)a2, (SEL *)&selRef_familyName, (SEL *)&selRef_givenName);
}

- (NSString)givenNameFirstSortName
{
  return (NSString *)sub_100086FDC(self, (uint64_t)a2, (SEL *)&selRef_givenName, (SEL *)&selRef_familyName);
}

@end