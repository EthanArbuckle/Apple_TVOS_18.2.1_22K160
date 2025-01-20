@interface MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications
- (NSMutableArray)addedOutputDevices;
- (NSMutableArray)changedOutputDevices;
- (NSMutableArray)removedOutputDevices;
- (id)description;
- (void)addOutputDevice:(id)a3;
- (void)changeOutputDevice:(id)a3;
- (void)removeOutputDevice:(id)a3;
- (void)setAddedOutputDevices:(id)a3;
- (void)setChangedOutputDevices:(id)a3;
- (void)setRemovedOutputDevices:(id)a3;
@end

@implementation MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications

- (id)description
{
  v3 = -[NSMutableString initWithString:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithString:", @"{\n");
  if (-[NSMutableArray count](self->_addedOutputDevices, "count"))
  {
    uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(self->_addedOutputDevices);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"   addedOutputDevices = %@\n", v5);
  }

  if (-[NSMutableArray count](self->_changedOutputDevices, "count"))
  {
    uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(self->_changedOutputDevices);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    changedOutputDevices = %@\n", v7);
  }

  if (-[NSMutableArray count](self->_removedOutputDevices, "count"))
  {
    uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject(self->_removedOutputDevices);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"    removedOutputDevices = %@\n", v9);
  }

  return v3;
}

- (void)addOutputDevice:(id)a3
{
  id v4 = a3;
  addedOutputDevices = self->_addedOutputDevices;
  id v8 = v4;
  if (!addedOutputDevices)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_addedOutputDevices;
    self->_addedOutputDevices = v6;

    id v4 = v8;
    addedOutputDevices = self->_addedOutputDevices;
  }

  -[NSMutableArray addObject:](addedOutputDevices, "addObject:", v4);
  -[NSMutableArray removeObject:](self->_changedOutputDevices, "removeObject:", v8);
  -[NSMutableArray removeObject:](self->_removedOutputDevices, "removeObject:", v8);
}

- (void)changeOutputDevice:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_addedOutputDevices, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    changedOutputDevices = self->_changedOutputDevices;
    if (!changedOutputDevices)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v7 = self->_changedOutputDevices;
      self->_changedOutputDevices = v6;

      changedOutputDevices = self->_changedOutputDevices;
    }

    -[NSMutableArray addObject:](changedOutputDevices, "addObject:", v8);
  }

  else
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:]( self->_addedOutputDevices,  "replaceObjectAtIndex:withObject:",  v4,  v8);
  }
}

- (void)removeOutputDevice:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_addedOutputDevices, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    removedOutputDevices = self->_removedOutputDevices;
    if (!removedOutputDevices)
    {
      uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v7 = self->_removedOutputDevices;
      self->_removedOutputDevices = v6;

      removedOutputDevices = self->_removedOutputDevices;
    }

    -[NSMutableArray addObject:](removedOutputDevices, "addObject:", v8);
    -[NSMutableArray removeObject:](self->_changedOutputDevices, "removeObject:", v8);
  }

  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_addedOutputDevices, "removeObjectAtIndex:", v4);
  }
}

- (NSMutableArray)addedOutputDevices
{
  return self->_addedOutputDevices;
}

- (void)setAddedOutputDevices:(id)a3
{
}

- (NSMutableArray)changedOutputDevices
{
  return self->_changedOutputDevices;
}

- (void)setChangedOutputDevices:(id)a3
{
}

- (NSMutableArray)removedOutputDevices
{
  return self->_removedOutputDevices;
}

- (void)setRemovedOutputDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end