@interface TVSSOutputDeviceAsset
+ (id)_outputDeviceRouteProvider;
+ (void)_setOutputDeviceRouteProvider:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)symbolName;
- (TVSSOutputDeviceAsset)initWithOutputDeviceRoute:(id)a3;
- (UIImage)image;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSOutputDeviceAsset

- (TVSSOutputDeviceAsset)initWithOutputDeviceRoute:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = [location[0] outputDevices];
  id v18 =  +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v19 count]);
  memset(__b, 0, sizeof(__b));
  id obj = v19;
  id v12 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(__b[1] + 8 * v9);
      v6 = (uint64_t (**)(id, void))[(id)objc_opt_class(v21) _outputDeviceRouteProvider];
      id v15 = (id)v6[2](v6, v17);

      [v18 addObject:v15];
      objc_storeStrong(&v15, 0LL);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v14 =  +[MPAVRoutingController _symbolNameForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoutes:",  v18);
  if (!v14) {
    objc_storeStrong(&v14, TVSSOutputDeviceAssetUnknownRouteSymbolName);
  }
  v3 = v21;
  v21 = 0LL;
  v13.receiver = v3;
  v13.super_class = (Class)&OBJC_CLASS___TVSSOutputDeviceAsset;
  v21 = -[TVSSOutputDeviceAsset init](&v13, "init");
  objc_storeStrong((id *)&v21, v21);
  if (v21) {
    objc_storeStrong((id *)&v21->_symbolName, v14);
  }
  v5 = v21;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v5;
}

- (UIImage)image
{
  if (self->_symbolName) {
    return (UIImage *)+[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", self->_symbolName);
  }
  else {
    return (UIImage *)0LL;
  }
}

+ (id)_outputDeviceRouteProvider
{
  if (!qword_100221910)
  {
    v2 = objc_retainBlock(&stru_1001B65E8);
    v3 = (void *)qword_100221910;
    qword_100221910 = (uint64_t)v2;
  }

  return objc_retainBlock((id)qword_100221910);
}

+ (void)_setOutputDeviceRouteProvider:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] copy];
  v4 = (void *)qword_100221910;
  qword_100221910 = (uint64_t)v3;

  objc_storeStrong(location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSOutputDeviceAsset succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v4[0] appendString:v5->_symbolName withName:@"symbolName"];
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSOutputDeviceAsset descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSOutputDeviceAsset succinctDescriptionBuilder](v7, "succinctDescriptionBuilder");
  id v4 = v5;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v17 == location[0])
  {
    char v18 = 1;
    int v15 = 1;
  }

  else
  {
    id v14 = location[0];
    objc_super v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSOutputDeviceAsset));
    v6 = v13;
    symbolName = v17->_symbolName;
    uint64_t v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = sub_10001BF44;
    v11 = &unk_1001B6610;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendString:counterpart:](v6, "appendString:counterpart:", symbolName, &v7);
    char v18 = -[BSEqualsBuilder isEqual](v13, "isEqual") & 1;
    int v15 = 1;
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v18 & 1;
}

- (unint64_t)hash
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendObject:v6->_symbolName];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (NSString)description
{
  return (NSString *)-[TVSSOutputDeviceAsset succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSOutputDeviceAsset descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
}

@end