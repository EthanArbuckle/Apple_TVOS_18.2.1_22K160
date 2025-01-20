@interface PDCloudStoreTokenRecordFetchConfiguration
- (BOOL)hasCloudStoreZones;
- (BOOL)hasContainerDatabase;
- (BOOL)ignoreChangesMadeByThisDevice;
- (BOOL)shouldSaveToken;
- (BOOL)useStoredChangeToken;
- (NSDate)ignoreRecordsAfterDate;
- (NSDate)ignoreRecordsBeforeDate;
- (NSSet)cloudStoreZonesAndChangeTokens;
- (PDCloudStoreContainerDatabase)containerDatabase;
- (id)description;
- (int64_t)batchLimit;
- (void)setBatchLimit:(int64_t)a3;
- (void)setCloudStoreZonesAndChangeTokens:(id)a3;
- (void)setContainerDatabase:(id)a3;
- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3;
- (void)setIgnoreRecordsAfterDate:(id)a3;
- (void)setIgnoreRecordsBeforeDate:(id)a3;
- (void)setShouldSaveToken:(BOOL)a3;
- (void)setUseStoredChangeToken:(BOOL)a3;
@end

@implementation PDCloudStoreTokenRecordFetchConfiguration

- (BOOL)hasCloudStoreZones
{
  if (!-[NSSet count](self->_cloudStoreZonesAndChangeTokens, "count")) {
    return 0;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = self->_cloudStoreZonesAndChangeTokens;
  id v4 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "cloudStoreZone", (void)v11));

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }

      id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)hasContainerDatabase
{
  return self->_containerDatabase != 0LL;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  if (self->_useStoredChangeToken) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"useStoredChangeToken: '%@'; ", v5);
  if (self->_shouldSaveToken) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"shouldSaveToken: '%@'; ", v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"containerDatabase: '%@'; ", self->_containerDatabase);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"cloudStoreZonesAndChangeTokens: '%@'; ",
    self->_cloudStoreZonesAndChangeTokens);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"ignoreRecordsAfterDate: '%@'; ",
    self->_ignoreRecordsAfterDate);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"ignoreRecordsBeforeDate: '%@'; ",
    self->_ignoreRecordsBeforeDate);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return v3;
}

- (BOOL)useStoredChangeToken
{
  return self->_useStoredChangeToken;
}

- (void)setUseStoredChangeToken:(BOOL)a3
{
  self->_useStoredChangeToken = a3;
}

- (BOOL)shouldSaveToken
{
  return self->_shouldSaveToken;
}

- (void)setShouldSaveToken:(BOOL)a3
{
  self->_shouldSaveToken = a3;
}

- (BOOL)ignoreChangesMadeByThisDevice
{
  return self->_ignoreChangesMadeByThisDevice;
}

- (void)setIgnoreChangesMadeByThisDevice:(BOOL)a3
{
  self->_ignoreChangesMadeByThisDevice = a3;
}

- (int64_t)batchLimit
{
  return self->_batchLimit;
}

- (void)setBatchLimit:(int64_t)a3
{
  self->_batchLimit = a3;
}

- (NSSet)cloudStoreZonesAndChangeTokens
{
  return self->_cloudStoreZonesAndChangeTokens;
}

- (void)setCloudStoreZonesAndChangeTokens:(id)a3
{
}

- (PDCloudStoreContainerDatabase)containerDatabase
{
  return self->_containerDatabase;
}

- (void)setContainerDatabase:(id)a3
{
}

- (NSDate)ignoreRecordsBeforeDate
{
  return self->_ignoreRecordsBeforeDate;
}

- (void)setIgnoreRecordsBeforeDate:(id)a3
{
}

- (NSDate)ignoreRecordsAfterDate
{
  return self->_ignoreRecordsAfterDate;
}

- (void)setIgnoreRecordsAfterDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end