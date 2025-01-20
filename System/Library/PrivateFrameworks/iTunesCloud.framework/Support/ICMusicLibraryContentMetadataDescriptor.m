@interface ICMusicLibraryContentMetadataDescriptor
- (BOOL)isEqual:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)initWithTitle:(id)a3 andStoreAdamID:(int64_t)a4;
- (NSString)title;
- (id)debugDescription;
- (int64_t)storeAdamID;
- (void)setStoreAdamID:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICMusicLibraryContentMetadataDescriptor

- (ICMusicLibraryContentMetadataDescriptor)initWithTitle:(id)a3 andStoreAdamID:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ICMusicLibraryContentMetadataDescriptor;
  v7 = -[ICMusicLibraryContentMetadataDescriptor init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[ICMusicLibraryContentMetadataDescriptor setTitle:](v7, "setTitle:", v6);
    -[ICMusicLibraryContentMetadataDescriptor setStoreAdamID:](v8, "setStoreAdamID:", a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = -[ICMusicLibraryContentMetadataDescriptor storeAdamID](self, "storeAdamID");
    if (v8 == [v7 storeAdamID])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryContentMetadataDescriptor title](self, "title"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
      unsigned __int8 v11 = [v9 isEqualToString:v10];
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICMusicLibraryContentMetadataDescriptor title](self, "title"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Title: %@, storeAdamID: %lld",  v3,  -[ICMusicLibraryContentMetadataDescriptor storeAdamID](self, "storeAdamID")));

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_storeAdamID = a3;
}

- (void).cxx_destruct
{
}

@end