@interface DIShadowNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isCache;
- (BOOL)isEqual:(id)a3;
- (DIShadowNode)initWithCoder:(id)a3;
- (DIShadowNode)initWithURL:(id)a3 isCache:(BOOL)a4;
- (DIURL)URL;
- (FileLocalXPC)fileBackend;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numBlocks;
- (void)createBackendWithFlags:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNumBlocks:(unint64_t)a3;
@end

@implementation DIShadowNode

- (DIShadowNode)initWithURL:(id)a3 isCache:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DIShadowNode;
  v7 = -[DIShadowNode init](&v12, "init");
  if (v7)
  {
    v8 = +[DIURL newDIURLWithNSURL:](&OBJC_CLASS___DIURL, "newDIURLWithNSURL:", v6);
    URL = v7->_URL;
    v7->_URL = v8;

    v7->_isCache = a4;
    fileBackend = v7->_fileBackend;
    v7->_fileBackend = 0LL;
    v7->_numBlocks = 0LL;
  }

  return v7;
}

- (void)createBackendWithFlags:(int)a3
{
  fileBackend = self->_fileBackend;
  self->_fileBackend = 0LL;

  v5 = objc_alloc(&OBJC_CLASS___FileLocalXPC);
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  id v6 = -[FileLocalXPC initWithURL:fileOpenFlags:](v5, "initWithURL:fileOpenFlags:");
  v7 = self->_fileBackend;
  self->_fileBackend = v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DIShadowNode;
  id v6 = -[DIShadowNode init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), @"URL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    v6->_isCache = [v4 decodeBoolForKey:@"isCache"];
    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(FileLocalXPC, v10),  @"fileBackend");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    fileBackend = v6->_fileBackend;
    v6->_fileBackend = (FileLocalXPC *)v12;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  [v6 encodeObject:v4 forKey:@"URL"];

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowNode isCache](self, "isCache"), @"isCache");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode fileBackend](self, "fileBackend"));
  [v6 encodeObject:v5 forKey:@"fileBackend"];
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  unsigned int v4 = -[DIShadowNode isCache](self, "isCache");
  uint64_t v5 = @"Shadow";
  if (v4) {
    uint64_t v5 = @"Cache";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v3, v5));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URL]);
    if ([v8 isEqual:v9])
    {
      unsigned int v10 = -[DIShadowNode isCache](self, "isCache");
      unsigned int v11 = v10 ^ [v7 isCache] ^ 1;
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  id v4 = [v3 hash];

  unsigned int v5 = -[DIShadowNode isCache](self, "isCache");
  uint64_t v6 = 2221LL;
  if (v5) {
    uint64_t v6 = 2207LL;
  }
  return v6 - (void)v4 + 32LL * (void)v4 + 961;
}

- (DIURL)URL
{
  return self->_URL;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (FileLocalXPC)fileBackend
{
  return self->_fileBackend;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
}

@end