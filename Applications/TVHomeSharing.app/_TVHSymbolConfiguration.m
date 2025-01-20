@interface _TVHSymbolConfiguration
- (_TVHSymbolConfiguration)init;
- (double)pointSize;
- (id)description;
- (int64_t)scale;
- (int64_t)weight;
- (void)setPointSize:(double)a3;
- (void)setScale:(int64_t)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation _TVHSymbolConfiguration

- (_TVHSymbolConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____TVHSymbolConfiguration;
  result = -[_TVHSymbolConfiguration init](&v3, "init");
  if (result) {
    *(_OWORD *)&result->_weight = xmmword_1000C3580;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendFloat:@"pointSize" withName:self->_pointSize];
  id v5 = [v3 appendInteger:self->_weight withName:@"weight"];
  id v6 = [v3 appendInteger:self->_scale withName:@"scale"];
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v7;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

@end