@interface NENexusBrowse
- (NSUUID)clientIdentifier;
- (NWBrowseDescriptor)descriptor;
- (NWParameters)parameters;
- (void)setClientIdentifier:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation NENexusBrowse

- (NWBrowseDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end