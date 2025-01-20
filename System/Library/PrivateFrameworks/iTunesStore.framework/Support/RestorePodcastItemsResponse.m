@interface RestorePodcastItemsResponse
- (NSArray)requestItems;
- (NSArray)responseDownloads;
- (NSError)responseError;
- (id)errorForItemIdentifier:(id)a3;
- (void)dealloc;
- (void)setError:(id)a3 forItemIdentifier:(id)a4;
- (void)setRequestItems:(id)a3;
- (void)setResponseDownloads:(id)a3;
- (void)setResponseError:(id)a3;
@end

@implementation RestorePodcastItemsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RestorePodcastItemsResponse;
  -[RestorePodcastItemsResponse dealloc](&v3, "dealloc");
}

- (id)errorForItemIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_itemErrors, "objectForKey:", a3);
}

- (void)setError:(id)a3 forItemIdentifier:(id)a4
{
  itemErrors = self->_itemErrors;
  if (a3)
  {
    if (!itemErrors)
    {
      itemErrors = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      self->_itemErrors = itemErrors;
    }

    -[NSMutableDictionary setObject:forKey:](itemErrors, "setObject:forKey:", a3, a4);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](itemErrors, "removeObjectForKey:", a4);
  }

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
}

- (NSArray)responseDownloads
{
  return self->_responseDownloads;
}

- (void)setResponseDownloads:(id)a3
{
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

@end