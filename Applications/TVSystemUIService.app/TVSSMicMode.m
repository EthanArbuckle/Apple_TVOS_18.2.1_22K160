@interface TVSSMicMode
+ (id)modeForAVMode:(int64_t)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 coordinator:(id)a7;
+ (id)modeForAVMode:(int64_t)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 enabledSystemImageName:(id)a7 coordinator:(id)a8;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (BOOL)isUnavailable;
- (NSString)description;
- (NSString)displayName;
- (NSString)enabledSystemImageName;
- (NSString)systemImageName;
- (TVSSMicMode)initWithMicMode:(int64_t)a3 displayName:(id)a4 systemImageName:(id)a5 enabledSystemImageName:(id)a6 isEnabled:(BOOL)a7 isSupported:(BOOL)a8 isUnavailable:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)avMode;
- (unint64_t)hash;
- (void)setAvMode:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSupported:(BOOL)a3;
- (void)setUnavailable:(BOOL)a3;
@end

@implementation TVSSMicMode

+ (id)modeForAVMode:(int64_t)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 coordinator:(id)a7
{
  id v18 = a1;
  SEL v17 = a2;
  int64_t v16 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v14 = 0LL;
  objc_storeStrong(&v14, a5);
  id v13 = 0LL;
  objc_storeStrong(&v13, a6);
  id v12 = 0LL;
  objc_storeStrong(&v12, a7);
  id v11 =  [v18 modeForAVMode:v16 cameraAppBundleID:location displayName:v14 systemImageName:v13 enabledSystemImageName:0 coordinator:v12];
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&location, 0LL);
  return v11;
}

+ (id)modeForAVMode:(int64_t)a3 cameraAppBundleID:(id)a4 displayName:(id)a5 systemImageName:(id)a6 enabledSystemImageName:(id)a7 coordinator:(id)a8
{
  id v26 = a1;
  SEL v25 = a2;
  int64_t v24 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v22 = 0LL;
  objc_storeStrong(&v22, a5);
  id v21 = 0LL;
  objc_storeStrong(&v21, a6);
  id v20 = 0LL;
  objc_storeStrong(&v20, a7);
  id v19 = 0LL;
  objc_storeStrong(&v19, a8);
  char v18 = [v19 isModeEnabled:v24 forBundleID:location] & 1;
  char v17 = [v19 isModeSupported:v24 forBundleID:location] & 1;
  char v16 = [v19 isModeUnavailable:v24 forBundleID:location] & 1;
  v8 = objc_alloc(&OBJC_CLASS___TVSSMicMode);
  LOBYTE(v10) = v16 & 1;
  v15 = -[TVSSMicMode initWithMicMode:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:]( v8,  "initWithMicMode:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:",  v24,  v22,  v21,  v20,  v18 & 1,  v17 & 1,  v10);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&location, 0LL);
  return v15;
}

