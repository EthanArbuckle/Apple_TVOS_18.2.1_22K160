@interface MRShaderArguments
- (BOOL)texture0ClampsToBorder;
- (BOOL)texture1ClampsToBorder;
- (NSString)filter0;
- (NSString)filter1;
- (NSString)filter2;
- (NSString)filter3;
- (void)dealloc;
- (void)setFilter0:(id)a3;
- (void)setFilter1:(id)a3;
- (void)setFilter2:(id)a3;
- (void)setFilter3:(id)a3;
- (void)setTexture0ClampsToBorder:(BOOL)a3;
- (void)setTexture1ClampsToBorder:(BOOL)a3;
@end

@implementation MRShaderArguments

- (void)dealloc
{
  self->_filter0 = 0LL;
  self->_filter1 = 0LL;

  self->_filter2 = 0LL;
  self->_filter3 = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRShaderArguments;
  -[MRShaderArguments dealloc](&v3, "dealloc");
}

- (NSString)filter0
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFilter0:(id)a3
{
}

- (NSString)filter1
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setFilter1:(id)a3
{
}

- (NSString)filter2
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFilter2:(id)a3
{
}

- (NSString)filter3
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setFilter3:(id)a3
{
}

- (BOOL)texture0ClampsToBorder
{
  return self->_texture0ClampsToBorder;
}

- (void)setTexture0ClampsToBorder:(BOOL)a3
{
  self->_texture0ClampsToBorder = a3;
}

- (BOOL)texture1ClampsToBorder
{
  return self->_texture1ClampsToBorder;
}

- (void)setTexture1ClampsToBorder:(BOOL)a3
{
  self->_texture1ClampsToBorder = a3;
}

@end