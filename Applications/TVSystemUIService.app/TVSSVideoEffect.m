@interface TVSSVideoEffect
+ (id)effectForAVEffect:(id)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 coordinator:(id)a7;
+ (id)effectForAVEffect:(id)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 enabledSystemImageName:(id)a7 coordinator:(id)a8;
- (BOOL)contentIsDisabled;
- (BOOL)contentIsSelected;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (BOOL)isUnavailable;
- (NSString)contentText1;
- (NSString)contentTitle;
- (NSString)description;
- (NSString)displayName;
- (NSString)enabledSystemImageName;
- (NSString)identifier;
- (NSString)systemImageName;
- (TVSSVideoEffect)initWithIdentifier:(id)a3 displayName:(id)a4 systemImageName:(id)a5 enabledSystemImageName:(id)a6 isEnabled:(BOOL)a7 isSupported:(BOOL)a8 isUnavailable:(BOOL)a9 controlMode:(int64_t)a10;
- (UIImage)contentImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)controlMode;
- (unint64_t)hash;
- (void)setControlMode:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setUnavailable:(BOOL)a3;
@end

@implementation TVSSVideoEffect

+ (id)effectForAVEffect:(id)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 coordinator:(id)a7
{
  id v18 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = 0LL;
  objc_storeStrong(&v14, a6);
  id v13 = 0LL;
  objc_storeStrong(&v13, a7);
  id v12 =  [v18 effectForAVEffect:location[0] cameraAppBundleID:v16 displayName:v15 systemImageName:v14 enabledSystemImageName:0 coordinator:v13];
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

+ (id)effectForAVEffect:(id)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 enabledSystemImageName:(id)a7 coordinator:(id)a8
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v25 = 0LL;
  objc_storeStrong(&v25, a4);
  id v24 = 0LL;
  objc_storeStrong(&v24, a5);
  id v23 = 0LL;
  objc_storeStrong(&v23, a6);
  id v22 = 0LL;
  objc_storeStrong(&v22, a7);
  id v21 = 0LL;
  objc_storeStrong(&v21, a8);
  char v20 = [v21 isEffectEnabled:location[0] forBundleID:v25] & 1;
  char v19 = [v21 isEffectSupported:location[0] forBundleID:v25] & 1;
  char v18 = [v21 isEffectUnavailable:location[0] forBundleID:v25] & 1;
  id v17 = [v21 effectControlMode:location[0] forBundleID:v25];
  v8 = objc_alloc(&OBJC_CLASS___TVSSVideoEffect);
  LOBYTE(v10) = v18 & 1;
  id v16 = -[TVSSVideoEffect initWithIdentifier:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:controlMode:]( v8,  "initWithIdentifier:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:controlMode:",  location[0],  v24,  v23,  v22,  v20 & 1,  v19 & 1,  v10,  v17);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

- (TVSSVideoEffect)initWithIdentifier:(id)a3 displayName:(id)a4 systemImageName:(id)a5 enabledSystemImageName:(id)a6 isEnabled:(BOOL)a7 isSupported:(BOOL)a8 isUnavailable:(BOOL)a9 controlMode:(int64_t)a10
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v33 = 0LL;
  objc_storeStrong(&v33, a4);
  id v32 = 0LL;
  objc_storeStrong(&v32, a5);
  id v31 = 0LL;
  objc_storeStrong(&v31, a6);
  BOOL v30 = a7;
  BOOL v29 = a8;
  BOOL v28 = a9;
  int64_t v27 = a10;
  uint64_t v10 = v35;
  v35 = 0LL;
  v26.receiver = v10;
  v26.super_class = (Class)&OBJC_CLASS___TVSSVideoEffect;
  v35 = -[TVSSVideoEffect init](&v26, "init");
  objc_storeStrong((id *)&v35, v35);
  if (v35)
  {
    v11 = (NSString *)[location[0] copy];
    identifier = v35->_identifier;
    v35->_identifier = v11;

    id v13 = (NSString *)[v33 copy];
    displayName = v35->_displayName;
    v35->_displayName = v13;

    id v15 = (NSString *)[v32 copy];
    systemImageName = v35->_systemImageName;
    v35->_systemImageName = v15;

    id v17 = (NSString *)[v31 copy];
    enabledSystemImageName = v35->_enabledSystemImageName;
    v35->_enabledSystemImageName = v17;

    v35->_enabled = v30;
    v35->_supported = v29;
    v35->_unavailable = v28;
    v35->_controlMode = v27;
  }

  char v20 = v35;
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v35, 0LL);
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v79)
  {
    char v80 = 1;
    int v77 = 1;
  }

  else
  {
    v76 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVSSVideoEffect));
    id v13 = v76;
    identifier = v79->_identifier;
    v70 = _NSConcreteStackBlock;
    int v71 = -1073741824;
    int v72 = 0;
    v73 = sub_100045B2C;
    v74 = &unk_1001B6610;
    id v75 = location[0];
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v13, "appendString:counterpart:", identifier, &v70);
    id v15 = v76;
    displayName = v79->_displayName;
    v64 = _NSConcreteStackBlock;
    int v65 = -1073741824;
    int v66 = 0;
    v67 = sub_100045B5C;
    v68 = &unk_1001B6610;
    id v69 = location[0];
    id v4 = -[BSEqualsBuilder appendString:counterpart:](v15, "appendString:counterpart:", displayName, &v64);
    id v17 = v76;
    systemImageName = v79->_systemImageName;
    v58 = _NSConcreteStackBlock;
    int v59 = -1073741824;
    int v60 = 0;
    v61 = sub_100045B8C;
    v62 = &unk_1001B6610;
    id v63 = location[0];
    id v5 = -[BSEqualsBuilder appendString:counterpart:](v17, "appendString:counterpart:", systemImageName, &v58);
    char v19 = v76;
    enabledSystemImageName = v79->_enabledSystemImageName;
    v52 = _NSConcreteStackBlock;
    int v53 = -1073741824;
    int v54 = 0;
    v55 = sub_100045BBC;
    v56 = &unk_1001B6610;
    id v57 = location[0];
    id v6 = -[BSEqualsBuilder appendString:counterpart:](v19, "appendString:counterpart:", enabledSystemImageName, &v52);
    id v21 = v76;
    BOOL enabled = v79->_enabled;
    v46 = _NSConcreteStackBlock;
    int v47 = -1073741824;
    int v48 = 0;
    v49 = sub_100045BEC;
    v50 = &unk_1001B7A30;
    id v51 = location[0];
    id v7 = -[BSEqualsBuilder appendBool:counterpart:](v21, "appendBool:counterpart:", enabled, &v46);
    id v23 = v76;
    BOOL supported = v79->_supported;
    v40 = _NSConcreteStackBlock;
    int v41 = -1073741824;
    int v42 = 0;
    v43 = sub_100045C20;
    v44 = &unk_1001B7A30;
    id v45 = location[0];
    id v8 = -[BSEqualsBuilder appendBool:counterpart:](v23, "appendBool:counterpart:", supported, &v40);
    id v25 = v76;
    BOOL unavailable = v79->_unavailable;
    v34 = _NSConcreteStackBlock;
    int v35 = -1073741824;
    int v36 = 0;
    v37 = sub_100045C54;
    v38 = &unk_1001B7A30;
    id v39 = location[0];
    id v9 = -[BSEqualsBuilder appendBool:counterpart:](v25, "appendBool:counterpart:", unavailable, &v34);
    int64_t v27 = v76;
    int64_t controlMode = v79->_controlMode;
    BOOL v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    id v31 = sub_100045C88;
    id v32 = &unk_1001B7550;
    id v33 = location[0];
    id v10 = -[BSEqualsBuilder appendInteger:counterpart:](v27, "appendInteger:counterpart:", controlMode, &v28);
    char v80 = -[BSEqualsBuilder isEqual](v76, "isEqual") & 1;
    int v77 = 1;
    objc_storeStrong(&v33, 0LL);
    objc_storeStrong(&v39, 0LL);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v51, 0LL);
    objc_storeStrong(&v57, 0LL);
    objc_storeStrong(&v63, 0LL);
    objc_storeStrong(&v69, 0LL);
    objc_storeStrong(&v75, 0LL);
    objc_storeStrong((id *)&v76, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v80 & 1;
}

