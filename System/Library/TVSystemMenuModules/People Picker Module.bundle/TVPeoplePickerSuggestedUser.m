@interface TVPeoplePickerSuggestedUser
- (NSPersonNameComponents)nameComponents;
- (NSString)altDSID;
- (NSString)identifier;
- (TVPeoplePickerSuggestedUser)initWithSuggestedUserProfile:(id)a3;
- (UIImage)profileImage;
- (void)setProfileImage:(id)a3;
@end

@implementation TVPeoplePickerSuggestedUser

- (TVPeoplePickerSuggestedUser)initWithSuggestedUserProfile:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v15;
  v15 = 0LL;
  v13.receiver = v3;
  v13.super_class = (Class)&OBJC_CLASS___TVPeoplePickerSuggestedUser;
  v12 = -[TVPeoplePickerSuggestedUser init](&v13, "init");
  v15 = v12;
  objc_storeStrong((id *)&v15, v12);
  if (v12)
  {
    v4 = (NSString *)[location[0] identifier];
    identifier = v15->_identifier;
    v15->_identifier = v4;

    v6 = (NSString *)[location[0] altDSID];
    altDSID = v15->_altDSID;
    v15->_altDSID = v6;

    v8 = (NSPersonNameComponents *)[location[0] nameComponents];
    nameComponents = v15->_nameComponents;
    v15->_nameComponents = v8;
  }

  v11 = v15;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (UIImage)profileImage
{
  return self->_profileImage;
}

- (void)setProfileImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end