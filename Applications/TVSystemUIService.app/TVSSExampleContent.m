@interface TVSSExampleContent
- (Class)preferredVisualizerViewClass;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)counter;
- (void)setCounter:(int64_t)a3;
- (void)setName:(id)a3;
@end

@implementation TVSSExampleContent

- (Class)preferredVisualizerViewClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVSSExampleContentView);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8 = self;
  v7[2] = (id)a2;
  v7[1] = a3;
  v7[0] = -[TVSSExampleContent init]( +[TVSSExampleContent allocWithZone:](&OBJC_CLASS___TVSSExampleContent, "allocWithZone:", a3),  "init");
  id v3 = -[NSString copy](v8->_name, "copy");
  v4 = (void *)*((void *)v7[0] + 1);
  *((void *)v7[0] + 1) = v3;

  *((void *)v7[0] + 2) = v8->_counter;
  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(int64_t)a3
{
  self->_counter = a3;
}

- (void).cxx_destruct
{
}

@end