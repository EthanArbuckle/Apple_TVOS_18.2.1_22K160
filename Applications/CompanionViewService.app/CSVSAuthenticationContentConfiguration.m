@interface CSVSAuthenticationContentConfiguration
+ (CSVSAuthenticationContentConfiguration)appSignInConfiguration;
+ (CSVSAuthenticationContentConfiguration)learnMoreConfiguration;
+ (CSVSAuthenticationContentConfiguration)restrictedAccessConfiguration;
+ (CSVSAuthenticationContentConfiguration)sharingConfiguration;
+ (CSVSAuthenticationContentConfiguration)storeAuthenticationConfiguration;
+ (CSVSAuthenticationContentConfiguration)systemSignInConfiguration;
+ (CSVSAuthenticationContentConfiguration)tvProviderConfiguration;
- (CSVSAuthenticationContentImageProperties)imageProperties;
- (NSString)bodyText;
- (NSString)titleText;
- (UIImage)image;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBodyText:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageWithSystemImageName:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation CSVSAuthenticationContentConfiguration

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationContentConfiguration;
  v2 = -[CSVSAuthenticationContentConfiguration init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationContentImageProperties);
    imageProperties = v2->_imageProperties;
    v2->_imageProperties = v3;
  }

  return v2;
}

+ (CSVSAuthenticationContentConfiguration)systemSignInConfiguration
{
  return (CSVSAuthenticationContentConfiguration *) -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
}

+ (CSVSAuthenticationContentConfiguration)appSignInConfiguration
{
  id v2 = -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProperties]);
  objc_msgSend(v3, "setSize:", *(double *)&v6[2], *(double *)&v6[3]);
  [v3 setCornerRadius:*(double *)&v6[4]];
  [v3 setShadowRadius:12.0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 4.0);
  [v3 setShadowOpacity:0.4];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  [v3 setShadowColor:v4];

  return (CSVSAuthenticationContentConfiguration *)v2;
}

+ (CSVSAuthenticationContentConfiguration)sharingConfiguration
{
  id v2 = -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProperties]);
  [v3 setContentMode:1];
  [v3 setShadowRadius:60.0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 10.0);
  [v3 setShadowOpacity:0.6];
  objc_msgSend(v3, "setSize:", 800.0, 400.0);

  return (CSVSAuthenticationContentConfiguration *)v2;
}

+ (CSVSAuthenticationContentConfiguration)learnMoreConfiguration
{
  id v2 = -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProperties]);
  [v3 setContentMode:1];
  [v3 setShadowRadius:60.0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 10.0);
  [v3 setShadowOpacity:0.6];
  objc_msgSend(v3, "setSize:", 800.0, 400.0);

  return (CSVSAuthenticationContentConfiguration *)v2;
}

+ (CSVSAuthenticationContentConfiguration)restrictedAccessConfiguration
{
  return (CSVSAuthenticationContentConfiguration *) -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
}

+ (CSVSAuthenticationContentConfiguration)storeAuthenticationConfiguration
{
  return (CSVSAuthenticationContentConfiguration *) -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
}

+ (CSVSAuthenticationContentConfiguration)tvProviderConfiguration
{
  return (CSVSAuthenticationContentConfiguration *) -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
}

- (void)setImageWithSystemImageName:(id)a3
{
  if (a3)
  {
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:"));
    image = self->_image;
    self->_image = v4;
  }

  else
  {
    image = self->_image;
    self->_image = 0LL;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[CSVSAuthenticationContentConfiguration _init]( objc_alloc(&OBJC_CLASS___CSVSAuthenticationContentConfiguration),  "_init");
  [v4 setImage:self->_image];
  [v4 setTitleText:self->_titleText];
  [v4 setBodyText:self->_bodyText];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 imageProperties]);
  -[CSVSAuthenticationContentImageProperties size](self->_imageProperties, "size");
  objc_msgSend(v5, "setSize:");
  -[CSVSAuthenticationContentImageProperties cornerRadius](self->_imageProperties, "cornerRadius");
  objc_msgSend(v5, "setCornerRadius:");
  -[CSVSAuthenticationContentImageProperties shadowRadius](self->_imageProperties, "shadowRadius");
  objc_msgSend(v5, "setShadowRadius:");
  -[CSVSAuthenticationContentImageProperties shadowOffset](self->_imageProperties, "shadowOffset");
  objc_msgSend(v5, "setShadowOffset:");
  -[CSVSAuthenticationContentImageProperties shadowOpacity](self->_imageProperties, "shadowOpacity");
  objc_msgSend(v5, "setShadowOpacity:");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSVSAuthenticationContentImageProperties shadowColor](self->_imageProperties, "shadowColor"));
  [v5 setShadowColor:v6];

  objc_msgSend( v5,  "setContentMode:",  -[CSVSAuthenticationContentImageProperties contentMode](self->_imageProperties, "contentMode"));
  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CSVSAuthenticationContentImageProperties)imageProperties
{
  return self->_imageProperties;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end