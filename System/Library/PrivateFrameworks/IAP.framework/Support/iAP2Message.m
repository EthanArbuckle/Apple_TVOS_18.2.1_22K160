@interface iAP2Message
+ (id)createMsgWithID:(unsigned __int16)a3;
- (iAP2Message)init;
- (iAP2Message)initWithMsgID:(unsigned __int16)a3;
- (id)allocAndAddGroupWithID:(unsigned __int16)a3;
- (id)description;
- (id)getGroupParams;
- (id)getParamArray;
- (int)createParamWithID:(unsigned __int16)a3;
- (int)createParamWithIDAndDataBool:(unsigned __int16)a3 :(BOOL)a4;
- (int)createParamWithIDAndDataInt16:(unsigned __int16)a3 :(signed __int16)a4;
- (int)createParamWithIDAndDataInt32:(unsigned __int16)a3 :(int)a4;
- (int)createParamWithIDAndDataInt64:(unsigned __int16)a3 :(int64_t)a4;
- (int)createParamWithIDAndDataInt8:(unsigned __int16)a3 :(char)a4;
- (int)createParamWithIDAndDataRaw:(unsigned __int16)a3 :(char *)a4 :(unsigned __int16)a5;
- (int)createParamWithIDAndDataU16:(unsigned __int16)a3 :(unsigned __int16)a4;
- (int)createParamWithIDAndDataU32:(unsigned __int16)a3 :(unsigned int)a4;
- (int)createParamWithIDAndDataU64:(unsigned __int16)a3 :(unint64_t)a4;
- (int)createParamWithIDAndDataU8:(unsigned __int16)a3 :(unsigned __int8)a4;
- (int)createParamWithIDAndNSData:(unsigned __int16)a3 :(id)a4;
- (int)createParamWithIDAndNSString:(unsigned __int16)a3 :(id)a4;
- (int)parseMsgBuffer:(unint64_t)a3 :(const char *)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6;
- (int)sendAndClearMessageOnConnection:(id)a3;
- (int)sendAndClearMessageOnConnection:(id)a3 withMessageID:(unsigned __int16)a4;
- (int)sendMessageOnConnection:(id)a3;
- (int)sendMessageOnConnection:(id)a3 withMessageID:(unsigned __int16)a4;
- (unsigned)generateRawMsgBuffer:(char *)a3;
- (unsigned)getMsgID;
- (unsigned)getMsgLen;
- (unsigned)getParamCount;
- (unsigned)getRawMsgLength;
- (void)clearMessage;
- (void)dealloc;
- (void)reinit;
- (void)setGroupParams:(id)a3;
- (void)setMsgID:(unsigned __int16)a3;
@end

@implementation iAP2Message

- (iAP2Message)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___iAP2Message;
  v2 = -[iAP2Message init](&v6, "init");
  v3 = (iAP2Message *)v2;
  if (v2)
  {
    *((_DWORD *)v2 + 6) = 0;
    *((void *)v2 + 1) = 0LL;
    *(void *)(v2 + 14) = 0LL;
    v4 = objc_alloc_init(&OBJC_CLASS___iAP2GroupParam);
    v3->pGroupParams = v4;
    if (!v4)
    {

      return 0LL;
    }
  }

  return v3;
}

- (iAP2Message)initWithMsgID:(unsigned __int16)a3
{
  result = -[iAP2Message init](self, "init");
  if (result) {
    result->msgID = a3;
  }
  return result;
}

- (void)dealloc
{
  self->pGroupParams = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAP2Message;
  -[iAP2Message dealloc](&v3, "dealloc");
}

- (void)reinit
{
  self->msgParseState = 0;
  self->msgTimestampMs = 0LL;
  *(unint64_t *)((char *)&self->msgTimestampMs + 6) = 0LL;
  pGroupParams = self->pGroupParams;
  if (pGroupParams) {
    objc_msgSend(-[iAP2GroupParam getParamArray](pGroupParams, "getParamArray"), "removeAllObjects");
  }
  else {
    self->pGroupParams = objc_alloc_init(&OBJC_CLASS___iAP2GroupParam);
  }
}

