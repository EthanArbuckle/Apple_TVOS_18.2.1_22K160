@interface MANAutoAssetSetInfoControl
+ (BOOL)supportsSecureCoding;
- (BOOL)clearingAfter;
- (MANAutoAssetSetInfoControl)initWithCoder:(id)a3;
- (NSArray)limitedToClientDomains;
- (NSArray)limitedToSetIdentifiers;
- (id)_arrayStringsToString:(id)a3;
- (id)initClearingAfter:(BOOL)a3;
- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4;
- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4 limitedToSetIdentifiers:(id)a5;
- (id)initClearingAfter:(BOOL)a3 limitedToSetIdentifiers:(id)a4;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MANAutoAssetSetInfoControl

- (id)initClearingAfter:(BOOL)a3
{
  return -[MANAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( self,  "initClearingAfter:limitedToSetIdentifiers:",  a3,  0LL);
}

- (id)initClearingAfter:(BOOL)a3 limitedToSetIdentifiers:(id)a4
{
  return -[MANAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:]( self,  "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:",  a3,  0LL,  a4);
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4
{
  return -[MANAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:]( self,  "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:",  a3,  a4,  0LL);
}

- (id)initClearingAfter:(BOOL)a3 limitedToClientDomains:(id)a4 limitedToSetIdentifiers:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoControl;
  v11 = -[MANAutoAssetSetInfoControl init](&v14, "init");
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_clearingAfter = a3;
    objc_storeStrong((id *)&v11->_limitedToClientDomains, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (MANAutoAssetSetInfoControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MANAutoAssetSetInfoControl;
  v5 = -[MANAutoAssetSetInfoControl init](&v17, "init");
  if (v5)
  {
    v5->_clearingAfter = [v4 decodeBoolForKey:@"clearingAfter"];
    v6 = objc_alloc(&OBJC_CLASS___NSSet);
    v19[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v19[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
    v8 = -[NSSet initWithArray:](v6, "initWithArray:", v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"limitedToClientDomains"]);
    limitedToClientDomains = v5->_limitedToClientDomains;
    v5->_limitedToClientDomains = (NSArray *)v9;

    v11 = objc_alloc(&OBJC_CLASS___NSSet);
    v18[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v18[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 2LL));
    v13 = -[NSSet initWithArray:](v11, "initWithArray:", v12);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v13 forKey:@"limitedToSetIdentifiers"]);
    limitedToSetIdentifiers = v5->_limitedToSetIdentifiers;
    v5->_limitedToSetIdentifiers = (NSArray *)v14;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MANAutoAssetSetInfoControl clearingAfter](self, "clearingAfter"),  @"clearingAfter");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains"));
  [v4 encodeObject:v5 forKey:@"limitedToClientDomains"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers"));
  [v4 encodeObject:v6 forKey:@"limitedToSetIdentifiers"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  if (-[MANAutoAssetSetInfoControl clearingAfter](self, "clearingAfter")) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains"));
  if (v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToClientDomains](self, "limitedToClientDomains"));
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl _arrayStringsToString:](self, "_arrayStringsToString:", v2));
  }

  else
  {
    id v6 = @"N";
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl limitedToSetIdentifiers](self, "limitedToSetIdentifiers"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoControl _arrayStringsToString:](self, "_arrayStringsToString:", v8));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@",  v4,  v6,  v9));
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clearingAfter:%@, limitedToClientDomains:%@ limitedToSetIdentifiers:%@",  v4,  v6,  @"N"));
  }

  if (v5)
  {
  }

  return v10;
}

- (id)_arrayStringsToString:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 0LL);
  v5 = v4;
  if (v3)
  {
    -[NSMutableString appendString:](v4, "appendString:", @"[");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      id v10 = &stru_355768;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"%@%@",  v10,  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v11),  (void)v13);
          v11 = (char *)v11 + 1;
          id v10 = @",";
        }

        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        id v10 = @",";
      }

      while (v8);
    }

    -[NSMutableString appendString:](v5, "appendString:", @"]");
  }

  return v5;
}

- (BOOL)clearingAfter
{
  return self->_clearingAfter;
}

- (NSArray)limitedToClientDomains
{
  return self->_limitedToClientDomains;
}

- (NSArray)limitedToSetIdentifiers
{
  return self->_limitedToSetIdentifiers;
}

- (void).cxx_destruct
{
}

@end