@interface FFFeatureState
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 buildVersion:(id)a6;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8;
- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8 buildVersion:(id)a9;
- (NSDictionary)attributes;
- (NSString)buildVersion;
- (NSString)disclosurerequired;
- (NSString)domain;
- (NSString)feature;
- (NSString)phase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)value;
- (void)setAttributes:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDisclosurerequired:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFeature:(id)a3;
- (void)setPhase:(id)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation FFFeatureState

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]( objc_alloc(&OBJC_CLASS___FFFeatureState),  "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:",  v9,  v8,  a5,  0LL,  0LL,  0LL,  0LL);

  return v10;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 buildVersion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]( objc_alloc(&OBJC_CLASS___FFFeatureState),  "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:",  v12,  v11,  a5,  0LL,  0LL,  0LL,  v10);

  return v13;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  v19 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]( objc_alloc(&OBJC_CLASS___FFFeatureState),  "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:",  v18,  v17,  a5,  v16,  v15,  v14,  0LL);

  return v19;
}

- (FFFeatureState)initWithDomain:(id)a3 feature:(id)a4 value:(int64_t)a5 phase:(id)a6 disclosureRequired:(id)a7 attributes:(id)a8 buildVersion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___FFFeatureState;
  v21 = -[FFFeatureState init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[FFFeatureState setAttributes:](v21, "setAttributes:", v19);
    -[FFFeatureState setDomain:](v22, "setDomain:", v15);
    -[FFFeatureState setFeature:](v22, "setFeature:", v16);
    -[FFFeatureState setValue:](v22, "setValue:", a5);
    -[FFFeatureState setPhase:](v22, "setPhase:", v17);
    -[FFFeatureState setDisclosurerequired:](v22, "setDisclosurerequired:", v18);
    -[FFFeatureState setBuildVersion:](v22, "setBuildVersion:", v20);
  }

  return v22;
}

- (id)description
{
  unint64_t v3 = -[FFFeatureState value](self, "value");
  if (v3 >= 3) {
    v4 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"invalid (%d)",  -[FFFeatureState value](self, "value"));
  }
  else {
    v4 = *(&off_189E9B4B0 + v3);
  }
  id v5 = objc_alloc(NSString);
  v6 = -[FFFeatureState domain](self, "domain");
  v7 = -[FFFeatureState feature](self, "feature");
  id v8 = (void *)[v5 initWithFormat:@"Feature %@/%@ state %@", v6, v7, v4];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___FFFeatureState);
  -[FFFeatureState domain](self, "domain");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FFFeatureState feature](self, "feature");
  int64_t v7 = -[FFFeatureState value](self, "value");
  -[FFFeatureState phase](self, "phase");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState disclosurerequired](self, "disclosurerequired");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureState attributes](self, "attributes");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:]( v4,  "initWithDomain:feature:value:phase:disclosureRequired:attributes:",  v5,  v6,  v7,  v8,  v9,  v10);

  return v11;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)phase
{
  return self->_phase;
}

- (void)setPhase:(id)a3
{
}

- (NSString)disclosurerequired
{
  return self->_disclosurerequired;
}

- (void)setDisclosurerequired:(id)a3
{
}

- (void).cxx_destruct
{
}

@end