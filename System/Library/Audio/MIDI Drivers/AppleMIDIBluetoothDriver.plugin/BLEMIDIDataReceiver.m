@interface BLEMIDIDataReceiver
- (BLEMIDIDataReceiver)init;
- (BLEMIDIDataReceiver)initWithEndpoint:(unsigned int)a3 owner:(MIDIDriverInterface *)a4;
- (const)nextMIDIEventFrom:(const char *)a3 to:(const char *)a4;
- (id).cxx_construct;
- (unint64_t)nowInMS;
- (void)dealloc;
- (void)unpackValue:(id)a3;
@end

@implementation BLEMIDIDataReceiver

- (BLEMIDIDataReceiver)init
{
  v2 = (os_log_s *)qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "BTLEMIDIDataReceiver.mm";
    __int16 v6 = 1024;
    int v7 = 24;
    _os_log_impl( &dword_0,  v2,  OS_LOG_TYPE_ERROR,  "%25s:%-5d Do not call init. Instead call initWithEndpoint.",  (uint8_t *)&v4,  0x12u);
  }

  return 0LL;
}

- (BLEMIDIDataReceiver)initWithEndpoint:(unsigned int)a3 owner:(MIDIDriverInterface *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BLEMIDIDataReceiver;
  __int16 v6 = -[BLEMIDIDataReceiver init](&v9, "init");
  int v7 = v6;
  if (v6)
  {
    v6->endpoint = a3;
    v6->driver = a4;
    v6->packetEmitter.mEP = a3;
    v6->timeStamper = objc_alloc_init(&OBJC_CLASS___BLEMIDITimeStamper);
    v7->logBuffer[0] = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BLEMIDIDataReceiver;
  -[BLEMIDIDataReceiver dealloc](&v3, "dealloc");
}

- (unint64_t)nowInMS
{
  uint64_t v2 = mach_absolute_time();
  return __udivti3(125 * v2, (v2 * (unsigned __int128)0x7DuLL) >> 64, 3LL, 0LL) / 0xF4240uLL;
}

- (const)nextMIDIEventFrom:(const char *)a3 to:(const char *)a4
{
  unsigned int v4 = *(unsigned __int8 *)a3 >> 4;
  if (v4 > 0xF) {
    goto LABEL_11;
  }
  if (((1 << v4) & 0x4F00) != 0)
  {
LABEL_3:
    v5 = a3 + 3;
    goto LABEL_6;
  }

  if (((1 << v4) & 0x3000) != 0)
  {
LABEL_5:
    v5 = a3 + 2;
    goto LABEL_6;
  }

  if (v4 == 15)
  {
    switch(*a3)
    {
      case 0xF0:
        goto LABEL_11;
      case 0xF1:
      case 0xF3:
        goto LABEL_5;
      case 0xF2:
        goto LABEL_3;
      default:
        v5 = a3 + 1;
        break;
    }
  }

  else
  {
LABEL_11:
    int v7 = a3 + 1;
    do
    {
      v5 = v7;
      if (v7 >= a4) {
        break;
      }
      ++v7;
    }

    while ((*v5 & 0x80000000) == 0);
  }

- (void)unpackValue:(id)a3
{
  driver = self->driver;
  uint64_t v6 = (uint64_t)[a3 length];
  int v7 = (char *)[a3 bytes];
  if (*((_BYTE *)driver + 88)) {
    return;
  }
  v8 = v7;
  unint64_t v9 = -[BLEMIDIDataReceiver nowInMS](self, "nowInMS");
  -[BLEMIDITimeStamper setConnectionIntervalNanos:](self->timeStamper, "setConnectionIntervalNanos:", driver[32]);
  -[BLEMIDITimeStamper setReceiveTime:](self->timeStamper, "setReceiveTime:", v9);
  int v10 = *v8;
  if ((*v8 & 0x80000000) == 0)
  {
    sub_CE2C();
    uint64_t v11 = qword_1DDE8;
    if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)buf = 136315650;
    v54 = "BTLEMIDIDataReceiver.mm";
    __int16 v55 = 1024;
    int v56 = 128;
    __int16 v57 = 1024;
    LODWORD(v58[0]) = v10;
    v12 = "%25s:%-5d ERROR: Bad header received (0x%0X). Discarding.";
    v13 = (os_log_s *)v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 24;
LABEL_58:
    _os_log_impl(&dword_0, v13, v14, v12, buf, v15);
    goto LABEL_59;
  }

  if ((v10 & 0x40) != 0) {
    int v16 = v10 & 0x3F;
  }
  else {
    int v16 = v10 & 0x7F;
  }
  unsigned int v49 = v16;
  if ((v10 & 0x7Fu) > 0x3F)
  {
    sub_CE2C();
    uint64_t v17 = qword_1DDE8;
    if ((v10 & 0x3F) != 0)
    {
      if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_59;
      }
      *(_DWORD *)buf = 136315394;
      v54 = "BTLEMIDIDataReceiver.mm";
      __int16 v55 = 1024;
      int v56 = 146;
      v12 = "%25s:%-5d Invalid control message received. Discarding packet.";
      v13 = (os_log_s *)v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    }

    else
    {
      if (!os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_59;
      }
      *(_DWORD *)buf = 136315394;
      v54 = "BTLEMIDIDataReceiver.mm";
      __int16 v55 = 1024;
      int v56 = 142;
      v12 = "%25s:%-5d Ignoring packet due to kBLEMIDIControlMessageIgnorePayload message.";
      v13 = (os_log_s *)v17;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    }

    uint32_t v15 = 18;
    goto LABEL_58;
  }

  if (v6 < 2)
  {
    unsigned __int16 v48 = 0;
LABEL_50:
    if (self->packetEmitter.mIsDirty)
    {
      if (*(_DWORD *)self->packetEmitter.mBuf) {
        (*((void (**)(BLEMIDIPacketEmitter *, unsigned __int8 *))self->packetEmitter._vptr$MIDIPacketEmitter
      }
         + 2))( &self->packetEmitter,  self->packetEmitter.mBuf);
      self->packetEmitter.mCurPacket = MIDIPacketListInit((MIDIPacketList *)self->packetEmitter.mBuf);
    }

    -[BLEMIDITimeStamper addOffset:](self->timeStamper, "addOffset:", v48, v45);
    return;
  }

  id v45 = a3;
  unint64_t v46 = v9;
  MIDITimeStamp time = 0LL;
  unsigned __int16 v48 = 0;
  uint64_t v18 = 0LL;
  int v19 = 0;
  int v51 = 0;
  v20 = &v8[v6];
  v21 = (char *)(v6 - 1);
  v22 = (unsigned __int8 *)(v8 + 1);
  v47 = (unsigned __int8 *)&v8[v6];
  while (1)
  {
    int v23 = (char)*v22;
    if ((v23 & 0x80000000) == 0)
    {
      if (v22 == (unsigned __int8 *)(v8 + 1))
      {
        MIDITimeStamp time = self->lastSysExTimeStamp;
        if (v22 >= (unsigned __int8 *)v20)
        {
LABEL_42:
          LOWORD(v30) = (_WORD)v21;
        }

        else
        {
          uint64_t v30 = 0LL;
          while (((char)v22[v30] & 0x80000000) == 0)
          {
            if (v47 - v22 == ++v30) {
              goto LABEL_42;
            }
          }

          int v19 = 0;
        }

        goto LABEL_34;
      }

      if (!v19)
      {
        sub_CE2C();
        v41 = (os_log_s *)qword_1DDE8;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "BTLEMIDIDataReceiver.mm";
          __int16 v55 = 1024;
          int v56 = 162;
          _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: Expected a timestamp byte, concurrent running status, or SysEx continuation. The full packe t will be logged below.",  buf,  0x12u);
        }

        +[BLEMIDIAccessor logEvent:length:timeStamp:intoBuffer:]( BLEMIDIAccessor,  "logEvent:length:timeStamp:intoBuffer:",  objc_msgSend(v45, "bytes", v45),  (unsigned __int16)objc_msgSend(v45, "length"),  v46,  self->logBuffer);
        sub_CE2C();
        uint64_t v43 = qword_1DDE8;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v54 = "BTLEMIDIDataReceiver.mm";
          __int16 v55 = 1024;
          int v56 = 164;
          __int16 v57 = 2080;
          v58[0] = self->logBuffer;
          v12 = "%25s:%-5d %s";
LABEL_69:
          v13 = (os_log_s *)v43;
          os_log_type_t v14 = OS_LOG_TYPE_ERROR;
          uint32_t v15 = 28;
          goto LABEL_58;
        }

        goto LABEL_59;
      }

      goto LABEL_20;
    }

    int v50 = v19;
    v24 = v20;
    v26 = (char *)(v22 + 1);
    int v25 = (char)v22[1];
    uint64_t v27 = v23 & 0x7F;
    v28 = v21 - 1;
    v51 |= v27 < v18;
    unsigned __int16 v48 = (unsigned __int16)+[BLEMIDIAccessor reconstructWithHighByte:lowByte:overflow:]( &OBJC_CLASS___BLEMIDIAccessor,  "reconstructWithHighByte:lowByte:overflow:",  v49,  v27,  v51 & 1) & 0x1FFF;
    unint64_t v29 = -[BLEMIDITimeStamper generateTimeStampForOffset:](self->timeStamper, "generateTimeStampForOffset:");
    MIDITimeStamp time = __udivti3(3000000 * v29, (1000000 * v29 * (unsigned __int128)3uLL) >> 64, 125LL, 0LL);
    self->lastSysExTimeStamp = time;
    if (v25 < 0)
    {
      v20 = v24;
      if (*v26 == 245)
      {
        sub_CE2C();
        v38 = (os_log_s *)qword_1DDE8;
        int v19 = v50;
        if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_DEBUG))
        {
          int v39 = v22[1];
          int v40 = v22[2];
          *(_DWORD *)buf = 136315906;
          v54 = "BTLEMIDIDataReceiver.mm";
          __int16 v55 = 1024;
          int v56 = 213;
          __int16 v57 = 1024;
          LODWORD(v58[0]) = v39;
          WORD2(v58[0]) = 1024;
          *(_DWORD *)((char *)v58 + 6) = v40;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_DEBUG,  "%25s:%-5d WARNING: Discarding 2-byte message: 0x%0X 0x%0X",  buf,  0x1Eu);
        }

        v26 = (char *)(v22 + 3);
        v28 = v21 - 3;
      }

      else
      {
        int v19 = v50;
      }

      goto LABEL_21;
    }

    ++v22;
    uint64_t v18 = v27;
    --v21;
    v20 = v24;
    int v19 = v50;
    if (!v50) {
      break;
    }
