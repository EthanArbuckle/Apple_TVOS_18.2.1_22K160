@interface TVSSPrivacyState
- (BOOL)hasActiveIndicator;
- (BOOL)hasActiveIndicatorAtDisplayPosition:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSLocationIndicator)locationIndicator;
- (TVSSPrivacyState)init;
- (TVSSPrivacyState)initWithMenuMode:(unint64_t)a3 recordingIndicator:(id)a4 locationIndicator:(id)a5;
- (TVSSRecordingIndicator)recordingIndicator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)mode;
@end

@implementation TVSSPrivacyState

- (TVSSPrivacyState)init
{
  v4 = 0LL;
  v4 = -[TVSSPrivacyState initWithMenuMode:recordingIndicator:locationIndicator:]( self,  "initWithMenuMode:recordingIndicator:locationIndicator:",  0LL,  0LL);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVSSPrivacyState)initWithMenuMode:(unint64_t)a3 recordingIndicator:(id)a4 locationIndicator:(id)a5
{
  v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  v5 = v14;
  v14 = 0LL;
  v9.receiver = v5;
  v9.super_class = (Class)&OBJC_CLASS___TVSSPrivacyState;
  v14 = -[TVSSPrivacyState init](&v9, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v14->_mode = v12;
    objc_storeStrong((id *)&v14->_recordingIndicator, location);
    objc_storeStrong((id *)&v14->_locationIndicator, v10);
  }

  v7 = v14;
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v7;
}

- (BOOL)hasActiveIndicator
{
  v3 = -[TVSSPrivacyState recordingIndicator](self, "recordingIndicator");
  char v5 = 0;
  BOOL v4 = 1;
  if (!v3)
  {
    v6 = -[TVSSPrivacyState locationIndicator](self, "locationIndicator");
    char v5 = 1;
    BOOL v4 = v6 != 0LL;
  }

  if ((v5 & 1) != 0) {

  }
  return v4;
}

- (BOOL)hasActiveIndicatorAtDisplayPosition:(int64_t)a3
{
  v6 = -[TVSSPrivacyState recordingIndicator](self, "recordingIndicator");
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  if (!v6
    || (unint64_t v12 = -[TVSSPrivacyState recordingIndicator](self, "recordingIndicator"),
        char v11 = 1,
        char v5 = 1,
        -[TVSSRecordingIndicator displayLocation](v12, "displayLocation") != a3))
  {
    id v10 = -[TVSSPrivacyState locationIndicator](self, "locationIndicator");
    char v9 = 1;
    BOOL v4 = 0;
    if (v10)
    {
      v8 = -[TVSSPrivacyState locationIndicator](self, "locationIndicator");
      char v7 = 1;
      BOOL v4 = -[TVSSLocationIndicator displayLocation](v8, "displayLocation") == a3;
    }

    char v5 = v4;
  }

  if ((v7 & 1) != 0) {

  }
  if ((v9 & 1) != 0) {
  if ((v11 & 1) != 0)
  }

  return v5 & 1;
}

- (BOOL)isEqual:(id)a3
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v35 == location[0])
  {
    char v36 = 1;
    int v33 = 1;
  }

  else
  {
    id v32 = location[0];
    v31 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v32,  objc_opt_class(&OBJC_CLASS___TVSSPrivacyState));
    v8 = v31;
    unint64_t mode = v35->_mode;
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_10003E2FC;
    v29 = &unk_1001B76F0;
    id v30 = v32;
    id v3 = -[BSEqualsBuilder appendUnsignedInteger:counterpart:](v8, "appendUnsignedInteger:counterpart:", mode, &v25);
    id v10 = v31;
    recordingIndicator = v35->_recordingIndicator;
    v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_10003E320;
    v23 = &unk_1001B60F8;
    id v24 = v32;
    id v4 = -[BSEqualsBuilder appendObject:counterpart:](v10, "appendObject:counterpart:", recordingIndicator, &v19);
    unint64_t v12 = v31;
    locationIndicator = v35->_locationIndicator;
    SEL v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_10003E344;
    v17 = &unk_1001B60F8;
    id v18 = v32;
    id v5 = -[BSEqualsBuilder appendObject:counterpart:](v12, "appendObject:counterpart:", locationIndicator, &v13);
    char v36 = -[BSEqualsBuilder isEqual](v31, "isEqual") & 1;
    int v33 = 1;
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v24, 0LL);
    objc_storeStrong(&v30, 0LL);
    objc_storeStrong((id *)&v31, 0LL);
    objc_storeStrong(&v32, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v36 & 1;
}

- (unint64_t)hash
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v7[0] appendUnsignedInteger:v8->_mode];
  id v3 = [v7[0] appendObject:v8->_recordingIndicator];
  id v4 = [v7[0] appendObject:v8->_locationIndicator];
  id v6 = [v7[0] hash];
  objc_storeStrong(v7, 0LL);
  return (unint64_t)v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSPrivacyState succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSPrivacyState descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)succinctDescription
{
  id v3 = -[TVSSPrivacyState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  unint64_t v12 = self;
  v11[1] = (id)a2;
  v11[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 = objc_msgSend(v11[0], "appendUnsignedInteger:withName:", -[TVSSPrivacyState mode](v12, "mode"), @"mode");
  id v6 = v11[0];
  char v7 = -[TVSSPrivacyState recordingIndicator](v12, "recordingIndicator");
  id v3 = objc_msgSend(v6, "appendObject:withName:skipIfNil:");

  id v8 = v11[0];
  char v9 = -[TVSSPrivacyState locationIndicator](v12, "locationIndicator");
  id v4 = objc_msgSend(v8, "appendObject:withName:skipIfNil:");

  id v10 = v11[0];
  objc_storeStrong(v11, 0LL);
  return v10;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSPrivacyState descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSPrivacyState succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)stateDumpBuilder
{
  int v14 = self;
  v13[1] = (id)a2;
  v13[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v6 = v13[0];
  id v7 = TVSSMenuModeDescription(-[TVSSPrivacyState mode](v14, "mode"));
  id v2 = objc_msgSend(v6, "appendString:withKey:");

  id v8 = v13[0];
  char v9 = -[TVSSPrivacyState recordingIndicator](v14, "recordingIndicator");
  id v3 = objc_msgSend(v8, "appendObject:withKey:");

  id v10 = v13[0];
  char v11 = -[TVSSPrivacyState locationIndicator](v14, "locationIndicator");
  id v4 = objc_msgSend(v10, "appendObject:withKey:");

  id v12 = v13[0];
  objc_storeStrong(v13, 0LL);
  return v12;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (TVSSRecordingIndicator)recordingIndicator
{
  return self->_recordingIndicator;
}

- (TVSSLocationIndicator)locationIndicator
{
  return self->_locationIndicator;
}

- (void).cxx_destruct
{
}

@end