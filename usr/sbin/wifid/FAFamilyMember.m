@interface FAFamilyMember
- (id)wifiDisplayName;
@end

@implementation FAFamilyMember

- (id)wifiDisplayName
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
  -[NSPersonNameComponents setGivenName:](v3, "setGivenName:", -[FAFamilyMember firstName](self, "firstName"));
  -[NSPersonNameComponents setFamilyName:](v3, "setFamilyName:", -[FAFamilyMember lastName](self, "lastName"));
  v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:style:options:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "localizedStringFromPersonNameComponents:style:options:",  v3,  0LL,  0LL);

  return v4;
}

@end