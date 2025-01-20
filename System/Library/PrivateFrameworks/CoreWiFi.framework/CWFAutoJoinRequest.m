@interface CWFAutoJoinRequest
- (BOOL)allowAutoHotspotFallback;
- (BOOL)throttled;
- (CWFAutoJoinParameters)parameters;
- (NSDate)addedAt;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (void)setAddedAt:(id)a3;
- (void)setAllowAutoHotspotFallback:(BOOL)a3;
- (void)setParameters:(id)a3;
- (void)setReply:(id)a3;
- (void)setThrottled:(BOOL)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFAutoJoinRequest

- (id)description
{
  v6 = (void *)NSString;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v7, v8, 5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1864535C8(self->_addedAt);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_( v6,  v13,  (uint64_t)@"uuid=%@, addedAt=%@, params=%@, autoHotspot=%d, throttled=%d",  v14,  v15,  v11,  v12,  self->_parameters,  self->_allowAutoHotspotFallback,  self->_throttled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinRequest, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setParameters_(v11, v15, (uint64_t)self->_parameters, v16, v17);
  objc_msgSend_setAllowAutoHotspotFallback_(v11, v18, self->_allowAutoHotspotFallback, v19, v20);
  objc_msgSend_setAddedAt_(v11, v21, (uint64_t)self->_addedAt, v22, v23);
  objc_msgSend_setThrottled_(v11, v24, self->_throttled, v25, v26);
  objc_msgSend_setReply_(v11, v27, (uint64_t)self->_reply, v28, v29);
  return v11;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (CWFAutoJoinParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)allowAutoHotspotFallback
{
  return self->_allowAutoHotspotFallback;
}

- (void)setAllowAutoHotspotFallback:(BOOL)a3
{
  self->_allowAutoHotspotFallback = a3;
}

- (NSDate)addedAt
{
  return self->_addedAt;
}

- (void)setAddedAt:(id)a3
{
}

- (BOOL)throttled
{
  return self->_throttled;
}

- (void)setThrottled:(BOOL)a3
{
  self->_throttled = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
}

@end