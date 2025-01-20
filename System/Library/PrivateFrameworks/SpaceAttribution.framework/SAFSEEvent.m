@interface SAFSEEvent
+ (id)initWithFSEventString:(id)a3;
- (NSString)eventType;
- (int)dev;
- (int)residency;
- (int)urgency;
- (int)useState;
- (unint64_t)inode;
- (unint64_t)originID;
- (unint64_t)purgeableATime;
- (unint64_t)size;
- (unint64_t)version;
- (void)setDev:(int)a3;
- (void)setEventType:(id)a3;
- (void)setInode:(unint64_t)a3;
- (void)setOriginID:(unint64_t)a3;
- (void)setPurgeableATime:(unint64_t)a3;
- (void)setResidency:(int)a3;
- (void)setSize:(unint64_t)a3;
- (void)setUrgency:(int)a3;
- (void)setUseState:(int)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation SAFSEEvent

+ (id)initWithFSEventString:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"/"]);
  v5 = v4;
  if (!v4 || (id v4 = [v4 count], (unint64_t)v4 <= 8))
  {
    uint64_t v6 = SALog(v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100032A6C();
    }
LABEL_5:

    v7 = 0LL;
    goto LABEL_6;
  }

  v7 = objc_opt_new(&OBJC_CLASS___SAFSEEvent);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  -[os_log_s setEventType:](v7, "setEventType:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:1]);
  -[os_log_s setVersion:](v7, "setVersion:", [v10 longLongValue]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
  -[os_log_s setDev:](v7, "setDev:", [v11 longLongValue]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:3]);
  -[os_log_s setInode:](v7, "setInode:", [v12 longLongValue]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:4]);
  -[os_log_s setOriginID:](v7, "setOriginID:", [v13 longLongValue]);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:5]);
  -[os_log_s setPurgeableATime:](v7, "setPurgeableATime:", [v14 longLongValue]);

  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:6]);
  unsigned int v16 = [v15 longLongValue];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:7]);
  id v18 = [v17 longLongValue];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:8]);
  -[os_log_s setSize:](v7, "setSize:", [v19 longLongValue]);

  -[os_log_s setUseState:](v7, "setUseState:", (unsigned __int16)v16);
  -[os_log_s setResidency:](v7, "setResidency:", HIWORD(v16));
  unint64_t v20 = __ROR8__(v18, 9);
  if (v20 < 5 && ((0x17u >> v20) & 1) != 0)
  {
    uint64_t v21 = dword_10003C6E8[v20];
  }

  else if (v18 == (id)0x8000)
  {
    uint64_t v21 = 4LL;
  }

  else
  {
    uint64_t v21 = 0xFFFFFFFFLL;
  }

  -[os_log_s setUrgency:](v7, "setUrgency:", v21);
  id v22 = -[os_log_s urgency](v7, "urgency");
  if (v22 >= 5)
  {
    uint64_t v23 = SALog(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100032B3C(v7);
    }

    v7 = 0LL;
  }

  id v25 = -[os_log_s useState](v7, "useState");
  if (v25 >= 7)
  {
    uint64_t v26 = SALog(v25);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100032ACC(v7);
    }

    goto LABEL_5;
  }

- (NSString)eventType
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEventType:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (int)dev
{
  return self->_dev;
}

- (void)setDev:(int)a3
{
  self->_dev = a3;
}

- (unint64_t)inode
{
  return self->_inode;
}

- (void)setInode:(unint64_t)a3
{
  self->_inode = a3;
}

- (int)useState
{
  return self->_useState;
}

- (void)setUseState:(int)a3
{
  self->_useState = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)purgeableATime
{
  return self->_purgeableATime;
}

- (void)setPurgeableATime:(unint64_t)a3
{
  self->_purgeableATime = a3;
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

- (int)residency
{
  return self->_residency;
}

- (void)setResidency:(int)a3
{
  self->_residency = a3;
}

- (unint64_t)originID
{
  return self->_originID;
}

- (void)setOriginID:(unint64_t)a3
{
  self->_originID = a3;
}

- (void).cxx_destruct
{
}

@end