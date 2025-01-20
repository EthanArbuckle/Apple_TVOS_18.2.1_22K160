@interface TVPImageFetchRecord
- (BOOL)isActive;
- (NSString)assetID;
- (TVPAccessObject)accessObject;
- (TVPImageFetchRecord)initWithAccessObject:(id)a3 imageToken:(id)a4 assetID:(id)a5;
- (id)completionHandler;
- (id)imageToken;
- (int)priority;
- (void)setCompletionHandler:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPriority:(int)a3;
@end

@implementation TVPImageFetchRecord

- (TVPImageFetchRecord)initWithAccessObject:(id)a3 imageToken:(id)a4 assetID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPImageFetchRecord;
  v11 = -[TVPImageFetchRecord init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessObject, v8);
    objc_storeStrong(&v12->_imageToken, a4);
    objc_storeStrong((id *)&v12->_assetID, a5);
  }

  return v12;
}

- (TVPAccessObject)accessObject
{
  return (TVPAccessObject *)objc_loadWeakRetained((id *)&self->_accessObject);
}

- (id)imageToken
{
  return self->_imageToken;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
}

@end