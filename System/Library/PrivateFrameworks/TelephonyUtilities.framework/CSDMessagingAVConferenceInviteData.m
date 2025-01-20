@interface CSDMessagingAVConferenceInviteData
- (BOOL)hasCallInfoBlob;
- (BOOL)hasMediaBlob;
- (BOOL)hasSKEBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingAVConferenceInviteData)initWithFaceTimeInviteDictionary:(id)a3;
- (CSDMessagingAVConferenceInviteData)initWithRelayInviteDictionary:(id)a3;
- (NSData)callInfoBlob;
- (NSData)mediaBlob;
- (NSData)sKEBlob;
- (NSDictionary)faceTimeInviteDictionary;
- (NSDictionary)relayInviteDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallInfoBlob:(id)a3;
- (void)setMediaBlob:(id)a3;
- (void)setSKEBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingAVConferenceInviteData

- (CSDMessagingAVConferenceInviteData)initWithRelayInviteDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[CSDMessagingAVConferenceInviteData init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVConferenceInviteDataMediaBlob]);
    -[CSDMessagingAVConferenceInviteData setMediaBlob:](v5, "setMediaBlob:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVConferenceInviteDataCallInfoBlob]);
    -[CSDMessagingAVConferenceInviteData setCallInfoBlob:](v5, "setCallInfoBlob:", v7);
  }

  return v5;
}

- (CSDMessagingAVConferenceInviteData)initWithFaceTimeInviteDictionary:(id)a3
{
  id v4 = a3;
  v5 = -[CSDMessagingAVConferenceInviteData init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVConferenceInviteDataSKEBlob]);
    -[CSDMessagingAVConferenceInviteData setSKEBlob:](v5, "setSKEBlob:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVConferenceInviteDataMediaBlob]);
    -[CSDMessagingAVConferenceInviteData setMediaBlob:](v5, "setMediaBlob:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AVConferenceInviteDataCallInfoBlob]);
    -[CSDMessagingAVConferenceInviteData setCallInfoBlob:](v5, "setCallInfoBlob:", v8);
  }

  return v5;
}

- (NSDictionary)relayInviteDictionary
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData mediaBlob](self, "mediaBlob"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  AVConferenceInviteDataMediaBlob);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData callInfoBlob](self, "callInfoBlob"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  AVConferenceInviteDataCallInfoBlob);

  return (NSDictionary *)v3;
}

- (NSDictionary)faceTimeInviteDictionary
{
  v3 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 2LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData sKEBlob](self, "sKEBlob"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v4,  AVConferenceInviteDataSKEBlob);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData mediaBlob](self, "mediaBlob"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  AVConferenceInviteDataMediaBlob);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData callInfoBlob](self, "callInfoBlob"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v6,  AVConferenceInviteDataCallInfoBlob);

  return (NSDictionary *)v3;
}

- (BOOL)hasSKEBlob
{
  return self->_sKEBlob != 0LL;
}

- (BOOL)hasMediaBlob
{
  return self->_mediaBlob != 0LL;
}

- (BOOL)hasCallInfoBlob
{
  return self->_callInfoBlob != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingAVConferenceInviteData;
  id v3 = -[CSDMessagingAVConferenceInviteData description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingAVConferenceInviteData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  sKEBlob = self->_sKEBlob;
  if (sKEBlob) {
    [v3 setObject:sKEBlob forKey:@"SKEBlob"];
  }
  mediaBlob = self->_mediaBlob;
  if (mediaBlob) {
    [v4 setObject:mediaBlob forKey:@"mediaBlob"];
  }
  callInfoBlob = self->_callInfoBlob;
  if (callInfoBlob) {
    [v4 setObject:callInfoBlob forKey:@"callInfoBlob"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100089894((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  sKEBlob = self->_sKEBlob;
  id v8 = v4;
  if (sKEBlob)
  {
    PBDataWriterWriteDataField(v4, sKEBlob, 1LL);
    id v4 = v8;
  }

  mediaBlob = self->_mediaBlob;
  if (mediaBlob)
  {
    PBDataWriterWriteDataField(v8, mediaBlob, 2LL);
    id v4 = v8;
  }

  callInfoBlob = self->_callInfoBlob;
  if (callInfoBlob)
  {
    PBDataWriterWriteDataField(v8, callInfoBlob, 3LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_sKEBlob)
  {
    objc_msgSend(v4, "setSKEBlob:");
    id v4 = v5;
  }

  if (self->_mediaBlob)
  {
    objc_msgSend(v5, "setMediaBlob:");
    id v4 = v5;
  }

  if (self->_callInfoBlob)
  {
    objc_msgSend(v5, "setCallInfoBlob:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_sKEBlob, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = -[NSData copyWithZone:](self->_mediaBlob, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NSData copyWithZone:](self->_callInfoBlob, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((sKEBlob = self->_sKEBlob, !((unint64_t)sKEBlob | v4[3]))
     || -[NSData isEqual:](sKEBlob, "isEqual:"))
    && ((mediaBlob = self->_mediaBlob, !((unint64_t)mediaBlob | v4[2]))
     || -[NSData isEqual:](mediaBlob, "isEqual:")))
  {
    callInfoBlob = self->_callInfoBlob;
    else {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSData hash](self->_sKEBlob, "hash");
  unint64_t v4 = (unint64_t)-[NSData hash](self->_mediaBlob, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_callInfoBlob, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[3]) {
    -[CSDMessagingAVConferenceInviteData setSKEBlob:](self, "setSKEBlob:");
  }
  if (v4[2]) {
    -[CSDMessagingAVConferenceInviteData setMediaBlob:](self, "setMediaBlob:");
  }
  if (v4[1]) {
    -[CSDMessagingAVConferenceInviteData setCallInfoBlob:](self, "setCallInfoBlob:");
  }
}

- (NSData)sKEBlob
{
  return self->_sKEBlob;
}

- (void)setSKEBlob:(id)a3
{
}

- (NSData)mediaBlob
{
  return self->_mediaBlob;
}

- (void)setMediaBlob:(id)a3
{
}

- (NSData)callInfoBlob
{
  return self->_callInfoBlob;
}

- (void)setCallInfoBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end