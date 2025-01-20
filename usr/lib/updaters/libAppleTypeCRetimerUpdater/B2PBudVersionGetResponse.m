@interface B2PBudVersionGetResponse
- (BOOL)parseResponse:(id)a3;
- (NSString)activeVersion;
- (NSString)pendingVersion;
- (id)description;
- (unint64_t)activeMinor;
- (unint64_t)pendingMinor;
- (unsigned)activeFile;
- (unsigned)activeMajor;
- (unsigned)activeRevision;
- (unsigned)pendingFile;
- (unsigned)pendingMajor;
- (unsigned)pendingRevision;
@end

@implementation B2PBudVersionGetResponse

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 0x1A)
  {
    uint64_t v6 = [v4 bytes];
    self->_activeMajor = *(_WORD *)v6;
    self->_activeMinor = *(void *)(v6 + 2);
    self->_activeRevision = *(_WORD *)(v6 + 10);
    self->_pendingMajor = *(_WORD *)(v6 + 12);
    self->_pendingMinor = *(void *)(v6 + 14);
    self->_pendingRevision = *(_WORD *)(v6 + 22);
    self->_activeFile = *(_BYTE *)(v6 + 24);
    self->_pendingFile = *(_BYTE *)(v6 + 25);
  }

  return v5 > 0x19;
}

- (NSString)activeVersion
{
  return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"%u.%llu.%u",  self->_activeMajor,  self->_activeMinor,  self->_activeRevision);
}

- (NSString)pendingVersion
{
  return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"%u.%llu.%u",  self->_pendingMajor,  self->_pendingMinor,  self->_pendingRevision);
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___B2PBudVersionGetResponse;
  -[B2PResponse description](&v10, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[B2PBudVersionGetResponse activeVersion](self, "activeVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"\tActive Version: %@\n", v6];

  objc_msgSend( v5,  "appendFormat:",  @"\tActive File: %u\n",  -[B2PBudVersionGetResponse activeFile](self, "activeFile"));
  v7 = -[B2PBudVersionGetResponse pendingVersion](self, "pendingVersion");
  [v5 appendFormat:@"\tPending Version: %@\n", v7];

  objc_msgSend( v5,  "appendFormat:",  @"\tPending File: %u\n",  -[B2PBudVersionGetResponse pendingFile](self, "pendingFile"));
  [NSString stringWithString:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)activeMajor
{
  return self->_activeMajor;
}

- (unint64_t)activeMinor
{
  return self->_activeMinor;
}

- (unsigned)activeRevision
{
  return self->_activeRevision;
}

- (unsigned)pendingMajor
{
  return self->_pendingMajor;
}

- (unint64_t)pendingMinor
{
  return self->_pendingMinor;
}

- (unsigned)pendingRevision
{
  return self->_pendingRevision;
}

- (unsigned)activeFile
{
  return self->_activeFile;
}

- (unsigned)pendingFile
{
  return self->_pendingFile;
}

@end