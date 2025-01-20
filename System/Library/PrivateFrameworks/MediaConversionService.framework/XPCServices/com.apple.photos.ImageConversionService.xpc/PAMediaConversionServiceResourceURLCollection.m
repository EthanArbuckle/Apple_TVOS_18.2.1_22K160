@interface PAMediaConversionServiceResourceURLCollection
+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5;
+ (PAMediaConversionServiceResourceURLCollection)collectionWithMainResourceURL:(id)a3;
+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5;
+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3;
- (BOOL)allURLsAreReadable;
- (BOOL)containsAllRoles:(id)a3;
- (BOOL)containsAnyRole:(id)a3;
- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6;
- (BOOL)ensureFilesExistWithError:(id *)a3;
- (BOOL)isBlastDoorAccessRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeExistingEmptyFilesWithError:(id *)a3;
- (NSDictionary)blastDoorMainSourceProperties;
- (NSDictionary)blastDoorVideoComplementProperties;
- (NSError)blastDoorError;
- (NSMutableDictionary)urlReferencesByRole;
- (NSURL)blastDoorSourceURL;
- (PAMediaConversionServiceResourceURLCollection)init;
- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate;
- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3;
- (id)description;
- (id)fileSizeSummary;
- (id)filenameExtensionAndPathHashForRole:(id)a3;
- (id)logMessageSummary;
- (id)logMessageSummaryWithFullPath:(BOOL)a3;
- (id)resourceURLForRole:(id)a3;
- (id)typeIdentifierForResourceURLWithRole:(id)a3;
- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (unint64_t)urlCount;
- (void)enumerateResourceURLReferences:(id)a3;
- (void)enumerateResourceURLs:(id)a3;
- (void)setAccessProviderDelegate:(id)a3;
- (void)setResourceURL:(id)a3 forRole:(id)a4;
- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5;
- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4;
- (void)setUrlReferencesByRole:(id)a3;
@end

@implementation PAMediaConversionServiceResourceURLCollection

- (PAMediaConversionServiceResourceURLCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PAMediaConversionServiceResourceURLCollection;
  v2 = -[PAMediaConversionServiceResourceURLCollection init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    urlReferencesByRole = v2->_urlReferencesByRole;
    v2->_urlReferencesByRole = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  urlReferencesByRole = self->_urlReferencesByRole;
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 urlReferencesByRole]);
  LOBYTE(urlReferencesByRole) = -[NSMutableDictionary isEqual:](urlReferencesByRole, "isEqual:", v4);

  return (char)urlReferencesByRole;
}

- (unint64_t)hash
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100006940;
  v4[3] = &unk_100028830;
  v4[4] = &v5;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLReferences:]( self,  "enumerateResourceURLReferences:",  v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setResourceURL:(id)a3 forRole:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 251, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v11 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 252, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

LABEL_3:
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  v7));

  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 253, @"This resource URL collection already has a URL for role '%@'", v7 object file lineNumber description];
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[PAMediaConversionServiceResourceURLReference referenceWithURL:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLReference,  "referenceWithURL:",  v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_urlReferencesByRole,  "setObject:forKeyedSubscript:",  v9,  v7);
}

- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  -[PAMediaConversionServiceResourceURLCollection setResourceURL:forRole:](self, "setResourceURL:forRole:", a3, v8);
  -[PAMediaConversionServiceResourceURLCollection setShouldDeleteURLOnDeallocation:forRole:]( self,  "setShouldDeleteURLOnDeallocation:forRole:",  v5,  v8);
}

- (id)resourceURLForRole:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 266, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 url]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate]( self,  "accessProviderDelegate"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 validateAccessForURL:v7 role:v5]);

    id v7 = (void *)v10;
  }

  return v7;
}

- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:"));
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 277, @"No URL is currently set for role %@", v9 object file lineNumber description];
  }

  [v7 setShouldDeleteOnDeallocation:v4];
}

- (BOOL)containsAllRoles:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 283, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)));

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (BOOL)containsAnyRole:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 294, @"Invalid parameter not satisfying: %@", @"[roles count]" object file lineNumber description];
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)));

        if (v11)
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)typeIdentifierForResourceURLWithRole:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v30 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 305, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  v5));
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 url]);
    if (!v8)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v31 handleFailureInMethod:a2 object:self file:@"PAMediaConversionServiceResourceURLCollection.m" lineNumber:313 description:@"Unexpected nil role"];
    }

    id v33 = 0LL;
    id v32 = 0LL;
    unsigned __int8 v9 = [v8 getResourceValue:&v33 forKey:NSURLTypeIdentifierKey error:&v32];
    id v10 = v33;
    id v11 = v32;
    BOOL v12 = v11;
    if ((v9 & 1) != 0)
    {
      char v13 = 0;
LABEL_13:
      if ((v13 & 1) == 0)
      {
        if (v10)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](&OBJC_CLASS___UTType, "typeWithIdentifier:", v10));
          unsigned int v21 = [v20 conformsToType:UTTypeImage];

          if (v21)
          {
            v22 = CGImageSourceCreateWithURL((CFURLRef)v8, 0LL);
            if (v22)
            {
              v23 = v22;
              CFStringRef Type = CGImageSourceGetType(v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue(Type);
              v26 = v25;
              if (v25)
              {
                id v27 = v25;

                id v10 = v27;
              }

              CFRelease(v23);
            }
          }
        }
      }

- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned int v21 = sub_100005E4C;
  v22 = sub_100005E5C;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000067F8;
  v10[3] = &unk_100028858;
  BOOL v12 = &v18;
  id v7 = v5;
  id v11 = v7;
  char v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( urlReferencesByRole,  "enumerateKeysAndObjectsUsingBlock:",  v10);
  if (*((_BYTE *)v15 + 24))
  {
    id v8 = 0LL;
    if (a3) {
      *a3 = (id) v19[5];
    }
  }

  else
  {
    id v8 = v7;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)filenameExtensionAndPathHashForRole:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  a3));
  BOOL v4 = v3;
  if (v3)
  {
    id v9 = 0LL;
    uint64_t v10 = 0LL;
    [v3 getPathHash:&v10 lastPathComponent:&v9];
    id v5 = v9;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathExtension]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@|%lx", v6, v10));
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (BOOL)ensureFilesExistWithError:(id *)a3
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned int v21 = sub_100005E4C;
  v22 = sub_100005E5C;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000064AC;
  v10[3] = &unk_100028858;
  id v7 = v5;
  id v11 = v7;
  BOOL v12 = &v14;
  char v13 = &v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( urlReferencesByRole,  "enumerateKeysAndObjectsUsingBlock:",  v10);
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((_BYTE *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (BOOL)removeExistingEmptyFilesWithError:(id *)a3
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned int v21 = sub_100005E4C;
  v22 = sub_100005E5C;
  id v23 = 0LL;
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000628C;
  v10[3] = &unk_100028858;
  BOOL v12 = &v18;
  char v13 = &v14;
  id v7 = v5;
  id v11 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( urlReferencesByRole,  "enumerateKeysAndObjectsUsingBlock:",  v10);
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((_BYTE *)v15 + 24)) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (BOOL)allURLsAreReadable
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100006220;
  v5[3] = &unk_100028880;
  id v7 = &v8;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v6 = v3;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", v5);
  LOBYTE(self) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

- (id)logMessageSummaryWithFullPath:(BOOL)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"<"));
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  char v11 = sub_100006118;
  BOOL v12 = &unk_1000288A8;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v14 = a3;
  id v6 = v13;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", &v9);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @"|", v9, v10, v11, v12));
  [v5 appendString:v7];

  [v5 appendString:@">"];
  return v5;
}

- (id)logMessageSummary
{
  return -[PAMediaConversionServiceResourceURLCollection logMessageSummaryWithFullPath:]( self,  "logMessageSummaryWithFullPath:",  0LL);
}

- (id)description
{
  return -[PAMediaConversionServiceResourceURLCollection logMessageSummaryWithFullPath:]( self,  "logMessageSummaryWithFullPath:",  1LL);
}

- (id)fileSizeSummary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"<"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  urlReferencesByRole = self->_urlReferencesByRole;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005F9C;
  v9[3] = &unk_1000288D0;
  id v10 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( urlReferencesByRole,  "enumerateKeysAndObjectsUsingBlock:",  v9);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@"|"]);
  [v3 appendString:v7];

  [v3 appendString:@">"];
  return v3;
}

- (void)enumerateResourceURLReferences:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_urlReferencesByRole, "allKeys"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000288F0]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  v11));
      unsigned __int8 v13 = 0;
      v4[2](v4, v11, v12, &v13);
      LODWORD(v11) = v13;

      if ((_DWORD)v11) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateResourceURLs:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005F28;
  v5[3] = &unk_100028918;
  id v6 = a3;
  id v4 = v6;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLReferences:]( self,  "enumerateResourceURLReferences:",  v5);
}

- (unint64_t)urlCount
{
  return (unint64_t)-[NSMutableDictionary count](self->_urlReferencesByRole, "count");
}

- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 541, @"Invalid parameter not satisfying: %@", @"outputDirectoryName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v26 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 542, @"Invalid parameter not satisfying: %@", @"parentDirectoryURL" object file lineNumber description];

