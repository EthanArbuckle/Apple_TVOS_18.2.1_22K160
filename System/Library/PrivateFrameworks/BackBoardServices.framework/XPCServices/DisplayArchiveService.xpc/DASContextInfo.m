@interface DASContextInfo
+ (DASContextInfo)contextInfoWithIdentifier:(unsigned int)a3 pid:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)raw;
- (id)_initWithIdentifier:(unsigned int)a3 pid:(int)a4 raw:(id)a5;
- (id)description;
- (int)pid;
- (unint64_t)hash;
- (unsigned)identifier;
@end

@implementation DASContextInfo

- (id)_initWithIdentifier:(unsigned int)a3 pid:(int)a4 raw:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DASContextInfo;
  v9 = -[DASContextInfo init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_identifier = a3;
    v9->_pid = a4;
    v11 = (NSString *)[v8 copy];
    raw = v10->_raw;
    v10->_raw = v11;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendUnsignedInteger:self->_identifier];
  id v5 = [v3 appendInteger:self->_pid];
  id v6 = [v3 hash];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___DASContextInfo));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t identifier = self->_identifier;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000274C;
  v19[3] = &unk_1000103F0;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendUnsignedInteger:identifier counterpart:v19];
  uint64_t pid = self->_pid;
  objc_super v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  v16 = sub_100002758;
  v17 = &unk_100010418;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendInteger:pid counterpart:&v14];
  LOBYTE(pid) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);

  return pid;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%x",  self->_identifier));
  [v3 appendString:v4 withName:@"id"];

  id v5 = [v3 appendInt:self->_pid withName:@"pid"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v6;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)raw
{
  return self->_raw;
}

- (void).cxx_destruct
{
}

+ (DASContextInfo)contextInfoWithIdentifier:(unsigned int)a3 pid:(int)a4
{
  return (DASContextInfo *) [objc_alloc((Class)a1) _initWithIdentifier:*(void *)&a3 pid:*(void *)&a4 raw:0];
}

@end