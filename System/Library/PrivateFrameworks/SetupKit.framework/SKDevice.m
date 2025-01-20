@interface SKDevice
- (NSString)identifier;
- (id)description;
- (unsigned)blePSM;
- (void)setBlePSM:(unsigned __int16)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SKDevice

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_blePSM = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end