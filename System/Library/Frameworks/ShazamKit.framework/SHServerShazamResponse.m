@interface SHServerShazamResponse
- (NSDictionary)shazamDictionary;
- (SHServerShazamResponse)initWithShazamDictionary:(id)a3;
- (id)itemForIdentifier:(id)a3;
- (void)setShazamDictionary:(id)a3;
@end

@implementation SHServerShazamResponse

- (SHServerShazamResponse)initWithShazamDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHServerShazamResponse;
  v6 = -[SHServerShazamResponse init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shazamDictionary, a3);
  }

  return v7;
}

- (id)itemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerShazamResponse shazamDictionary](self, "shazamDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___SHShazamResponseItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHServerShazamResponse shazamDictionary](self, "shazamDictionary"));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v4]);
    v10 = -[SHShazamResponseItem initWithShazamItemDictionary:](v7, "initWithShazamItemDictionary:", v9);
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (NSDictionary)shazamDictionary
{
  return self->_shazamDictionary;
}

- (void)setShazamDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end