- (TVSSMicMode)initWithMicMode:(int64_t)a3 displayName:(id)a4 systemImageName:(id)a5 enabledSystemImageName:(id)a6 isEnabled:(BOOL)a7 isSupported:(BOOL)a8 isUnavailable:(BOOL)a9
{
  v31 = self;
  SEL v30 = a2;
  int64_t v29 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  id v26 = 0LL;
  objc_storeStrong(&v26, a6);
  BOOL v25 = a7;
  BOOL v24 = a8;
  BOOL v23 = a9;
  v9 = v31;
  v31 = 0LL;
  v22.receiver = v9;
  v22.super_class = (Class)&OBJC_CLASS___TVSSMicMode;
  v31 = -[TVSSMicMode init](&v22, "init");
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v31->_avMode = v29;
    uint64_t v10 = (NSString *)[location copy];
    displayName = v31->_displayName;
    v31->_displayName = v10;

    id v12 = (NSString *)[v27 copy];
    systemImageName = v31->_systemImageName;
    v31->_systemImageName = v12;

    id v14 = (NSString *)[v26 copy];
    enabledSystemImageName = v31->_enabledSystemImageName;
    v31->_enabledSystemImageName = v14;

    v31->_enabled = v25;
    v31->_supported = v24;
    v31->_unavailable = v23;
  }

  char v17 = v31;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0] == v70)
  {
    char v71 = 1;
    int v68 = 1;
  }

  else
  {
    v67 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  location[0],  objc_opt_class(&OBJC_CLASS___TVSSMicMode));
    id v12 = v67;
    int64_t avMode = v70->_avMode;
    v61 = _NSConcreteStackBlock;
    int v62 = -1073741824;
    int v63 = 0;
    v64 = sub_10006A60C;
    v65 = &unk_1001B7550;
    id v66 = location[0];
    id v3 = -[BSEqualsBuilder appendInteger:counterpart:](v12, "appendInteger:counterpart:", avMode, &v61);
    id v14 = v67;
    displayName = v70->_displayName;
    v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_10006A63C;
    v59 = &unk_1001B6610;
    id v60 = location[0];
    id v4 = -[BSEqualsBuilder appendString:counterpart:](v14, "appendString:counterpart:", displayName, &v55);
    char v16 = v67;
    systemImageName = v70->_systemImageName;
    v49 = _NSConcreteStackBlock;
    int v50 = -1073741824;
    int v51 = 0;
    v52 = sub_10006A66C;
    v53 = &unk_1001B6610;
    id v54 = location[0];
    id v5 = -[BSEqualsBuilder appendString:counterpart:](v16, "appendString:counterpart:", systemImageName, &v49);
    char v18 = v67;
    enabledSystemImageName = v70->_enabledSystemImageName;
    v43 = _NSConcreteStackBlock;
    int v44 = -1073741824;
    int v45 = 0;
    v46 = sub_10006A69C;
    v47 = &unk_1001B6610;
    id v48 = location[0];
    id v6 = -[BSEqualsBuilder appendString:counterpart:](v18, "appendString:counterpart:", enabledSystemImageName, &v43);
    id v20 = v67;
    BOOL enabled = v70->_enabled;
    v37 = _NSConcreteStackBlock;
    int v38 = -1073741824;
    int v39 = 0;
    v40 = sub_10006A6CC;
    v41 = &unk_1001B7A30;
    id v42 = location[0];
    id v7 = -[BSEqualsBuilder appendBool:counterpart:](v20, "appendBool:counterpart:", enabled, &v37);
    objc_super v22 = v67;
    BOOL supported = v70->_supported;
    v31 = _NSConcreteStackBlock;
    int v32 = -1073741824;
    int v33 = 0;
    v34 = sub_10006A700;
    v35 = &unk_1001B7A30;
    id v36 = location[0];
    id v8 = -[BSEqualsBuilder appendBool:counterpart:](v22, "appendBool:counterpart:", supported, &v31);
    BOOL v24 = v67;
    BOOL unavailable = v70->_unavailable;
    BOOL v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_10006A734;
    int64_t v29 = &unk_1001B7A30;
    id v30 = location[0];
    id v9 = -[BSEqualsBuilder appendBool:counterpart:](v24, "appendBool:counterpart:", unavailable, &v25);
    char v71 = -[BSEqualsBuilder isEqual](v67, "isEqual") & 1;
    int v68 = 1;
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_storeStrong(&v48, 0LL);
    objc_storeStrong(&v54, 0LL);
    objc_storeStrong(&v60, 0LL);
    objc_storeStrong(&v66, 0LL);
    objc_storeStrong((id *)&v67, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v71 & 1;
}

- (unint64_t)hash
{
  id v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(&OBJC_CLASS___BSHashBuilder);
  id v2 = [v11[0] appendInteger:v12->_avMode];
  id v3 = [v11[0] appendString:v12->_displayName];
  id v4 = [v11[0] appendString:v12->_systemImageName];
  id v5 = [v11[0] appendString:v12->_enabledSystemImageName];
  id v6 = [v11[0] appendBool:v12->_enabled];
  id v7 = [v11[0] appendBool:v12->_supported];
  id v8 = [v11[0] appendBool:v12->_unavailable];
  id v10 = [v11[0] hash];
  objc_storeStrong(v11, 0LL);
  return (unint64_t)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[TVSSMicMode allocWithZone:](&OBJC_CLASS___TVSSMicMode, "allocWithZone:", a3);
  LOBYTE(v5) = self->_unavailable;
  return -[TVSSMicMode initWithMicMode:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:]( v3,  "initWithMicMode:displayName:systemImageName:enabledSystemImageName:isEnabled:isSupported:isUnavailable:",  self->_avMode,  self->_displayName,  self->_systemImageName,  self->_enabledSystemImageName,  self->_enabled,  self->_supported,  v5);
}

- (NSString)description
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = [v7[0] appendInteger:v8->_avMode withName:@"AVMicrophoneMode"];
  id v3 = [v7[0] appendBool:v8->_enabled withName:@"isEnabled" ifEqualTo:1];
  id v4 = [v7[0] appendBool:v8->_supported withName:@"isSupported" ifEqualTo:1];
  id v6 = [v7[0] build];
  objc_storeStrong(v7, 0LL);
  return (NSString *)v6;
}

- (int64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(int64_t)a3
{
  self->_int64_t avMode = a3;
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

- (void).cxx_destruct
{
}

@end