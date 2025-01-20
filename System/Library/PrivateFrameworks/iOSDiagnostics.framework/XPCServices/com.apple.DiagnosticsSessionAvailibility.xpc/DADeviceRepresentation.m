@interface DADeviceRepresentation
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DADeviceDelegate)delegate;
- (DADeviceRepresentation)initWithSerialNumber:(id)a3 isLocal:(BOOL)a4 attributes:(id)a5;
- (DADeviceState)state;
- (NSString)description;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setLocal:(BOOL)a3;
- (void)setState:(id)a3;
@end

@implementation DADeviceRepresentation

- (DADeviceRepresentation)initWithSerialNumber:(id)a3 isLocal:(BOOL)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DADeviceRepresentation;
  v10 = -[DADeviceRepresentation init](&v16, "init");
  if (v10)
  {
    v11 = &__NSDictionary0__struct;
    if (v9) {
      v11 = v9;
    }
    id v12 = v11;

    v10->_local = a4;
    v13 = -[DADeviceState initWithSerialNumber:attributes:]( objc_alloc(&OBJC_CLASS___DADeviceState),  "initWithSerialNumber:attributes:",  v8,  v12);
    state = v10->_state;
    v10->_state = v13;

    id v9 = v12;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serialNumber]);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___DADevice])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serialNumber]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serialNumber]);
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceRepresentation state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serialNumber]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@; %p: %@>",
                   v5,
                   self,
                   v7));

  return (NSString *)v8;
}

- (DADeviceDelegate)delegate
{
  return (DADeviceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (void).cxx_destruct
{
}

@end