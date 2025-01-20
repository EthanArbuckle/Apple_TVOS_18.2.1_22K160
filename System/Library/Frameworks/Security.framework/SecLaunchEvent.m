@interface SecLaunchEvent
- (NSDate)date;
- (NSString)name;
- (SecLaunchEvent)initWithName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)counter;
- (void)setCounter:(unsigned int)a3;
- (void)setDate:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SecLaunchEvent

- (SecLaunchEvent)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SecLaunchEvent;
  v6 = -[SecLaunchEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x189603F50] date];
    date = v7->_date;
    v7->_date = (NSDate *)v8;

    v7->_counter = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[SecLaunchEvent name](self, "name");
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setName:v7];

  -[SecLaunchEvent date](self, "date");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDate:v9];

  objc_msgSend(v5, "setCounter:", -[SecLaunchEvent counter](self, "counter"));
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDate:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
}

@end