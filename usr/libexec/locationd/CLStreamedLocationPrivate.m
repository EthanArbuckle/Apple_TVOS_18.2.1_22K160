@interface CLStreamedLocationPrivate
- (BOOL)hasDeltaDistance;
- (BOOL)hasDeltaDistanceAccuracy;
- (BOOL)hasGroundAltitude;
- (BOOL)hasGroundAltitudeUncertainty;
- (BOOL)hasMaxAbsSlope;
- (BOOL)hasOdometer;
- (BOOL)hasSlope;
- (BOOL)hasTimestampGps;
- (BOOL)hasTropicalSavannaBranchCount;
- (BOOL)hasTropicalSavannaProximity;
- (BOOL)hasTropicalSavannaTreeId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLDaemonLocationPrivate)daemonLocationPrivate;
- (CLStreamedLocationPrivate)initWithDaemonLocationPrivate:(const void *)a3;
- (double)deltaDistance;
- (double)deltaDistanceAccuracy;
- (double)groundAltitude;
- (double)groundAltitudeUncertainty;
- (double)maxAbsSlope;
- (double)odometer;
- (double)slope;
- (double)timestampGps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tropicalSavannaProximityAsString:(int)a3;
- (int)StringAsTropicalSavannaProximity:(id)a3;
- (int)tropicalSavannaProximity;
- (unint64_t)hash;
- (unint64_t)tropicalSavannaTreeId;
- (unsigned)tropicalSavannaBranchCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeltaDistance:(double)a3;
- (void)setDeltaDistanceAccuracy:(double)a3;
- (void)setGroundAltitude:(double)a3;
- (void)setGroundAltitudeUncertainty:(double)a3;
- (void)setHasDeltaDistance:(BOOL)a3;
- (void)setHasDeltaDistanceAccuracy:(BOOL)a3;
- (void)setHasGroundAltitude:(BOOL)a3;
- (void)setHasGroundAltitudeUncertainty:(BOOL)a3;
- (void)setHasMaxAbsSlope:(BOOL)a3;
- (void)setHasOdometer:(BOOL)a3;
- (void)setHasSlope:(BOOL)a3;
- (void)setHasTimestampGps:(BOOL)a3;
- (void)setHasTropicalSavannaBranchCount:(BOOL)a3;
- (void)setHasTropicalSavannaProximity:(BOOL)a3;
- (void)setHasTropicalSavannaTreeId:(BOOL)a3;
- (void)setMaxAbsSlope:(double)a3;
- (void)setOdometer:(double)a3;
- (void)setSlope:(double)a3;
- (void)setTimestampGps:(double)a3;
- (void)setTropicalSavannaBranchCount:(unsigned int)a3;
- (void)setTropicalSavannaProximity:(int)a3;
- (void)setTropicalSavannaTreeId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLStreamedLocationPrivate

- (CLStreamedLocationPrivate)initWithDaemonLocationPrivate:(const void *)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_10199DBC0);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_10199DBC0))
  {
    sub_100869DC8(&qword_10199D940);
    __cxa_atexit((void (*)(void *))sub_100869DCC, &qword_10199D940, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_10199DBC0);
  }

  v6 = -[CLStreamedLocationPrivate init](self, "init");
  v7 = v6;
  if (v6)
  {
    int v8 = *((_DWORD *)a3 + 69);
    if (v8 == dword_10199DA54) {
      goto LABEL_30;
    }
    if (v8 == 3)
    {
      uint64_t v9 = 4LL;
    }

    else
    {
      if (v8 != 4)
      {
LABEL_25:
        if (qword_101934990 != -1) {
          dispatch_once(&qword_101934990, &stru_10187D9D8);
        }
        v10 = (os_log_s *)qword_101934998;
        if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67174657;
          LODWORD(v33) = -[CLStreamedLocationPrivate tropicalSavannaProximity](v7, "tropicalSavannaProximity");
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Trackrun,Sending tropicalSavannaProximity,%{private}d",  buf,  8u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934990 != -1) {
            dispatch_once(&qword_101934990, &stru_10187D9D8);
          }
          uint64_t v18 = qword_101934998;
          int v30 = 67174657;
          LODWORD(v31) = -[CLStreamedLocationPrivate tropicalSavannaProximity](v7, "tropicalSavannaProximity");
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  0LL,  "Trackrun,Sending tropicalSavannaProximity,%{private}d",  &v30,  8);
          v20 = (uint8_t *)v19;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStreamedLocationPrivate(ConversionSupport) initWithDaemonLocationPrivate:]",  "%s\n",  v19);
          if (v20 != buf) {
            free(v20);
          }
        }

