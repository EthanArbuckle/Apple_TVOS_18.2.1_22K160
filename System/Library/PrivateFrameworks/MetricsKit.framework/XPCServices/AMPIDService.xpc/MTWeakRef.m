@interface MTWeakRef
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation MTWeakRef

- (id)value
{
  return objc_loadWeakRetained(&self->_value);
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end