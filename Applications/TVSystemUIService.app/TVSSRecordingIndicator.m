@interface TVSSRecordingIndicator
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initRecordingIndicatorWithDisplayLocation:(int64_t)a3 recordingType:(int64_t)a4;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)displayLocation;
- (int64_t)recordingType;
- (unint64_t)hash;
@end

@implementation TVSSRecordingIndicator

- (id)initRecordingIndicatorWithDisplayLocation:(int64_t)a3 recordingType:(int64_t)a4
{
  SEL v9 = a2;
  int64_t v8 = a3;
  int64_t v7 = a4;
  v10 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSRecordingIndicator;
  v10 = -[TVSSRecordingIndicator init](&v6, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v10->_displayLocation = v8;
    v10->_recordingType = v7;
  }

  v5 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v26 == location[0])
  {
    char v27 = 1;
    int v24 = 1;
  }

  else
  {
    id v23 = location[0];
    v22 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v23,  objc_opt_class(&OBJC_CLASS___TVSSRecordingIndicator));
    int64_t v7 = v22;
    int64_t displayLocation = v26->_displayLocation;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_1000388CC;
    v20 = &unk_1001B7550;
    id v21 = v23;
    id v3 = -[BSEqualsBuilder appendInteger:counterpart:](v7, "appendInteger:counterpart:", displayLocation, &v16);
    SEL v9 = v22;
    int64_t recordingType = v26->_recordingType;
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_1000388F0;
    v14 = &unk_1001B7550;
    id v15 = v23;
    id v4 = -[BSEqualsBuilder appendInteger:counterpart:](v9, "appendInteger:counterpart:", recordingType, &v10);
    char v27 = -[BSEqualsBuilder isEqual](v22, "isEqual") & 1;
    int v24 = 1;
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v27 & 1;
}

- (unint64_t)hash
{
  int64_t v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v6[0] appendInteger:v7->_displayLocation];
  id v3 = [v6[0] appendInteger:v7->_recordingType];
  id v5 = [v6[0] hash];
  objc_storeStrong(v6, 0LL);
  return (unint64_t)v5;
}

- (NSString)description
{
  return (NSString *)-[TVSSRecordingIndicator succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSRecordingIndicator descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)succinctDescription
{
  id v3 = -[TVSSRecordingIndicator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  int64_t v7 = self;
  v6[1] = (id)a2;
  v6[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v2 =  objc_msgSend( v6[0],  "appendInteger:withName:",  -[TVSSRecordingIndicator displayLocation](v7, "displayLocation"),  @"displayLocation");
  id v3 =  objc_msgSend( v6[0],  "appendInteger:withName:",  -[TVSSRecordingIndicator recordingType](v7, "recordingType"),  @"recordingType");
  id v5 = v6[0];
  objc_storeStrong(v6, 0LL);
  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSRecordingIndicator descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  int64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSRecordingIndicator succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  [v5 setActiveMultilinePrefix:location[0]];
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)stateDumpBuilder
{
  int v11 = self;
  v10[1] = (id)a2;
  v10[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v5 = v10[0];
  objc_super v6 = TVSSPrivacyIndicatorDisplayLocationDescription(-[TVSSRecordingIndicator displayLocation](v11, "displayLocation"));
  id v2 = objc_msgSend(v5, "appendString:withKey:");

  id v7 = v10[0];
  int64_t v8 = TVSSRecordingTypeDescription(-[TVSSRecordingIndicator recordingType](v11, "recordingType"));
  id v3 = objc_msgSend(v7, "appendString:withKey:");

  id v9 = v10[0];
  objc_storeStrong(v10, 0LL);
  return v9;
}

- (int64_t)displayLocation
{
  return self->_displayLocation;
}

- (int64_t)recordingType
{
  return self->_recordingType;
}

@end