@interface CLHLocationAwareRequestArchive
- (CLHLocationAwareRequestArchive)initWithClassifier:(id)a3 rootDirectory:(id)a4 basename:(id)a5 requestCode:(int)a6 itemCountThresholdForAutoCleanUp:(int)a7;
- (CLHRequestArchive)homeArchive;
- (CLHRequestArchive)mainArchive;
- (CLHRequestArchive)workArchive;
- (id)jsonObject;
- (int64_t)classifyLoiTypeForLocation:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)eraseAllData;
- (void)pruneSecondaryDataOlderThan:(double)a3;
- (void)writeSecondaryObject:(id)a3 collectedAt:(id)a4 toField:(unsigned int)a5;
@end

@implementation CLHLocationAwareRequestArchive

- (CLHLocationAwareRequestArchive)initWithClassifier:(id)a3 rootDirectory:(id)a4 basename:(id)a5 requestCode:(int)a6 itemCountThresholdForAutoCleanUp:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLHLocationAwareRequestArchive;
  v12 = -[CLHLocationAwareRequestArchive init](&v17, "init");
  if (v12)
  {
    v12->_classifier = (CLHLocationClassifier *)a3;
    id v13 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", @"-home"));
    id v14 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", @"-work"));
    id v15 = objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a5, "stringByAppendingString:", @"-main"));
    v12->_homeArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( [CLHRequestArchive alloc],  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  [v13 path],  v8,  v7);
    v12->_workArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( [CLHRequestArchive alloc],  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  [v14 path],  v8,  v7);
    v12->_mainArchive = -[CLHRequestArchive initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:]( [CLHRequestArchive alloc],  "initWithDirectory:requestCode:itemCountThresholdForAutoCleanUp:",  [v15 path],  v8,  v7);
  }

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHLocationAwareRequestArchive;
  -[CLHLocationAwareRequestArchive dealloc](&v3, "dealloc");
}

- (unint64_t)count
{
  unint64_t v3 = -[CLHRequestArchive totalCountIncludingAllSubArchives](self->_homeArchive, "totalCountIncludingAllSubArchives");
  v4 = (char *)-[CLHRequestArchive totalCountIncludingAllSubArchives]( self->_workArchive,  "totalCountIncludingAllSubArchives")
     + v3;
  return -[CLHRequestArchive totalCountIncludingAllSubArchives](self->_mainArchive, "totalCountIncludingAllSubArchives")
       + (void)v4;
}

- (int64_t)classifyLoiTypeForLocation:(id)a3
{
  return -[CLHLocationClassifier loiTypeForLocation:](self->_classifier, "loiTypeForLocation:", a3);
}

- (void)writeSecondaryObject:(id)a3 collectedAt:(id)a4 toField:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  int64_t v8 = -[CLHLocationAwareRequestArchive classifyLoiTypeForLocation:](self, "classifyLoiTypeForLocation:", a4);
  uint64_t v9 = 4LL;
  if (v8 == 1) {
    uint64_t v9 = 3LL;
  }
  if (!v8) {
    uint64_t v9 = 2LL;
  }
  -[objc_class writeSecondaryObject:toField:]((&self->super.isa)[v9], "writeSecondaryObject:toField:", a3, v5);
}

- (void)pruneSecondaryDataOlderThan:(double)a3
{
  __int128 v16 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 3LL);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 isActiveSubArchive])
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472LL;
          v10[2] = sub_100E56384;
          v10[3] = &unk_101888038;
          *(double *)&v10[4] = a3;
          [v9 iterateSubArchivesWithHandler:v10];
        }

        else
        {
          [v9 pruneSecondaryDataOlderThan:a3];
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

- (id)jsonObject
{
  v4[0] = @"homeArchive";
  v5[0] = -[CLHRequestArchive jsonObject](self->_homeArchive, "jsonObject");
  v4[1] = @"workArchive";
  v5[1] = -[CLHRequestArchive jsonObject](self->_workArchive, "jsonObject");
  v4[2] = @"mainArchive";
  v5[2] = -[CLHRequestArchive jsonObject](self->_mainArchive, "jsonObject");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  3LL);
}

- (void)eraseAllData
{
  __int128 v13 = *(_OWORD *)&self->_homeArchive;
  mainArchive = self->_mainArchive;
  v2 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 3LL);
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if ([v7 isActiveSubArchive])
        {
          [v7 iterateSubArchivesWithHandler:&stru_101888078];
          [v7 generateNewSubArchive];
        }

        else
        {
          [v7 eraseAllData];
        }
      }

      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v4);
  }

- (CLHRequestArchive)homeArchive
{
  return self->_homeArchive;
}

- (CLHRequestArchive)workArchive
{
  return self->_workArchive;
}

- (CLHRequestArchive)mainArchive
{
  return self->_mainArchive;
}

@end