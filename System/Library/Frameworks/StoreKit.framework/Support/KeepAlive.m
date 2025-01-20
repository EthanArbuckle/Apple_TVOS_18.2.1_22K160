@interface KeepAlive
+ (KeepAlive)keepAliveWithFormat:(id)a3;
+ (KeepAlive)keepAliveWithName:(id)a3;
- (KeepAlive)initWithName:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation KeepAlive

+ (KeepAlive)keepAliveWithFormat:(id)a3
{
  id v3 = a3;
  v4 = -[NSString initWithFormat:locale:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:locale:arguments:",  v3,  0LL,  &v7);

  v5 = -[KeepAlive initWithName:](objc_alloc(&OBJC_CLASS___KeepAlive), "initWithName:", v4);
  return v5;
}

+ (KeepAlive)keepAliveWithName:(id)a3
{
  id v3 = a3;
  v4 = -[KeepAlive initWithName:](objc_alloc(&OBJC_CLASS___KeepAlive), "initWithName:", v3);

  return v4;
}

- (KeepAlive)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___KeepAlive;
  v5 = -[KeepAlive init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v6;

    +[TransactionStore takeKeepAliveTransaction:]( &OBJC_CLASS___TransactionStore,  "takeKeepAliveTransaction:",  v5->_name);
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KeepAlive;
  -[KeepAlive dealloc](&v3, "dealloc");
}

- (id)description
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end