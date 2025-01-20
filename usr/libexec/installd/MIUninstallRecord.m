@interface MIUninstallRecord
+ (BOOL)supportsSecureCoding;
+ (id)uninstallRecordArrayToICLUninstallRecordArray:(id)a3;
- (BOOL)doesNotHaveBundleContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastReference;
- (BOOL)isLinked;
- (MIUninstallRecord)initWithCoder:(id)a3;
- (id)ICLUninstallRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)legacyDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDoesNotHaveBundleContainer:(BOOL)a3;
- (void)setIsLastReference:(BOOL)a3;
- (void)setIsLinked:(BOOL)a3;
@end

@implementation MIUninstallRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIUninstallRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  v5 = -[MIUninstallRecord initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
  {
    v5->_isLastReference = [v4 decodeBoolForKey:@"isLastReference"];
    v5->_isLinked = [v4 decodeBoolForKey:@"isLinked"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  id v4 = a3;
  -[MIUninstallRecord encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeBool:forKey:",  -[MIUninstallRecord isLastReference](self, "isLastReference", v5.receiver, v5.super_class),  @"isLastReference");
  objc_msgSend(v4, "encodeBool:forKey:", -[MIUninstallRecord isLinked](self, "isLinked"), @"isLinked");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  id v4 = -[MIUninstallRecord copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setIsLastReference:", -[MIUninstallRecord isLastReference](self, "isLastReference"));
  objc_msgSend(v4, "setIsLinked:", -[MIUninstallRecord isLinked](self, "isLinked"));
  return v4;
}

- (id)legacyDictionary
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  id v4 = -[MIUninstallRecord legacyDictionary](&v10, "legacyDictionary");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);

  if (-[MIUninstallRecord isLinked](self, "isLinked")) {
    objc_super v6 = &__kCFBooleanTrue;
  }
  else {
    objc_super v6 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"IsLinkedBundle");
  if (-[MIUninstallRecord isLastReference](self, "isLastReference")) {
    objc_super v7 = &__kCFBooleanTrue;
  }
  else {
    objc_super v7 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"LastReference");
  id v8 = -[NSMutableDictionary copy](v3, "copy");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  if (-[MIUninstallRecord isEqual:](&v11, "isEqual:", v4))
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      id v5 = v4;
      unsigned int v6 = -[MIUninstallRecord isLinked](self, "isLinked");
      if (v6 == [v5 isLinked])
      {
        unsigned int v9 = -[MIUninstallRecord isLastReference](self, "isLastReference");
        if (v9 == [v5 isLastReference])
        {
          BOOL v8 = 1;
          goto LABEL_14;
        }

        uint64_t v7 = qword_100095BF8;
        if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
        {
LABEL_12:
          BOOL v8 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }

      else
      {
        uint64_t v7 = qword_100095BF8;
      }

      MOLogWrite(v7);
      goto LABEL_12;
    }
  }

  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = -[MIUninstallRecord isLinked](self, "isLinked");
  unsigned int v4 = -[MIUninstallRecord isLastReference](self, "isLastReference");
  uint64_t v5 = 2LL;
  if (!v4) {
    uint64_t v5 = 0LL;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MIUninstallRecord;
  return -[MIUninstallRecord hash](&v7, "hash") ^ (v5 | v3);
}

- (id)ICLUninstallRecord
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___ICLUninstallRecord);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstallRecord bundleIdentifier](self, "bundleIdentifier"));
  -[ICLUninstallRecord setBundleIdentifier:](v3, "setBundleIdentifier:", v4);

  -[ICLUninstallRecord setIsPlaceholder:]( v3,  "setIsPlaceholder:",  -[MIUninstallRecord isPlaceholder](self, "isPlaceholder"));
  -[ICLUninstallRecord setHasParallelPlaceholder:]( v3,  "setHasParallelPlaceholder:",  -[MIUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"));
  return v3;
}

+ (id)uninstallRecordArrayToICLUninstallRecordArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unsigned int v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)i),  "ICLUninstallRecord",  (void)v13));
          -[NSMutableArray addObject:](v4, "addObject:", v10);
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    id v11 = -[NSMutableArray copy](v4, "copy");
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)isLastReference
{
  return self->_isLastReference;
}

- (void)setIsLastReference:(BOOL)a3
{
  self->_isLastReference = a3;
}

- (BOOL)isLinked
{
  return self->_isLinked;
}

- (void)setIsLinked:(BOOL)a3
{
  self->_isLinked = a3;
}

- (BOOL)doesNotHaveBundleContainer
{
  return self->_doesNotHaveBundleContainer;
}

- (void)setDoesNotHaveBundleContainer:(BOOL)a3
{
  self->_doesNotHaveBundleContainer = a3;
}

@end