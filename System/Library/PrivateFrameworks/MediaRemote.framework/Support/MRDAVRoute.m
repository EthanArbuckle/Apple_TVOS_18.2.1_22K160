@interface MRDAVRoute
+ (MRDAVRoute)allocWithZone:(_NSZone *)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRDAVRoute)initWithDictionary:(id)a3;
- (MRDAVRouteExtendedInfo)extendedInfo;
- (NSData)MACAddress;
- (NSDictionary)dictionary;
- (NSString)modelName;
- (NSString)name;
- (NSString)type;
- (NSString)uniqueIdentifier;
- (unint64_t)sampleRate;
@end

@implementation MRDAVRoute

+ (MRDAVRoute)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRDAVRoute) == a1) {
    return (MRDAVRoute *)+[MRDAVRoute allocWithZone:](&OBJC_CLASS___MRDMediaServerAVRoute, "allocWithZone:", a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MRDAVRoute;
  return (MRDAVRoute *)objc_msgSendSuper2(&v6, "allocWithZone:", a3);
}

- (MRDAVRoute)initWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s is abstract",  "-[MRDAVRoute initWithDictionary:]"));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (MRDAVRoute *)-[MRDAVRoute matchesUniqueIdentifier:](v6, v7, v8);
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoute uniqueIdentifier](self, "uniqueIdentifier"));
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  return v6;
}

- (unint64_t)sampleRate
{
  return 0LL;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSData)MACAddress
{
  return self->_MACAddress;
}

- (BOOL)isInputRoute
{
  return self->_inputRoute;
}

- (BOOL)isOutputRoute
{
  return self->_outputRoute;
}

- (BOOL)isPicked
{
  return self->_picked;
}

- (BOOL)isSpeakerRoute
{
  return self->_speakerRoute;
}

- (MRDAVRouteExtendedInfo)extendedInfo
{
  return self->_extendedInfo;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
}

@end