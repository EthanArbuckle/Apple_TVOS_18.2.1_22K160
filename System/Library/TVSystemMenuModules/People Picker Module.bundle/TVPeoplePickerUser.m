@interface TVPeoplePickerUser
- (NSPersonNameComponents)personNameComponents;
- (NSString)firstName;
- (NSString)formattedShortName;
- (NSString)identifier;
- (NSString)lastName;
- (PBSUserProfile)userProfile;
- (TVPeoplePickerUser)initWithUserProfile:(id)a3;
- (UIImage)profilePhoto;
- (void)setFirstName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastName:(id)a3;
- (void)setProfilePhoto:(id)a3;
- (void)setUserProfile:(id)a3;
@end

@implementation TVPeoplePickerUser

- (TVPeoplePickerUser)initWithUserProfile:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0LL;
  v14.receiver = v3;
  v14.super_class = (Class)&OBJC_CLASS___TVPeoplePickerUser;
  v16 = -[TVPeoplePickerUser init](&v14, "init");
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    id v4 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountInfo);
    id v13 = [v4 initWithUserProfile:location[0]];
    objc_storeStrong((id *)&v16->_userProfile, location[0]);
    v5 = (NSString *)[location[0] identifier];
    identifier = v16->_identifier;
    v16->_identifier = v5;

    v7 = (NSPersonNameComponents *)[v13 personNameComponents];
    personNameComponents = v16->_personNameComponents;
    v16->_personNameComponents = v7;

    v9 = (NSString *)[v13 formattedShortName];
    formattedShortName = v16->_formattedShortName;
    v16->_formattedShortName = v9;

    objc_storeStrong(&v13, 0LL);
  }

  v12 = v16;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (NSString)formattedShortName
{
  return self->_formattedShortName;
}

- (UIImage)profilePhoto
{
  return self->_profilePhoto;
}

- (void)setProfilePhoto:(id)a3
{
}

- (PBSUserProfile)userProfile
{
  return self->_userProfile;
}

- (void)setUserProfile:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end