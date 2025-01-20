@interface TVSSUserImageContent
+ (double)defaultUserImageDiameter;
- (Class)preferredVisualizerViewClass;
- (NSPersonNameComponents)personNameComponents;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSUserImageContent)initWithUserImage:(id)a3 personNameComponents:(id)a4;
- (UIImage)userImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation TVSSUserImageContent

- (TVSSUserImageContent)initWithUserImage:(id)a3 personNameComponents:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSUserImageContent;
  v13 = -[TVSSUserImageContent init](&v10, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_userImage, location[0]);
    v5 = (NSPersonNameComponents *)[v11 copy];
    personNameComponents = v13->_personNameComponents;
    v13->_personNameComponents = v5;
  }

  v8 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v8;
}

+ (double)defaultUserImageDiameter
{
  return result;
}

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSUserImageContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)succinctDescription
{
  id v3 = -[TVSSUserImageContent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  v9 = (dispatch_once_t *)&unk_100221970;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B6BF8);
  if (*v9 != -1) {
    dispatch_once(v9, location);
  }
  objc_storeStrong(&location, 0LL);
  id v2 = [v6[0] appendPointer:v7->_userImage withName:@"userImage"];
  if (v7->_personNameComponents)
  {
    id v5 = [(id)qword_100221968 stringFromPersonNameComponents:v7->_personNameComponents];
    [v6[0] appendString:v5 withName:@"initials"];
    objc_storeStrong(&v5, 0LL);
  }

  id v4 = v6[0];
  objc_storeStrong(v6, 0LL);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSUserImageContent descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = -[TVSSUserImageContent succinctDescriptionBuilder](v8, "succinctDescriptionBuilder");
  [v6 setActiveMultilinePrefix:location[0]];
  id v3 = [v6 appendObject:v8->_personNameComponents withName:@"personNameComponents"];
  id v5 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (NSString)description
{
  return (NSString *)-[TVSSUserImageContent succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSUserImageContent descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (UIImage)userImage
{
  return self->_userImage;
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (void).cxx_destruct
{
}

@end