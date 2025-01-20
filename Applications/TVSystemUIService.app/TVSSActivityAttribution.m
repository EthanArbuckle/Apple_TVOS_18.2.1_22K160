@interface TVSSActivityAttribution
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemService;
- (BOOL)matchesActivityAttribution:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)executableDisplayName;
- (TVSSActivityAttribution)initWithSTActivityAttribution:(id)a3;
- (id)_activityAttribution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation TVSSActivityAttribution

- (TVSSActivityAttribution)initWithSTActivityAttribution:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSActivityAttribution;
  v10 = -[TVSSActivityAttribution init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = (STActivityAttribution *)[location[0] copy];
    attribution = v10->_attribution;
    v10->_attribution = v4;
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (BOOL)matchesActivityAttribution:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = -[TVSSActivityAttribution bundleIdentifier](v11, "bundleIdentifier");
  id v4 = [location[0] bundleIdentifier];
  unsigned __int8 v6 = -[NSString isEqual:](v5, "isEqual:");

  if ((v6 & 1) != 0)
  {
    char v12 = 1;
    int v9 = 1;
  }

  else
  {
    id v8 = -[STActivityAttribution attributedEntity](v11->_attribution, "attributedEntity");
    id v7 = [*((id *)location[0] + 1) attributedEntity];
    char v12 = [v8 matchesAttributedEntity:v7] & 1;
    int v9 = 1;
    objc_storeStrong(&v7, 0LL);
    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v12 & 1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  id v5 = -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  id v6 = [v5 executableIdentity];
  if (v6)
  {
    [v6 auditToken];
  }

  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (NSString)bundleIdentifier
{
  id location[2] = self;
  location[1] = (id)a2;
  id v4 = -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  id v3 = [v4 executableIdentity];
  location[0] = [v3 bundleIdentifier];

  if (([location[0] isEqual:@"com.apple.facetime"] & 1) != 0
    || ([location[0] isEqual:@"com.apple.TelephonyUtilities"] & 1) != 0
    || ([location[0] isEqual:@"com.apple.mediaserverd"] & 1) != 0
    || ([location[0] isEqual:@"com.apple.avconferenced"] & 1) != 0)
  {
    id v6 = @"com.apple.facetime";
  }

  else if ([location[0] isEqual:@"com.apple.CoreSpeech"])
  {
    id v6 = @"com.apple.AssistantServices";
  }

  else
  {
    id v6 = (__CFString *)location[0];
  }

  objc_storeStrong(location, 0LL);
  return (NSString *)v6;
}

- (BOOL)isSystemService
{
  id v3 = -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  unsigned __int8 v4 = [v3 isSystemService];

  return v4 & 1;
}

- (NSString)displayName
{
  unsigned __int8 v4 = -[TVSSActivityAttribution bundleIdentifier](self, "bundleIdentifier");
  unsigned __int8 v5 = -[NSString isEqual:](v4, "isEqual:", @"com.apple.facetime");

  if ((v5 & 1) != 0) {
    return (NSString *)TVSSLagunaLocalizedString(@"FaceTimeDisplayName");
  }
  id v3 = -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  id v7 = [v3 localizedDisplayName];

  return (NSString *)v7;
}

- (NSString)executableDisplayName
{
  id v3 = -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  id v4 = [v3 localizedExecutableDisplayName];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v17 = self;
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
    v13 =  +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v14,  objc_opt_class(&OBJC_CLASS___TVSSActivityAttribution));
    id v6 = v13;
    attribution = v17->_attribution;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000B9978;
    v11 = &unk_1001B60F8;
    id v12 = v14;
    id v3 = -[BSEqualsBuilder appendObject:counterpart:](v6, "appendObject:counterpart:", attribution, &v7);
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
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder");
  id v2 = [v5[0] appendObject:v6->_attribution];
  id v4 = [v5[0] hash];
  objc_storeStrong(v5, 0LL);
  return (unint64_t)v4;
}

- (NSString)description
{
  return (NSString *)-[TVSSActivityAttribution succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSActivityAttribution descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)succinctDescription
{
  id v3 = -[TVSSActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  int v9 = self;
  v8[1] = (id)a2;
  v8[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v8[0];
  id v4 = -[TVSSActivityAttribution displayName](v9, "displayName");
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v8[0];
  id v6 = -[TVSSActivityAttribution bundleIdentifier](v9, "bundleIdentifier");
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSActivityAttribution descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = -[TVSSActivityAttribution succinctDescriptionBuilder](v10, "succinctDescriptionBuilder");
  [v8 setActiveMultilinePrefix:location[0]];
  id v5 = v8;
  id v6 = -[TVSSActivityAttribution executableDisplayName](v10, "executableDisplayName");
  objc_msgSend(v5, "appendString:withName:");

  id v3 =  objc_msgSend( v8,  "appendBool:withName:",  -[TVSSActivityAttribution isSystemService](v10, "isSystemService"),  @"isSystemService");
  id v7 = v8;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)_activityAttribution
{
  return self->_attribution;
}

- (void).cxx_destruct
{
}

@end