@interface IDSClientDataResult
- (NSDictionary)clientDatasByServiceType;
- (NSDictionary)ktRegDataByServiceType;
- (void)setClientDatasByServiceType:(id)a3;
- (void)setKtRegDataByServiceType:(id)a3;
@end

@implementation IDSClientDataResult

- (NSDictionary)clientDatasByServiceType
{
  return self->_clientDatasByServiceType;
}

- (void)setClientDatasByServiceType:(id)a3
{
}

- (NSDictionary)ktRegDataByServiceType
{
  return self->_ktRegDataByServiceType;
}

- (void)setKtRegDataByServiceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end