+ (id)createMsgWithID:(unsigned __int16)a3
{
  return -[iAP2Message initWithMsgID:](objc_alloc(&OBJC_CLASS___iAP2Message), "initWithMsgID:", a3);
}

- (int)createParamWithID:(unsigned __int16)a3
{
  id v4 = +[iAP2Param createParamWithID:](&OBJC_CLASS___iAP2Param, "createParamWithID:", a3);
  if (!v4) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v4);
  return 0;
}

- (int)createParamWithIDAndDataRaw:(unsigned __int16)a3 :(char *)a4 :(unsigned __int16)a5
{
  id v6 = +[iAP2Param createParamWithIDAndDataRaw:::]( &OBJC_CLASS___iAP2Param,  "createParamWithIDAndDataRaw:::",  a3,  a4,  a5);
  if (!v6) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v6);
  return 0;
}

- (int)createParamWithIDAndDataBool:(unsigned __int16)a3 :(BOOL)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataBool::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataBool::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataU8:(unsigned __int16)a3 :(unsigned __int8)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU8::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU8::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataU16:(unsigned __int16)a3 :(unsigned __int16)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU16::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU16::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataU32:(unsigned __int16)a3 :(unsigned int)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU32::]( &OBJC_CLASS___iAP2Param,  "createParamWithIDAndDataU32::",  a3,  *(void *)&a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataU64:(unsigned __int16)a3 :(unint64_t)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataU64::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataU64::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataInt8:(unsigned __int16)a3 :(char)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataInt8::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataInt8::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataInt16:(unsigned __int16)a3 :(signed __int16)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataInt16::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataInt16::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataInt32:(unsigned __int16)a3 :(int)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataInt32::]( &OBJC_CLASS___iAP2Param,  "createParamWithIDAndDataInt32::",  a3,  *(void *)&a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndDataInt64:(unsigned __int16)a3 :(int64_t)a4
{
  id v5 = +[iAP2Param createParamWithIDAndDataInt64::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndDataInt64::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndNSData:(unsigned __int16)a3 :(id)a4
{
  id v5 = +[iAP2Param createParamWithIDAndNSData::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndNSData::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (int)createParamWithIDAndNSString:(unsigned __int16)a3 :(id)a4
{
  id v5 = +[iAP2Param createParamWithIDAndNSString::](&OBJC_CLASS___iAP2Param, "createParamWithIDAndNSString::", a3, a4);
  if (!v5) {
    return 12;
  }
  objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v5);
  return 0;
}

- (id)allocAndAddGroupWithID:(unsigned __int16)a3
{
  id v4 = +[iAP2GroupParam allocGroupParamID:](&OBJC_CLASS___iAP2GroupParam, "allocGroupParamID:", a3);
  if (v4) {
    objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "addObject:", v4);
  }
  return v4;
}

- (int)parseMsgBuffer:(unint64_t)a3 :(const char *)a4 :(unsigned __int16)a5 :(unsigned __int16 *)a6
{
  int v6 = 102;
  if (!a6) {
    return v6;
  }
  if (!a5) {
    return v6;
  }
  v8 = a4;
  if (!a4 || self->msgParseState > 6u) {
    return v6;
  }
  int v6 = 36;
  int v12 = a5;
  while (2)
  {
    if (v6 != 36) {
      goto LABEL_40;
    }
    int msgParseState = self->msgParseState;
    if (msgParseState == 7) {
      goto LABEL_40;
    }
    v15 = v8 + 1;
    int v14 = *(unsigned __int8 *)v8;
    int v16 = v12 - 1;
    switch(msgParseState)
    {
      case 0:
        if (v14 != 64) {
          goto LABEL_28;
        }
        int v17 = 1;
        goto LABEL_20;
      case 1:
        if (v14 == 64)
        {
          int v17 = 2;
          goto LABEL_20;
        }

- (unsigned)getMsgID
{
  return self->msgID;
}

- (void)setMsgID:(unsigned __int16)a3
{
  self->msgID = a3;
}

- (unsigned)getMsgLen
{
  return self->msgLen;
}

- (unsigned)getParamCount
{
  return (unsigned __int16)objc_msgSend(-[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray"), "count");
}

- (id)getParamArray
{
  return -[iAP2GroupParam getParamArray](self->pGroupParams, "getParamArray");
}

- (id)getGroupParams
{
  return self->pGroupParams;
}

- (void)setGroupParams:(id)a3
{
  id v5 = a3;

  self->pGroupParams = (iAP2GroupParam *)a3;
}

- (unsigned)getRawMsgLength
{
  pGroupParams = self->pGroupParams;
  if (!pGroupParams) {
    return 6;
  }
  unsigned int v3 = -[iAP2GroupParam getRawGroupParamLength](pGroupParams, "getRawGroupParamLength");
  unsigned __int16 v4 = v3 + 2;
  if (v3 > 0xFFFD) {
    unsigned __int16 v4 = 0;
  }
  if (!v3) {
    return 0;
  }
  return v4;
}

- (unsigned)generateRawMsgBuffer:(char *)a3
{
  unsigned int v5 = -[iAP2Message getRawMsgLength](self, "getRawMsgLength");
  if (v5 < 6) {
    goto LABEL_6;
  }
  if (self->pGroupParams) {
    unsigned int v5 = -[iAP2GroupParam generateRawGroupParamBuffer:](self->pGroupParams, "generateRawGroupParamBuffer:", a3 + 2) + 2;
  }
  *(_WORD *)a3 = 16448;
  *((_WORD *)a3 + 1) = bswap32(v5) >> 16;
  *((_WORD *)a3 + 2) = bswap32(self->msgID) >> 16;
  if (v5 >= 0x10000)
  {
    syslog(3, "ERROR: Line %04d: Msg raw length exceeds valid range: %04X !\n", 2984, v5);
LABEL_6:
    LOWORD(v5) = 0;
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<iAP2Message>(%hhx): ID=0x%04X Len=%u\n%@",  self,  self->msgID,  self->msgLen,  -[iAP2GroupParam description](self->pGroupParams, "description"));
}

- (int)sendMessageOnConnection:(id)a3
{
  unsigned int v5 = (os_log_s *)qword_1000222C0;
  if (os_log_type_enabled((os_log_t)qword_1000222C0, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = off_100022270;
    __int16 v9 = 2080;
    v10 = off_1000221D0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[#%s] (%s) [FUNCTION TRACE] Entering function...",  (uint8_t *)&v7,  0x16u);
  }

  if (a3) {
    return objc_msgSend(objc_msgSend(a3, "ControlSession"), "transmitiAP2Msg:", self);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000136C0();
  }
  return -1;
}

- (int)sendMessageOnConnection:(id)a3 withMessageID:(unsigned __int16)a4
{
  return -[iAP2Message sendMessageOnConnection:](self, "sendMessageOnConnection:", a3);
}

- (int)sendAndClearMessageOnConnection:(id)a3
{
  unsigned int v5 = (os_log_s *)qword_1000222C0;
  if (os_log_type_enabled((os_log_t)qword_1000222C0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    __int16 v9 = off_100022270;
    __int16 v10 = 2080;
    v11 = off_1000221D0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[#%s] (%s) [FUNCTION TRACE] Entering function...",  (uint8_t *)&v8,  0x16u);
  }

  int v6 = -[iAP2Message sendMessageOnConnection:](self, "sendMessageOnConnection:", a3);
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100013764();
    }
  }

  else
  {
    -[iAP2Message clearMessage](self, "clearMessage");
  }

  return v6;
}

- (int)sendAndClearMessageOnConnection:(id)a3 withMessageID:(unsigned __int16)a4
{
  return -[iAP2Message sendAndClearMessageOnConnection:](self, "sendAndClearMessageOnConnection:", a3);
}

- (void)clearMessage
{
  unsigned int v3 = (os_log_s *)qword_1000222C0;
  if (os_log_type_enabled((os_log_t)qword_1000222C0, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unsigned int v5 = off_100022270;
    __int16 v6 = 2080;
    int v7 = off_1000221D0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#%s] (%s) [FUNCTION TRACE] Entering function...",  (uint8_t *)&v4,  0x16u);
  }

  objc_msgSend(-[iAP2Message getParamArray](self, "getParamArray"), "removeAllObjects");
}

  ;
}

@end