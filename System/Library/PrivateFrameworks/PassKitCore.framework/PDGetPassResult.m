@interface PDGetPassResult
- (NSString)lastModified;
- (PKPass)pass;
- (void)setLastModified:(id)a3;
- (void)setPass:(id)a3;
@end

@implementation PDGetPassResult

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (void).cxx_destruct
{
}

@end