LABEL_3:
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v44 = 0;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
  unsigned __int8 v14 = [v12 fileExistsAtPath:v13 isDirectory:&v44];

  if (v44) {
    unsigned __int8 v15 = v14;
  }
  else {
    unsigned __int8 v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v27 handleFailureInMethod:a2, self, @"PAMediaConversionServiceResourceURLCollection.m", 546, @"Invalid parameter not satisfying: %@", @"exists && isDirectory" object file lineNumber description];
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v9]);
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_100005E4C;
  v42 = sub_100005E5C;
  id v43 = 0LL;
  NSFileAttributeKey v45 = NSFileOwnerAccountName;
  v46 = @"mobile";
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
  uint64_t v18 = (id *)(v39 + 5);
  id obj = (id)v39[5];
  unsigned __int8 v19 = [v12 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:v17 error:&obj];
  objc_storeStrong(v18, obj);

  if ((v19 & 1) != 0) {
    goto LABEL_9;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v39[5] domain]);
  if ([v22 isEqualToString:NSCocoaErrorDomain])
  {
    BOOL v23 = [(id)v39[5] code] == (id)516;

    if (v23)
    {
LABEL_9:
      uint64_t v33 = 0LL;
      v34 = &v33;
      uint64_t v35 = 0x2020000000LL;
      char v36 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100005E64;
      v28[3] = &unk_100028940;
      id v20 = v16;
      id v29 = v20;
      v30 = self;
      v31 = &v38;
      id v32 = &v33;
      -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", v28);
      if (*((_BYTE *)v34 + 24))
      {
        id v21 = 0LL;
        if (a5) {
          *a5 = (id) v39[5];
        }
      }

      else
      {
        id v21 = v20;
      }

      _Block_object_dispose(&v33, 8);
      goto LABEL_20;
    }
  }

  else
  {
  }

  id v21 = 0LL;
  if (a5) {
    *a5 = (id) v39[5];
  }
LABEL_20:
  _Block_object_dispose(&v38, 8);

  return v21;
}

- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v17 = NSFileOwnerAccountName;
  uint64_t v18 = @"mobile";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  unsigned int v12 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:0 attributes:v11 error:a6];

  unsigned __int8 v13 = 0;
  if (v12)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v14]);

    unsigned __int8 v13 = [v10 copyItemAtURL:v8 toURL:v15 error:a6];
  }

  return v13;
}

- (NSMutableDictionary)urlReferencesByRole
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUrlReferencesByRole:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate
{
  return (PAMediaConversionServiceResourceURLCollectionAccessProvider *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccessProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (PAMediaConversionServiceResourceURLCollection)collectionWithMainResourceURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_opt_new(a1);
  [v5 setResourceURL:v4 forRole:@"PAMediaConversionResourceRoleMainResource"];

  return (PAMediaConversionServiceResourceURLCollection *)v5;
}

+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 169, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }

  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100005E4C;
  id v27 = sub_100005E5C;
  id v28 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100006EA8;
  v15[3] = &unk_1000287E8;
  NSFileAttributeKey v17 = &v23;
  id v11 = (id)objc_opt_new(a1);
  id v16 = v11;
  uint64_t v18 = &v19;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
  if (*((_BYTE *)v20 + 24))
  {
    id v12 = 0LL;
    if (a5) {
      *a5 = (id) v24[5];
    }
  }

  else
  {
    if (v10) {
      [v11 setAccessProviderDelegate:v10];
    }
    id v12 = v11;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5
{
  id v9 = a5;
  if (!v9)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v25 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceResourceURLCollection.m", 200, @"Invalid parameter not satisfying: %@", @"bookmarkDictionary" object file lineNumber description];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sortedArrayUsingComparator:&stru_100028808]);

  id v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v13)
  {
    id v14 = v13;
    v26 = a3;
    id v27 = a4;
    uint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v32;
    char v28 = 1;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v29 = 0LL;
        id v19 = v9;
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v18]);
        unsigned int v21 = +[PAMediaConversionServiceResourceURLReference getPathHash:lastPathComponent:forDictionaryRepresentation:]( &OBJC_CLASS___PAMediaConversionServiceResourceURLReference,  "getPathHash:lastPathComponent:forDictionaryRepresentation:",  &v30,  &v29,  v20);
        id v22 = v29;

        if (v21)
        {
          v15 ^= v30;
          [v10 addObject:v22];
        }

        else
        {
          char v28 = 0;
        }

        id v9 = v19;
      }

      id v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v14);

    a3 = v26;
    a4 = v27;
    if ((v28 & 1) == 0)
    {
      BOOL v23 = 0;
      goto LABEL_21;
    }
  }

  else
  {

    uint64_t v15 = 0LL;
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lx",  v15));
  }
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@"|"]);
  }
  BOOL v23 = 1;
LABEL_21:

  return v23;
}

+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allValues]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"lastPathComponent"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 componentsJoinedByString:@"|"]);

  return v5;
}

- (BOOL)isBlastDoorAccessRequired
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  unsigned __int8 v3 = [v2 isBlastDoorAccessRequired];

  return v3;
}

- (NSDictionary)blastDoorMainSourceProperties
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 blastDoorMainSourceProperties]);

  return (NSDictionary *)v3;
}

- (NSDictionary)blastDoorVideoComplementProperties
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_urlReferencesByRole,  "objectForKeyedSubscript:",  @"PAMediaConversionResourceRoleVideoComplement"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 url]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 propertiesForVideoComplementURL:v4]);

  return (NSDictionary *)v6;
}

- (NSURL)blastDoorSourceURL
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 blastDoorSourceURL]);

  return (NSURL *)v3;
}

- (NSError)blastDoorError
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);

  return (NSError *)v3;
}

@end