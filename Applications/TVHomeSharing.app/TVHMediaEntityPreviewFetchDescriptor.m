@interface TVHMediaEntityPreviewFetchDescriptor
- (NSCopying)identifier;
- (NSString)context;
- (NSString)logName;
- (TVHKMediaEntitiesFetchRequest)fetchRequest;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntityPreviewFetchDescriptor)init;
- (TVHMediaEntityPreviewFetchDescriptor)initWithIdentifier:(id)a3 mediaLibrary:(id)a4 fetchRequest:(id)a5;
- (void)setContext:(id)a3;
- (void)setLogName:(id)a3;
@end

@implementation TVHMediaEntityPreviewFetchDescriptor

- (TVHMediaEntityPreviewFetchDescriptor)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntityPreviewFetchDescriptor)initWithIdentifier:(id)a3 mediaLibrary:(id)a4 fetchRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVHMediaEntityPreviewFetchDescriptor;
  v11 = -[TVHMediaEntityPreviewFetchDescriptor init](&v15, "init");
  if (v11)
  {
    v12 = (NSCopying *)[v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_mediaLibrary, a4);
    objc_storeStrong((id *)&v11->_fetchRequest, a5);
  }

  return v11;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHKMediaEntitiesFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSString)logName
{
  return self->_logName;
}

- (void)setLogName:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end