- (CLDaemonLocationPrivate)daemonLocationPrivate
{
  if (-[CLStreamedLocationPrivate hasOdometer](self, "hasOdometer", sub_100869DC8(retstr).n128_f64[0]))
  {
    -[CLStreamedLocationPrivate odometer](self, "odometer");
    retstr->var0 = v5;
  }

  if (-[CLStreamedLocationPrivate hasDeltaDistance](self, "hasDeltaDistance"))
  {
    -[CLStreamedLocationPrivate deltaDistance](self, "deltaDistance");
    retstr->var1 = v6;
  }

  if (-[CLStreamedLocationPrivate hasDeltaDistanceAccuracy](self, "hasDeltaDistanceAccuracy"))
  {
    -[CLStreamedLocationPrivate deltaDistanceAccuracy](self, "deltaDistanceAccuracy");
    retstr->var2 = v7;
  }

  if (-[CLStreamedLocationPrivate hasTimestampGps](self, "hasTimestampGps"))
  {
    -[CLStreamedLocationPrivate timestampGps](self, "timestampGps");
    retstr->var3 = v8;
  }

  if (-[CLStreamedLocationPrivate hasSlope](self, "hasSlope"))
  {
    -[CLStreamedLocationPrivate slope](self, "slope");
    retstr->var25 = v9;
  }

  if (-[CLStreamedLocationPrivate hasMaxAbsSlope](self, "hasMaxAbsSlope"))
  {
    -[CLStreamedLocationPrivate maxAbsSlope](self, "maxAbsSlope");
    retstr->var26 = v10;
  }

  if (-[CLStreamedLocationPrivate hasGroundAltitude](self, "hasGroundAltitude"))
  {
    -[CLStreamedLocationPrivate groundAltitude](self, "groundAltitude");
    retstr->var27 = v11;
  }

  if (-[CLStreamedLocationPrivate hasGroundAltitudeUncertainty](self, "hasGroundAltitudeUncertainty"))
  {
    -[CLStreamedLocationPrivate groundAltitudeUncertainty](self, "groundAltitudeUncertainty");
    retstr->var28 = v12;
  }

  if (-[CLStreamedLocationPrivate hasTropicalSavannaProximity](self, "hasTropicalSavannaProximity"))
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_10187D9D8);
    }
    unsigned int v13 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174657;
      LODWORD(v35) = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Trackrun,Received tropicalSavannaProximity,%{private}d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10187D9D8);
      }
      uint64_t v20 = qword_101934998;
      int v32 = 67174657;
      LODWORD(v33) = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "Trackrun,Received tropicalSavannaProximity,%{private}d",  &v32,  8);
      unsigned int v22 = (uint8_t *)v21;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]",  "%s\n",  v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    unsigned int v14 = -[CLStreamedLocationPrivate tropicalSavannaProximity](self, "tropicalSavannaProximity");
    if (v14 <= 5) {
      retstr->var16.var6 = dword_101359B44[v14];
    }
  }

  if (-[CLStreamedLocationPrivate hasTropicalSavannaBranchCount](self, "hasTropicalSavannaBranchCount"))
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_10187D9D8);
    }
    v15 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
      *(_DWORD *)buf = 67174657;
      LODWORD(v35) = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Trackrun,Received tropicalSavannaBranchCount,%{private}u",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10187D9D8);
      }
      uint64_t v23 = qword_101934998;
      unsigned int v24 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
      int v32 = 67174657;
      LODWORD(v33) = v24;
      LODWORD(v31) = 8;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  0LL,  "Trackrun,Received tropicalSavannaBranchCount,%{private}u",  &v32,  v31);
      unint64_t v26 = (uint8_t *)v25;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]",  "%s\n",  v25);
      if (v26 != buf) {
        free(v26);
      }
    }

    retstr->var16.var4 = -[CLStreamedLocationPrivate tropicalSavannaBranchCount](self, "tropicalSavannaBranchCount");
  }

  result = (CLDaemonLocationPrivate *)-[CLStreamedLocationPrivate hasTropicalSavannaTreeId]( self,  "hasTropicalSavannaTreeId");
  if ((_DWORD)result)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_10187D9D8);
    }
    uint64_t v18 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
      *(_DWORD *)buf = 134283521;
      unint64_t v35 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Trackrun,Received tropicalSavannaTreeId,%{private}llu",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_10187D9D8);
      }
      uint64_t v27 = qword_101934998;
      unint64_t v28 = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
      int v32 = 134283521;
      unint64_t v33 = v28;
      LODWORD(v31) = 12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v27,  0LL,  "Trackrun,Received tropicalSavannaTreeId,%{private}llu",  &v32,  v31);
      int v30 = (uint8_t *)v29;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStreamedLocationPrivate(ConversionSupport) daemonLocationPrivate]",  "%s\n",  v29);
      if (v30 != buf) {
        free(v30);
      }
    }

    result = -[CLStreamedLocationPrivate tropicalSavannaTreeId](self, "tropicalSavannaTreeId");
    retstr->var16.var2 = (unint64_t)result;
  }

  return result;
}

