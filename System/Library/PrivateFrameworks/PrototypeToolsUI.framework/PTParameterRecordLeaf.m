@interface PTParameterRecordLeaf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)recordClassName;
- (PTParameterRecordLeaf)initWithCoder:(id)a3;
- (PTParameterRecordLeaf)initWithRecordClassName:(id)a3 value:(id)a4;
- (id)changedValue;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedValue:(id)a3;
- (void)setRecordClassName:(id)a3;
@end

@implementation PTParameterRecordLeaf

- (PTParameterRecordLeaf)initWithRecordClassName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PTParameterRecordLeaf;
  v8 = -[PTParameterRecordLeaf init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[PTParameterRecordLeaf setRecordClassName:](v8, "setRecordClassName:", v6);
    -[PTParameterRecordLeaf setChangedValue:](v9, "setChangedValue:", v7);
  }

  return v9;
}

- (PTParameterRecordLeaf)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"recordClassName"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"changedValue"];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = -[PTParameterRecordLeaf initWithRecordClassName:value:](self, "initWithRecordClassName:value:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf recordClassName](self, "recordClassName"));
  [v4 encodeObject:v5 forKey:@"recordClassName"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf changedValue](self, "changedValue"));
  [v4 encodeObject:v6 forKey:@"changedValue"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class(self));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf recordClassName](self, "recordClassName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf changedValue](self, "changedValue"));
  id v7 = [v4 initWithRecordClassName:v5 value:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(self));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf recordClassName](self, "recordClassName"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100004C74;
  v17[3] = &unk_100014688;
  id v8 = v4;
  id v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 appendString:v7 counterpart:v17]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf changedValue](self, "changedValue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100004C7C;
  v15[3] = &unk_1000146B0;
  id v16 = v8;
  id v11 = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 appendObject:v10 counterpart:v15]);
  BOOL v13 = v12 != 0LL;

  return v13;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf recordClassName](self, "recordClassName"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appendString:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTParameterRecordLeaf changedValue](self, "changedValue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appendObject:v6]);
  id v8 = [v7 hash];

  return (unint64_t)v8;
}

- (NSString)recordClassName
{
  return self->_recordClassName;
}

- (void)setRecordClassName:(id)a3
{
}

- (id)changedValue
{
  return self->_changedValue;
}

- (void)setChangedValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end