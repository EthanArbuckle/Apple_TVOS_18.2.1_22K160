@interface _OSLogEventStoreMetadata
- (NSUUID)archiveUUID;
- (NSUUID)sourceUUID;
- (_OSLogEventStoreMetadata)initWithCollection:(id)a3 localStorePlist:(id)a4 liveDataDescriptor:(int)a5;
- (_OSLogEventStoreMetadata)initWithDictionary:(id)a3;
- (_OSLogEventStoreTimeRef)end;
- (_OSLogEventStoreTimeRef)oldestHighVolume;
- (_OSLogEventStoreTimeRef)oldestLive;
- (_OSLogEventStoreTimeRef)oldestPersist;
- (_OSLogEventStoreTimeRef)oldestSignpost;
- (_OSLogEventStoreTimeRef)oldestSpecial;
- (id)timeRefForTTLClass:(unsigned __int8)a3;
@end

@implementation _OSLogEventStoreMetadata

- (_OSLogEventStoreMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[_OSLogEventStoreMetadata init](self, "init");
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"PersistMetadata"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"OldestTimeRef"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v7);
    oldestPersist = v5->_oldestPersist;
    v5->_oldestPersist = v8;

    [v4 objectForKeyedSubscript:@"SpecialMetadata"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"OldestTimeRef"];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v11);
    oldestSpecial = v5->_oldestSpecial;
    v5->_oldestSpecial = v12;

    [v4 objectForKeyedSubscript:@"SignpostMetadata"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"OldestTimeRef"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v15);
    oldestSignpost = v5->_oldestSignpost;
    v5->_oldestSignpost = v16;

    [v4 objectForKeyedSubscript:@"HighVolumeMetadata"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 objectForKeyedSubscript:@"OldestTimeRef"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v19);
    oldestHighVolume = v5->_oldestHighVolume;
    v5->_oldestHighVolume = v20;

    [v4 objectForKeyedSubscript:@"LiveMetadata"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:@"OldestTimeRef"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v23);
    oldestLive = v5->_oldestLive;
    v5->_oldestLive = v24;

    [v4 objectForKeyedSubscript:@"EndTimeRef"];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v47);
    end = v5->_end;
    v5->_end = v26;

    [v4 objectForKeyedSubscript:@"ArchiveIdentifier"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v46];
    archiveUUID = v5->_archiveUUID;
    v5->_archiveUUID = (NSUUID *)v28;

    [v4 objectForKeyedSubscript:@"SourceIdentifier"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v30];
    sourceUUID = v5->_sourceUUID;
    v5->_sourceUUID = (NSUUID *)v31;

    if (!v5->_oldestPersist || !v5->_oldestSpecial || !v5->_oldestLive || !v5->_end)
    {

      v41 = 0LL;
      goto LABEL_15;
    }

    v43 = v23;
    v44 = v11;
    v45 = v7;
    [v4 objectForKeyedSubscript:@"SpecialMetadata"];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 objectForKeyedSubscript:@"TTL"];
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    ttls = (id *)v5->_ttls;
    uint64_t v36 = 8u;
    do
    {
      if (v34)
      {
        [NSString stringWithUTF8String:*(void *)&_OSLogTTLTable[v36]];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 objectForKeyedSubscript:v37];
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v38);
        id v40 = *ttls;
        id *ttls = v39;
      }

      if (!*ttls) {
        objc_storeStrong(ttls, v5->_oldestSpecial);
      }
      v36 += 16LL;
      ++ttls;
    }

    while (v36 != 88);
  }

  v41 = v5;
LABEL_15:

  return v41;
}

- (_OSLogEventStoreMetadata)initWithCollection:(id)a3 localStorePlist:(id)a4 liveDataDescriptor:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v10 = -[_OSLogEventStoreMetadata init](self, "init");
  if (v10)
  {
    uint64_t v11 = _calculateTimeRefForBook(v8, "Persist");
    oldestPersist = v10->_oldestPersist;
    v10->_oldestPersist = (_OSLogEventStoreTimeRef *)v11;

    uint64_t v13 = _calculateTimeRefForBook(v8, "Special");
    oldestSpecial = v10->_oldestSpecial;
    v10->_oldestSpecial = (_OSLogEventStoreTimeRef *)v13;

    uint64_t v15 = _calculateTimeRefForBook(v8, "Signpost");
    oldestSignpost = v10->_oldestSignpost;
    v10->_oldestSignpost = (_OSLogEventStoreTimeRef *)v15;

    if (_OSLogFileFindExhaustivePoint(v5, (uint64_t)v33, (uint64_t)&v32) && *__error() == 2)
    {
      uint64_t v17 = 0LL;
    }

    else
    {
      v18 = objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef);
      uint64_t v17 = -[_OSLogEventStoreTimeRef initWithUUID:continuous:](v18, "initWithUUID:continuous:", v33, v32);
    }

    oldestLive = v10->_oldestLive;
    v10->_oldestLive = (_OSLogEventStoreTimeRef *)v17;

    uint64_t v20 = +[_OSLogEventStoreTimeRef timeRef](&OBJC_CLASS____OSLogEventStoreTimeRef, "timeRef");
    end = v10->_end;
    v10->_end = (_OSLogEventStoreTimeRef *)v20;

    [v9 objectForKeyedSubscript:@"Identifier"];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v31];
    sourceUUID = v10->_sourceUUID;
    v10->_sourceUUID = (NSUUID *)v22;

    objc_storeStrong((id *)&v10->_archiveUUID, v10->_sourceUUID);
    ttls = (id *)v10->_ttls;
    uint64_t v25 = 8u;
    do
    {
      [NSString stringWithUTF8String:*(void *)&_OSLogTTLTable[v25]];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:v26];
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v28 = -[_OSLogEventStoreTimeRef initWithDictionary:]( objc_alloc(&OBJC_CLASS____OSLogEventStoreTimeRef),  "initWithDictionary:",  v27);
      id v29 = *ttls;
      id *ttls = v28;

      if (!*ttls) {
        objc_storeStrong(ttls, v10->_oldestSpecial);
      }

      v25 += 16LL;
      ++ttls;
    }

    while (v25 != 88);
  }

  return v10;
}

- (id)timeRefForTTLClass:(unsigned __int8)a3
{
  return self->_ttls[a3];
}

- (_OSLogEventStoreTimeRef)oldestPersist
{
  return self->_oldestPersist;
}

- (_OSLogEventStoreTimeRef)oldestSpecial
{
  return self->_oldestSpecial;
}

- (_OSLogEventStoreTimeRef)oldestSignpost
{
  return self->_oldestSignpost;
}

- (_OSLogEventStoreTimeRef)oldestHighVolume
{
  return self->_oldestHighVolume;
}

- (_OSLogEventStoreTimeRef)oldestLive
{
  return self->_oldestLive;
}

- (_OSLogEventStoreTimeRef)end
{
  return self->_end;
}

- (NSUUID)archiveUUID
{
  return self->_archiveUUID;
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (void).cxx_destruct
{
  uint64_t v3 = 5LL;
  do
    objc_storeStrong((id *)&(&self->super.isa)[v3--], 0LL);
  while (v3 * 8);
}

@end