- (void)setOdometer:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_odometer = a3;
}

- (void)setHasOdometer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOdometer
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDeltaDistance:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_deltaDistance = a3;
}

- (void)setHasDeltaDistance:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDeltaDistance
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDeltaDistanceAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_deltaDistanceAccuracy = a3;
}

- (void)setHasDeltaDistanceAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDeltaDistanceAccuracy
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimestampGps:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_timestampGps = a3;
}

- (void)setHasTimestampGps:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTimestampGps
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_slope = a3;
}

- (void)setHasSlope:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSlope
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMaxAbsSlope:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_maxAbsSlope = a3;
}

- (void)setHasMaxAbsSlope:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMaxAbsSlope
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGroundAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_groundAltitude = a3;
}

- (void)setHasGroundAltitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGroundAltitude
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGroundAltitudeUncertainty:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groundAltitudeUncertainty = a3;
}

- (void)setHasGroundAltitudeUncertainty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroundAltitudeUncertainty
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)tropicalSavannaProximity
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_tropicalSavannaProximity;
  }
  else {
    return 0;
  }
}

- (void)setTropicalSavannaProximity:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_tropicalSavannaProximity = a3;
}

- (void)setHasTropicalSavannaProximity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTropicalSavannaProximity
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)tropicalSavannaProximityAsString:(int)a3
{
  if (a3 >= 6) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3);
  }
  else {
    return *(&off_10187F910 + a3);
  }
}

- (int)StringAsTropicalSavannaProximity:(id)a3
{
  return 0;
}

- (void)setTropicalSavannaBranchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_tropicalSavannaBranchCount = a3;
}

- (void)setHasTropicalSavannaBranchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTropicalSavannaBranchCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTropicalSavannaTreeId:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tropicalSavannaTreeId = a3;
}