- (unint64_t)hash
{
  id v13 = self;
  v12[1] = (id)a2;
  v12[0] = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v2 = [v12[0] appendString:v13->_identifier];
  id v3 = [v12[0] appendString:v13->_displayName];
  id v4 = [v12[0] appendString:v13->_systemImageName];
  id v5 = [v12[0] appendString:v13->_enabledSystemImageName];
  id v6 = [v12[0] appendBool:v13->_enabled];
  id v7 = [v12[0] appendBool:v13->_supported];
  id v8 = [v12[0] appendBool:v13->_unavailable];
  id v9 = [v12[0] appendInteger:v13->_controlMode];
  id v11 = [v12[0] hash];
  objc_storeStrong(v12, 0LL);
  return (unint64_t)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[TVSSVideoEffect allocWithZone:](&OBJC_CLASS___TVSSVideoEffect, "allocWithZone:", a3);
  LOBYTE(v5) = self->_unavailable;
  return -[TVSSVideoEffect initWithIdentifier:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:controlMode:]( v3,  "initWithIdentifier:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:controlMode:",  self->_identifier,  self->_displayName,  self->_systemImageName,  self->_enabledSystemImageName,  self->_enabled,  self->_supported,  v5,  self->_controlMode);
}

- (NSString)description
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v7[0] appendString:v8->_identifier withName:@"identifier"];
  id v2 = [v7[0] appendBool:v8->_enabled withName:@"isEnabled" ifEqualTo:1];
  id v3 = [v7[0] appendBool:v8->_supported withName:@"isSupported" ifEqualTo:1];
  id v4 = [v7[0] appendInteger:v8->_controlMode withName:@"controlMode"];
  id v6 = [v7[0] build];
  objc_storeStrong(v7, 0LL);
  return (NSString *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)enabledSystemImageName
{
  return self->_enabledSystemImageName;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_BOOL supported = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (BOOL)isUnavailable
{
  return self->_unavailable;
}

- (void)setUnavailable:(BOOL)a3
{
  self->_BOOL unavailable = a3;
}

- (int64_t)controlMode
{
  return self->_controlMode;
}

- (void)setControlMode:(int64_t)a3
{
  self->_int64_t controlMode = a3;
}

- (void).cxx_destruct
{
}

- (NSString)contentTitle
{
  return -[TVSSVideoEffect displayName](self, "displayName", a2, self);
}

- (NSString)contentText1
{
  char v6 = 0;
  char v4 = 0;
  if (-[TVSSVideoEffect isEnabled](self, "isEnabled"))
  {
    id v7 = (id)TVSPLocalizedString(@"ON");
    char v6 = 1;
    id v2 = v7;
  }

  else
  {
    id v5 = (id)TVSPLocalizedString(@"OFF");
    char v4 = 1;
    id v2 = v5;
  }

  id v8 = v2;
  if ((v4 & 1) != 0) {

  }
  if ((v6 & 1) != 0) {
  return (NSString *)v8;
  }
}

- (UIImage)contentImage
{
  id v13 = self;
  location[1] = (id)a2;
  id v5 = -[TVSSVideoEffect enabledSystemImageName](self, "enabledSystemImageName");
  char v10 = 0;
  char v8 = 0;
  if (v5)
  {
    id v11 = -[TVSSVideoEffect enabledSystemImageName](v13, "enabledSystemImageName");
    char v10 = 1;
    id v2 = v11;
  }

  else
  {
    id v9 = -[TVSSVideoEffect systemImageName](v13, "systemImageName");
    char v8 = 1;
    id v2 = v9;
  }

  location[0] = v2;
  if ((v8 & 1) != 0) {

  }
  if ((v10 & 1) != 0) {
  char v6 = 0;
  }
  if (-[TVSSVideoEffect isEnabled](v13, "isEnabled"))
  {
    char v4 = (NSString *)location[0];
  }

  else
  {
    id v7 = -[TVSSVideoEffect systemImageName](v13, "systemImageName");
    char v6 = 1;
    char v4 = v7;
  }

  id v14 = +[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", v4);
  if ((v6 & 1) != 0) {

  }
  objc_storeStrong(location, 0LL);
  return (UIImage *)v14;
}

- (BOOL)contentIsSelected
{
  return -[TVSSVideoEffect isEnabled](self, "isEnabled", a2, self);
}

- (BOOL)contentIsDisabled
{
  return -[TVSSVideoEffect isUnavailable](self, "isUnavailable", a2, self);
}

@end