LABEL_20:
    *(v22 - 1) = v19;
    v28 = v21 + 1;
    uint64_t v27 = v18;
    v26 = (char *)(v22 - 1);
LABEL_21:
    LOWORD(v30) = (unsigned __int16)-[BLEMIDIDataReceiver nextMIDIEventFrom:to:]( self,  "nextMIDIEventFrom:to:",  v26,  v20,  v45)
                - (_WORD)v26;
    unsigned int v31 = *v26;
    int v32 = v31 & 0xF8;
    if (v31 <= 0xF7) {
      v33 = v8;
    }
    else {
      v33 = v26;
    }
    BOOL v34 = v32 == 240;
    if (v32 == 240) {
      v35 = v8;
    }
    else {
      v35 = v33;
    }
    if (v34) {
      int v36 = 0;
    }
    else {
      int v36 = v19;
    }
    if ((char)v31 < -16)
    {
      int v19 = *v26;
    }

    else
    {
      v8 = v35;
      int v19 = v36;
    }

    uint64_t v18 = v27;
    v22 = (unsigned __int8 *)v26;
    v21 = v28;
LABEL_34:
    uint64_t v37 = (unsigned __int16)v30;
    if ((_WORD)v30)
    {
      self->packetEmitter.mIsDirty = 1;
      sub_27DC((uint64_t)&self->packetEmitter, time, (unsigned __int16)v30, v22);
    }

    v21 -= v37;
    v22 += v37;
  }

  sub_CE2C();
  v44 = (os_log_s *)qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "BTLEMIDIDataReceiver.mm";
    __int16 v55 = 1024;
    int v56 = 204;
    _os_log_impl( &dword_0,  v44,  OS_LOG_TYPE_ERROR,  "%25s:%-5d ERROR: Discarding malformed packet. The full packet will be logged below.",  buf,  0x12u);
  }

  +[BLEMIDIAccessor logEvent:length:timeStamp:intoBuffer:]( BLEMIDIAccessor,  "logEvent:length:timeStamp:intoBuffer:",  objc_msgSend(v45, "bytes", v45),  (unsigned __int16)objc_msgSend(v45, "length"),  v46,  self->logBuffer);
  sub_CE2C();
  uint64_t v43 = qword_1DDE8;
  if (os_log_type_enabled((os_log_t)qword_1DDE8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v54 = "BTLEMIDIDataReceiver.mm";
    __int16 v55 = 1024;
    int v56 = 206;
    __int16 v57 = 2080;
    v58[0] = self->logBuffer;
    v12 = "%25s:%-5d %s";
    goto LABEL_69;
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end