- (void)setHasTropicalSavannaTreeId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTropicalSavannaTreeId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamedLocationPrivate;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  -[CLStreamedLocationPrivate description](&v3, "description"),  -[CLStreamedLocationPrivate dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_odometer),  @"odometer");
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }

  objc_msgSend( v3,  "setObject:forKey:",  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_deltaDistance),  @"deltaDistance");
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (BOOL)readFrom:(id)a3
{
  return sub_100D0DB78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1LL, self->_odometer);
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteDoubleField(a3, 2LL, self->_deltaDistance);
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = *(void *)&self->_odometer;
    *((_WORD *)a3 + 44) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((void *)a3 + 1) = *(void *)&self->_deltaDistance;
  *((_WORD *)a3 + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  id result = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = *(void *)&self->_odometer;
    *((_WORD *)result + 44) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }

  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }

  *((void *)result + 1) = *(void *)&self->_deltaDistance;
  *((_WORD *)result + 44) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7)
  {
    __int16 has = (__int16)self->_has;
    __int16 v9 = *((_WORD *)a3 + 44);
    if ((has & 0x20) != 0)
    {
    }

    else if ((v9 & 0x20) != 0)
    {
LABEL_56:
      LOBYTE(v7) = 0;
      return v7;
    }

    if ((has & 1) != 0)
    {
    }

    else if ((v9 & 1) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 2) != 0)
    {
    }

    else if ((v9 & 2) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 0x80) != 0)
    {
    }

    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 0x40) != 0)
    {
    }

    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 0x10) != 0)
    {
    }

    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 4) != 0)
    {
    }

    else if ((v9 & 4) != 0)
    {
      goto LABEL_56;
    }

    if ((has & 8) != 0)
    {
    }

    else if ((v9 & 8) != 0)
    {
      goto LABEL_56;
    }

    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x400) == 0 || self->_tropicalSavannaProximity != *((_DWORD *)a3 + 21)) {
        goto LABEL_56;
      }
    }

    else if ((*((_WORD *)a3 + 44) & 0x400) != 0)
    {
      goto LABEL_56;
    }

    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x200) == 0 || self->_tropicalSavannaBranchCount != *((_DWORD *)a3 + 20)) {
        goto LABEL_56;
      }
    }

    else if ((*((_WORD *)a3 + 44) & 0x200) != 0)
    {
      goto LABEL_56;
    }

    LOBYTE(v7) = (v9 & 0x100) == 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 44) & 0x100) == 0 || self->_tropicalSavannaTreeId != *((void *)a3 + 9)) {
        goto LABEL_56;
      }
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    double odometer = self->_odometer;
    double v6 = -odometer;
    if (odometer >= 0.0) {
      double v6 = self->_odometer;
    }
    double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }

    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  if ((has & 1) != 0)
  {
    double deltaDistance = self->_deltaDistance;
    double v11 = -deltaDistance;
    if (deltaDistance >= 0.0) {
      double v11 = self->_deltaDistance;
    }
    double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }

    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  if ((has & 2) != 0)
  {
    double deltaDistanceAccuracy = self->_deltaDistanceAccuracy;
    double v16 = -deltaDistanceAccuracy;
    if (deltaDistanceAccuracy >= 0.0) {
      double v16 = self->_deltaDistanceAccuracy;
    }
    double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }

    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  if ((has & 0x80) != 0)
  {
    double timestampGps = self->_timestampGps;
    double v21 = -timestampGps;
    if (timestampGps >= 0.0) {
      double v21 = self->_timestampGps;
    }
    double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }

    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }

  else
  {
    unint64_t v19 = 0LL;
  }

  if ((has & 0x40) != 0)
  {
    double slope = self->_slope;
    double v26 = -slope;
    if (slope >= 0.0) {
      double v26 = self->_slope;
    }
    double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }

    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }

  else
  {
    unint64_t v24 = 0LL;
  }

  if ((has & 0x10) != 0)
  {
    double maxAbsSlope = self->_maxAbsSlope;
    double v31 = -maxAbsSlope;
    if (maxAbsSlope >= 0.0) {
      double v31 = self->_maxAbsSlope;
    }
    double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }

    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }

  else
  {
    unint64_t v29 = 0LL;
  }

  if ((has & 4) != 0)
  {
    double groundAltitude = self->_groundAltitude;
    double v36 = -groundAltitude;
    if (groundAltitude >= 0.0) {
      double v36 = self->_groundAltitude;
    }
    double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }

    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }

  else
  {
    unint64_t v34 = 0LL;
  }

  if ((has & 8) != 0)
  {
    double groundAltitudeUncertainty = self->_groundAltitudeUncertainty;
    double v41 = -groundAltitudeUncertainty;
    double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }

    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }

  else
  {
    unint64_t v39 = 0LL;
  }

  if ((has & 0x400) == 0)
  {
    uint64_t v44 = 0LL;
    if ((has & 0x200) != 0) {
      goto LABEL_67;
    }
LABEL_70:
    uint64_t v45 = 0LL;
    if ((has & 0x100) != 0) {
      goto LABEL_68;
    }
LABEL_71:
    unint64_t v46 = 0LL;
    return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
  }

  uint64_t v44 = 2654435761LL * self->_tropicalSavannaProximity;
  if ((has & 0x200) == 0) {
    goto LABEL_70;
  }
LABEL_67:
  uint64_t v45 = 2654435761LL * self->_tropicalSavannaBranchCount;
  if ((has & 0x100) == 0) {
    goto LABEL_71;
  }
LABEL_68:
  unint64_t v46 = 2654435761u * self->_tropicalSavannaTreeId;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v45 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 0x20) != 0)
  {
    self->_double odometer = *((double *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v3 = *((_WORD *)a3 + 44);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }

  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }

  self->_double deltaDistance = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }

- (double)odometer
{
  return self->_odometer;
}

- (double)deltaDistance
{
  return self->_deltaDistance;
}

- (double)deltaDistanceAccuracy
{
  return self->_deltaDistanceAccuracy;
}

- (double)timestampGps
{
  return self->_timestampGps;
}

- (double)slope
{
  return self->_slope;
}

- (double)maxAbsSlope
{
  return self->_maxAbsSlope;
}

- (double)groundAltitude
{
  return self->_groundAltitude;
}

- (double)groundAltitudeUncertainty
{
  return self->_groundAltitudeUncertainty;
}

- (unsigned)tropicalSavannaBranchCount
{
  return self->_tropicalSavannaBranchCount;
}

- (unint64_t)tropicalSavannaTreeId
{
  return self->_tropicalSavannaTreeId;
}

@end