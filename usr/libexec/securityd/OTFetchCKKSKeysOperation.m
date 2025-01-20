@interface OTFetchCKKSKeysOperation
- (BOOL)fetchBeforeGettingKeyset;
- (CKKSKeychainView)ckks;
- (NSArray)incompleteKeySets;
- (NSArray)pendingTLKShares;
- (NSArray)viewKeySets;
- (NSSet)viewFilter;
- (NSSet)zonesTimedOutWithoutKeysets;
- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 refetchNeeded:(BOOL)a4;
- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 viewsToFetch:(id)a4;
- (unint64_t)desiredTimeout;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDesiredTimeout:(unint64_t)a3;
- (void)setFetchBeforeGettingKeyset:(BOOL)a3;
- (void)setIncompleteKeySets:(id)a3;
- (void)setPendingTLKShares:(id)a3;
- (void)setViewFilter:(id)a3;
- (void)setViewKeySets:(id)a3;
- (void)setZonesTimedOutWithoutKeysets:(id)a3;
@end

@implementation OTFetchCKKSKeysOperation

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 refetchNeeded:(BOOL)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___OTFetchCKKSKeysOperation;
  v7 = -[CKKSGroupOperation init](&v17, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 ckks]);
    v9 = *(void **)(v7 + 174);
    *(void *)(v7 + 174) = v8;

    v10 = *(void **)(v7 + 182);
    *(void *)(v7 + 182) = 0LL;

    v11 = *(void **)(v7 + 134);
    *(void *)(v7 + 134) = &__NSArray0__struct;

    v12 = *(void **)(v7 + 150);
    *(void *)(v7 + 150) = &__NSArray0__struct;

    v13 = *(void **)(v7 + 142);
    *(void *)(v7 + 142) = &__NSArray0__struct;

    *(void *)(v7 + 166) = 15000000000LL;
    v7[128] = a4;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    v15 = *(void **)(v7 + 158);
    *(void *)(v7 + 158) = v14;
  }

  return (OTFetchCKKSKeysOperation *)v7;
}

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 viewsToFetch:(id)a4
{
  id v7 = a4;
  uint64_t v8 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:]( self,  "initWithDependencies:refetchNeeded:",  a3,  0LL);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)((char *)&v8->_incompleteKeySets + 6), a4);
  }

  return v9;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));

  if (v4)
  {
    v5 = sub_10001267C("octagon-ckks");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for %@", buf, 0xCu);
    }

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchCKKSKeysOperation ckks](self, "ckks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "findKeySets:",  -[OTFetchCKKSKeysOperation fetchBeforeGettingKeyset](self, "fetchBeforeGettingKeyset")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeout:", -[OTFetchCKKSKeysOperation desiredTimeout](self, "desiredTimeout")));
    [v3 addObject:v10];
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10002D944;
  v21[3] = &unk_100290FC8;
  objc_copyWeak(&v23, (id *)buf);
  id v11 = v3;
  id v22 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"proceed-with-ckks-keys",  v21));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v12, "addDependency:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v16), (void)v17);
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }

    while (v14);
  }

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v12);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (NSArray)viewKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setViewKeySets:(id)a3
{
}

- (NSArray)incompleteKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setIncompleteKeySets:(id)a3
{
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setPendingTLKShares:(id)a3
{
}

- (NSSet)zonesTimedOutWithoutKeysets
{
  return (NSSet *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setZonesTimedOutWithoutKeysets:(id)a3
{
}

- (unint64_t)desiredTimeout
{
  return *(void *)(&self->_fetchBeforeGettingKeyset + 6);
}

- (void)setDesiredTimeout:(unint64_t)a3
{
  *(void *)(&self->_fetchBeforeGettingKeyset + 6) = a3;
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setCkks:(id)a3
{
}

- (NSSet)viewFilter
{
  return (NSSet *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setViewFilter:(id)a3
{
}

- (BOOL)fetchBeforeGettingKeyset
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setFetchBeforeGettingKeyset:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end