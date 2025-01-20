@interface NWAccumulatedValue
- (NSObject)object;
- (NSString)keyPath;
- (NWAccumulation)accumulation;
- (id)callback;
- (id)description;
- (id)snapshot;
- (void)setAccumulation:(id)a3;
- (void)setCallback:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation NWAccumulatedValue

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)snapshot
{
  v3 = objc_alloc_init(&OBJC_CLASS___NWAccumulatedValue);
  v4 = -[NWAccumulatedValue keyPath](self, "keyPath");
  -[NWAccumulatedValue setKeyPath:](v3, "setKeyPath:", v4);
  v5 = -[NWAccumulatedValue accumulation](self, "accumulation");
  [v5 snapshot];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulatedValue setAccumulation:](v3, "setAccumulation:", v6);

  return v3;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (NWAccumulation)accumulation
{
  return self->_accumulation;
}

- (void)setAccumulation:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end