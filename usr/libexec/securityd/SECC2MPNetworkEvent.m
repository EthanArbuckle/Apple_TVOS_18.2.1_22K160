@interface SECC2MPNetworkEvent
- (BOOL)hasNetworkConnectionReused;
- (BOOL)hasNetworkConnectionUuid;
- (BOOL)hasNetworkFatalError;
- (BOOL)hasNetworkHostname;
- (BOOL)hasNetworkInterfaceIdentifier;
- (BOOL)hasNetworkPreviousAttemptCount;
- (BOOL)hasNetworkProtocolName;
- (BOOL)hasNetworkRemoteAddresssAndPort;
- (BOOL)hasNetworkRequestBodyBytesSent;
- (BOOL)hasNetworkRequestHeaderSize;
- (BOOL)hasNetworkRequestUri;
- (BOOL)hasNetworkResponseBodyBytesReceived;
- (BOOL)hasNetworkResponseHeaderSize;
- (BOOL)hasNetworkStatusCode;
- (BOOL)hasNetworkTaskDescription;
- (BOOL)hasOptionsAllowExpensiveAccess;
- (BOOL)hasOptionsAllowPowerNapScheduling;
- (BOOL)hasOptionsAppleIdContext;
- (BOOL)hasOptionsOutOfProcess;
- (BOOL)hasOptionsOutOfProcessForceDiscretionary;
- (BOOL)hasOptionsQualityOfService;
- (BOOL)hasOptionsSourceApplicationBundleIdentifier;
- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier;
- (BOOL)hasOptionsTimeoutIntervalForRequest;
- (BOOL)hasOptionsTimeoutIntervalForResource;
- (BOOL)hasOptionsTlsPinningRequired;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasTimestampC2Init;
- (BOOL)hasTimestampC2Now;
- (BOOL)hasTimestampC2Start;
- (BOOL)hasTimestampDnsEnd;
- (BOOL)hasTimestampDnsStart;
- (BOOL)hasTimestampRequestEnd;
- (BOOL)hasTimestampRequestStart;
- (BOOL)hasTimestampResponseEnd;
- (BOOL)hasTimestampResponseStart;
- (BOOL)hasTimestampSslStart;
- (BOOL)hasTimestampTcpEnd;
- (BOOL)hasTimestampTcpStart;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkConnectionReused;
- (BOOL)optionsAllowExpensiveAccess;
- (BOOL)optionsAllowPowerNapScheduling;
- (BOOL)optionsAppleIdContext;
- (BOOL)optionsOutOfProcess;
- (BOOL)optionsOutOfProcessForceDiscretionary;
- (BOOL)optionsTlsPinningRequired;
- (BOOL)readFrom:(id)a3;
- (NSString)networkConnectionUuid;
- (NSString)networkHostname;
- (NSString)networkInterfaceIdentifier;
- (NSString)networkProtocolName;
- (NSString)networkRemoteAddresssAndPort;
- (NSString)networkRequestUri;
- (NSString)networkTaskDescription;
- (NSString)optionsQualityOfService;
- (NSString)optionsSourceApplicationBundleIdentifier;
- (NSString)optionsSourceApplicationSecondaryIdentifier;
- (SECC2MPError)networkFatalError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)networkRequestBodyBytesSent;
- (unint64_t)networkResponseBodyBytesReceived;
- (unint64_t)networkStatusCode;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)timestampC2Init;
- (unint64_t)timestampC2Now;
- (unint64_t)timestampC2Start;
- (unint64_t)timestampDnsEnd;
- (unint64_t)timestampDnsStart;
- (unint64_t)timestampRequestEnd;
- (unint64_t)timestampRequestStart;
- (unint64_t)timestampResponseEnd;
- (unint64_t)timestampResponseStart;
- (unint64_t)timestampSslStart;
- (unint64_t)timestampTcpEnd;
- (unint64_t)timestampTcpStart;
- (unint64_t)triggers;
- (unsigned)networkPreviousAttemptCount;
- (unsigned)networkRequestHeaderSize;
- (unsigned)networkResponseHeaderSize;
- (unsigned)optionsTimeoutIntervalForRequest;
- (unsigned)optionsTimeoutIntervalForResource;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNetworkConnectionReused:(BOOL)a3;
- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3;
- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3;
- (void)setHasNetworkRequestHeaderSize:(BOOL)a3;
- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3;
- (void)setHasNetworkResponseHeaderSize:(BOOL)a3;
- (void)setHasNetworkStatusCode:(BOOL)a3;
- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setHasOptionsAppleIdContext:(BOOL)a3;
- (void)setHasOptionsOutOfProcess:(BOOL)a3;
- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3;
- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3;
- (void)setHasOptionsTlsPinningRequired:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasTimestampC2Init:(BOOL)a3;
- (void)setHasTimestampC2Now:(BOOL)a3;
- (void)setHasTimestampC2Start:(BOOL)a3;
- (void)setHasTimestampDnsEnd:(BOOL)a3;
- (void)setHasTimestampDnsStart:(BOOL)a3;
- (void)setHasTimestampRequestEnd:(BOOL)a3;
- (void)setHasTimestampRequestStart:(BOOL)a3;
- (void)setHasTimestampResponseEnd:(BOOL)a3;
- (void)setHasTimestampResponseStart:(BOOL)a3;
- (void)setHasTimestampSslStart:(BOOL)a3;
- (void)setHasTimestampTcpEnd:(BOOL)a3;
- (void)setHasTimestampTcpStart:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setNetworkConnectionReused:(BOOL)a3;
- (void)setNetworkConnectionUuid:(id)a3;
- (void)setNetworkFatalError:(id)a3;
- (void)setNetworkHostname:(id)a3;
- (void)setNetworkInterfaceIdentifier:(id)a3;
- (void)setNetworkPreviousAttemptCount:(unsigned int)a3;
- (void)setNetworkProtocolName:(id)a3;
- (void)setNetworkRemoteAddresssAndPort:(id)a3;
- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3;
- (void)setNetworkRequestHeaderSize:(unsigned int)a3;
- (void)setNetworkRequestUri:(id)a3;
- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3;
- (void)setNetworkResponseHeaderSize:(unsigned int)a3;
- (void)setNetworkStatusCode:(unint64_t)a3;
- (void)setNetworkTaskDescription:(id)a3;
- (void)setOptionsAllowExpensiveAccess:(BOOL)a3;
- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3;
- (void)setOptionsAppleIdContext:(BOOL)a3;
- (void)setOptionsOutOfProcess:(BOOL)a3;
- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3;
- (void)setOptionsQualityOfService:(id)a3;
- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3;
- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3;
- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3;
- (void)setOptionsTlsPinningRequired:(BOOL)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setTimestampC2Init:(unint64_t)a3;
- (void)setTimestampC2Now:(unint64_t)a3;
- (void)setTimestampC2Start:(unint64_t)a3;
- (void)setTimestampDnsEnd:(unint64_t)a3;
- (void)setTimestampDnsStart:(unint64_t)a3;
- (void)setTimestampRequestEnd:(unint64_t)a3;
- (void)setTimestampRequestStart:(unint64_t)a3;
- (void)setTimestampResponseEnd:(unint64_t)a3;
- (void)setTimestampResponseStart:(unint64_t)a3;
- (void)setTimestampSslStart:(unint64_t)a3;
- (void)setTimestampTcpEnd:(unint64_t)a3;
- (void)setTimestampTcpStart:(unint64_t)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPNetworkEvent

- (void)setTriggers:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_triggers = a3;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTriggers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_reportFrequency = a3;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasReportFrequency
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_reportFrequencyBase = a3;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasReportFrequencyBase
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasNetworkTaskDescription
{
  return self->_networkTaskDescription != 0LL;
}

- (BOOL)hasNetworkHostname
{
  return self->_networkHostname != 0LL;
}

- (BOOL)hasNetworkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort != 0LL;
}

- (BOOL)hasNetworkConnectionUuid
{
  return self->_networkConnectionUuid != 0LL;
}

- (void)setNetworkConnectionReused:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_networkConnectionReused = a3;
}

- (void)setHasNetworkConnectionReused:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasNetworkConnectionReused
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNetworkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier != 0LL;
}

- (BOOL)hasNetworkProtocolName
{
  return self->_networkProtocolName != 0LL;
}

- (void)setNetworkRequestHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_networkRequestHeaderSize = a3;
}

- (void)setHasNetworkRequestHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasNetworkRequestHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setNetworkRequestBodyBytesSent:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_networkRequestBodyBytesSent = a3;
}

- (void)setHasNetworkRequestBodyBytesSent:(BOOL)a3
{
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNetworkRequestBodyBytesSent
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setNetworkResponseHeaderSize:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_networkResponseHeaderSize = a3;
}

- (void)setHasNetworkResponseHeaderSize:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasNetworkResponseHeaderSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setNetworkResponseBodyBytesReceived:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_networkResponseBodyBytesReceived = a3;
}

- (void)setHasNetworkResponseBodyBytesReceived:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNetworkResponseBodyBytesReceived
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNetworkPreviousAttemptCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_networkPreviousAttemptCount = a3;
}

- (void)setHasNetworkPreviousAttemptCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetworkPreviousAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasNetworkFatalError
{
  return self->_networkFatalError != 0LL;
}

- (void)setNetworkStatusCode:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_networkStatusCode = a3;
}

- (void)setHasNetworkStatusCode:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNetworkStatusCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNetworkRequestUri
{
  return self->_networkRequestUri != 0LL;
}

- (void)setTimestampC2Init:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestampC2Init = a3;
}

- (void)setHasTimestampC2Init:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTimestampC2Init
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTimestampC2Start:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_timestampC2Start = a3;
}

- (void)setHasTimestampC2Start:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestampC2Start
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setTimestampC2Now:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_timestampC2Now = a3;
}

- (void)setHasTimestampC2Now:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTimestampC2Now
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTimestampDnsStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_timestampDnsStart = a3;
}

- (void)setHasTimestampDnsStart:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTimestampDnsStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTimestampDnsEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_timestampDnsEnd = a3;
}

- (void)setHasTimestampDnsEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTimestampDnsEnd
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setTimestampTcpStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_timestampTcpStart = a3;
}

- (void)setHasTimestampTcpStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTimestampTcpStart
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTimestampTcpEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timestampTcpEnd = a3;
}

- (void)setHasTimestampTcpEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimestampTcpEnd
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTimestampSslStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_timestampSslStart = a3;
}

- (void)setHasTimestampSslStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTimestampSslStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTimestampRequestStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_timestampRequestStart = a3;
}

- (void)setHasTimestampRequestStart:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTimestampRequestStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTimestampRequestEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_timestampRequestEnd = a3;
}

- (void)setHasTimestampRequestEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTimestampRequestEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTimestampResponseStart:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timestampResponseStart = a3;
}

- (void)setHasTimestampResponseStart:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTimestampResponseStart
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTimestampResponseEnd:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_timestampResponseEnd = a3;
}

- (void)setHasTimestampResponseEnd:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTimestampResponseEnd
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasOptionsQualityOfService
{
  return self->_optionsQualityOfService != 0LL;
}

- (void)setOptionsOutOfProcess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_optionsOutOfProcess = a3;
}

- (void)setHasOptionsOutOfProcess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcess
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_optionsOutOfProcessForceDiscretionary = a3;
}

- (void)setHasOptionsOutOfProcessForceDiscretionary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOptionsOutOfProcessForceDiscretionary
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setOptionsAllowExpensiveAccess:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_optionsAllowExpensiveAccess = a3;
}

- (void)setHasOptionsAllowExpensiveAccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasOptionsAllowExpensiveAccess
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setOptionsAllowPowerNapScheduling:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_optionsAllowPowerNapScheduling = a3;
}

- (void)setHasOptionsAllowPowerNapScheduling:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasOptionsAllowPowerNapScheduling
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setOptionsTimeoutIntervalForRequest:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_optionsTimeoutIntervalForRequest = a3;
}

- (void)setHasOptionsTimeoutIntervalForRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOptionsTimeoutIntervalForResource:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_optionsTimeoutIntervalForResource = a3;
}

- (void)setHasOptionsTimeoutIntervalForResource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasOptionsTimeoutIntervalForResource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasOptionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier != 0LL;
}

- (BOOL)hasOptionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier != 0LL;
}

- (void)setOptionsAppleIdContext:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_optionsAppleIdContext = a3;
}

- (void)setHasOptionsAppleIdContext:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasOptionsAppleIdContext
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setOptionsTlsPinningRequired:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_optionsTlsPinningRequired = a3;
}

- (void)setHasOptionsTlsPinningRequired:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AF884E7ED10AB980613DA027D2B84F87)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasOptionsTlsPinningRequired
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECC2MPNetworkEvent;
  id v3 = -[SECC2MPNetworkEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPNetworkEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_triggers));
    [v3 setObject:v31 forKey:@"triggers"];

    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportFrequency));
  [v3 setObject:v32 forKey:@"report_frequency"];

  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_reportFrequencyBase));
    [v3 setObject:v5 forKey:@"report_frequency_base"];
  }

- (BOOL)readFrom:(id)a3
{
  return sub_10016A928((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    PBDataWriterWriteUint64Field(v20, self->_triggers, 1LL);
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }

  PBDataWriterWriteUint64Field(v20, self->_reportFrequency, 2LL);
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field(v20, self->_reportFrequencyBase, 3LL);
LABEL_5:
  networkTaskDescription = self->_networkTaskDescription;
  if (networkTaskDescription) {
    PBDataWriterWriteStringField(v20, networkTaskDescription, 101LL);
  }
  networkHostname = self->_networkHostname;
  if (networkHostname) {
    PBDataWriterWriteStringField(v20, networkHostname, 102LL);
  }
  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if (networkRemoteAddresssAndPort) {
    PBDataWriterWriteStringField(v20, networkRemoteAddresssAndPort, 103LL);
  }
  networkConnectionUuid = self->_networkConnectionUuid;
  if (networkConnectionUuid) {
    PBDataWriterWriteStringField(v20, networkConnectionUuid, 104LL);
  }
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0) {
    PBDataWriterWriteBOOLField(v20, self->_networkConnectionReused, 105LL);
  }
  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if (networkInterfaceIdentifier) {
    PBDataWriterWriteStringField(v20, networkInterfaceIdentifier, 106LL);
  }
  networkProtocolName = self->_networkProtocolName;
  if (networkProtocolName) {
    PBDataWriterWriteStringField(v20, networkProtocolName, 107LL);
  }
  $AF884E7ED10AB980613DA027D2B84F87 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    PBDataWriterWriteUint32Field(v20, self->_networkRequestHeaderSize, 108LL);
    $AF884E7ED10AB980613DA027D2B84F87 v11 = self->_has;
    if ((*(_BYTE *)&v11 & 1) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v11 & 0x100000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_67;
    }
  }

  else if ((*(_BYTE *)&v11 & 1) == 0)
  {
    goto LABEL_21;
  }

  PBDataWriterWriteUint64Field(v20, self->_networkRequestBodyBytesSent, 109LL);
  $AF884E7ED10AB980613DA027D2B84F87 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v11 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_68;
  }

- (void)copyTo:(id)a3
{
  v4 = a3;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v4[18] = self->_triggers;
    *((_DWORD *)v4 + 70) |= 0x20000u;
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }

  v4[4] = self->_reportFrequency;
  *((_DWORD *)v4 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4[5] = self->_reportFrequencyBase;
    *((_DWORD *)v4 + 70) |= 0x10u;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  $AF884E7ED10AB980613DA027D2B84F87 v6 = v5;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    v5[18] = self->_triggers;
    *((_DWORD *)v5 + 70) |= 0x20000u;
    $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
    if ((*(_BYTE *)&has & 8) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((*(_BYTE *)&has & 8) == 0)
  {
    goto LABEL_3;
  }

  v5[4] = self->_reportFrequency;
  *((_DWORD *)v5 + 70) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v5[5] = self->_reportFrequencyBase;
    *((_DWORD *)v5 + 70) |= 0x10u;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  int v6 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_triggers != *((void *)v4 + 18)) {
      goto LABEL_193;
    }
  }

  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_reportFrequency != *((void *)v4 + 4)) {
      goto LABEL_193;
    }
  }

  else if ((v6 & 8) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_reportFrequencyBase != *((void *)v4 + 5)) {
      goto LABEL_193;
    }
  }

  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_193;
  }

  networkTaskDescription = self->_networkTaskDescription;
  if ((unint64_t)networkTaskDescription | *((void *)v4 + 29)
    && !-[NSString isEqual:](networkTaskDescription, "isEqual:"))
  {
    goto LABEL_193;
  }

  networkHostname = self->_networkHostname;
  if ((unint64_t)networkHostname | *((void *)v4 + 21))
  {
  }

  networkRemoteAddresssAndPort = self->_networkRemoteAddresssAndPort;
  if ((unint64_t)networkRemoteAddresssAndPort | *((void *)v4 + 25))
  {
  }

  networkConnectionUuid = self->_networkConnectionUuid;
  if ((unint64_t)networkConnectionUuid | *((void *)v4 + 19))
  {
  }

  int v11 = *((_DWORD *)v4 + 70);
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
  {
    if ((v11 & 0x800000) == 0) {
      goto LABEL_193;
    }
    if (self->_networkConnectionReused)
    {
      if (!*((_BYTE *)v4 + 272)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 272))
    {
      goto LABEL_193;
    }
  }

  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_193;
  }

  networkInterfaceIdentifier = self->_networkInterfaceIdentifier;
  if ((unint64_t)networkInterfaceIdentifier | *((void *)v4 + 22)
    && !-[NSString isEqual:](networkInterfaceIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }

  networkProtocolName = self->_networkProtocolName;
  if ((unint64_t)networkProtocolName | *((void *)v4 + 24))
  {
  }

  $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_networkRequestHeaderSize != *((_DWORD *)v4 + 52)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_networkRequestBodyBytesSent != *((void *)v4 + 1)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 1) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x100000) != 0)
  {
    if ((v15 & 0x100000) == 0 || self->_networkResponseHeaderSize != *((_DWORD *)v4 + 56)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x100000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_networkResponseBodyBytesReceived != *((void *)v4 + 2)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 2) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_networkPreviousAttemptCount != *((_DWORD *)v4 + 46)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_193;
  }

  networkFatalError = self->_networkFatalError;
  if ((unint64_t)networkFatalError | *((void *)v4 + 20))
  {
    if (!-[SECC2MPError isEqual:](networkFatalError, "isEqual:")) {
      goto LABEL_193;
    }
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }

  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_networkStatusCode != *((void *)v4 + 3)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 4) != 0)
  {
    goto LABEL_193;
  }

  networkRequestUri = self->_networkRequestUri;
  if ((unint64_t)networkRequestUri | *((void *)v4 + 27))
  {
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }

  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_timestampC2Init != *((void *)v4 + 6)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_timestampC2Start != *((void *)v4 + 8)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_timestampC2Now != *((void *)v4 + 7)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_timestampDnsStart != *((void *)v4 + 10)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_timestampDnsEnd != *((void *)v4 + 9)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_timestampTcpStart != *((void *)v4 + 17)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0 || self->_timestampTcpEnd != *((void *)v4 + 16)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_timestampSslStart != *((void *)v4 + 15)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v15 & 0x800) == 0 || self->_timestampRequestStart != *((void *)v4 + 12)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x800) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_timestampRequestEnd != *((void *)v4 + 11)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_timestampResponseStart != *((void *)v4 + 14)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_timestampResponseEnd != *((void *)v4 + 13)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_193;
  }

  optionsQualityOfService = self->_optionsQualityOfService;
  if ((unint64_t)optionsQualityOfService | *((void *)v4 + 30))
  {
    $AF884E7ED10AB980613DA027D2B84F87 v14 = self->_has;
    int v15 = *((_DWORD *)v4 + 70);
  }

  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsOutOfProcess)
    {
      if (!*((_BYTE *)v4 + 276)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 276))
    {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v15 & 0x10000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsOutOfProcessForceDiscretionary)
    {
      if (!*((_BYTE *)v4 + 277)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 277))
    {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x10000000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    if ((v15 & 0x1000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAllowExpensiveAccess)
    {
      if (!*((_BYTE *)v4 + 273)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 273))
    {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x1000000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAllowPowerNapScheduling)
    {
      if (!*((_BYTE *)v4 + 274)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 274))
    {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    if ((v15 & 0x200000) == 0 || self->_optionsTimeoutIntervalForRequest != *((_DWORD *)v4 + 66)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x200000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v14 & 0x400000) != 0)
  {
    if ((v15 & 0x400000) == 0 || self->_optionsTimeoutIntervalForResource != *((_DWORD *)v4 + 67)) {
      goto LABEL_193;
    }
  }

  else if ((v15 & 0x400000) != 0)
  {
    goto LABEL_193;
  }

  optionsSourceApplicationBundleIdentifier = self->_optionsSourceApplicationBundleIdentifier;
  if ((unint64_t)optionsSourceApplicationBundleIdentifier | *((void *)v4 + 31)
    && !-[NSString isEqual:](optionsSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_193;
  }

  optionsSourceApplicationSecondaryIdentifier = self->_optionsSourceApplicationSecondaryIdentifier;
  if ((unint64_t)optionsSourceApplicationSecondaryIdentifier | *((void *)v4 + 32))
  {
  }

  $AF884E7ED10AB980613DA027D2B84F87 v21 = self->_has;
  int v22 = *((_DWORD *)v4 + 70);
  if ((*(_DWORD *)&v21 & 0x4000000) != 0)
  {
    if ((v22 & 0x4000000) == 0) {
      goto LABEL_193;
    }
    if (self->_optionsAppleIdContext)
    {
      if (!*((_BYTE *)v4 + 275)) {
        goto LABEL_193;
      }
    }

    else if (*((_BYTE *)v4 + 275))
    {
      goto LABEL_193;
    }
  }

  else if ((v22 & 0x4000000) != 0)
  {
    goto LABEL_193;
  }

  if ((*(_DWORD *)&v21 & 0x20000000) != 0)
  {
    if ((v22 & 0x20000000) != 0)
    {
      if (self->_optionsTlsPinningRequired)
      {
        if (!*((_BYTE *)v4 + 278)) {
          goto LABEL_193;
        }
      }

      else if (*((_BYTE *)v4 + 278))
      {
        goto LABEL_193;
      }

      BOOL v23 = 1;
      goto LABEL_194;
    }

- (unint64_t)hash
{
  $AF884E7ED10AB980613DA027D2B84F87 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
    unint64_t v50 = 0LL;
    if ((*(_BYTE *)&has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v49 = 0LL;
    if ((*(_BYTE *)&has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  unint64_t v50 = 2654435761u * self->_triggers;
  if ((*(_BYTE *)&has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v49 = 2654435761u * self->_reportFrequency;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_4:
    unint64_t v48 = 2654435761u * self->_reportFrequencyBase;
    goto LABEL_8;
  }

- (void)mergeFrom:(id)a3
{
  $AF884E7ED10AB980613DA027D2B84F87 v4 = (unint64_t *)a3;
  $AF884E7ED10AB980613DA027D2B84F87 v5 = v4;
  int v6 = *((_DWORD *)v4 + 70);
  if ((v6 & 0x20000) != 0)
  {
    self->_triggers = v4[18];
    *(_DWORD *)&self->_has |= 0x20000u;
    int v6 = *((_DWORD *)v4 + 70);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((v6 & 8) == 0)
  {
    goto LABEL_3;
  }

  self->_reportFrequency = v4[4];
  *(_DWORD *)&self->_has |= 8u;
  if ((v4[35] & 0x10) != 0)
  {
LABEL_4:
    self->_reportFrequencyBase = v4[5];
    *(_DWORD *)&self->_has |= 0x10u;
  }

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (NSString)networkTaskDescription
{
  return self->_networkTaskDescription;
}

- (void)setNetworkTaskDescription:(id)a3
{
}

- (NSString)networkHostname
{
  return self->_networkHostname;
}

- (void)setNetworkHostname:(id)a3
{
}

- (NSString)networkRemoteAddresssAndPort
{
  return self->_networkRemoteAddresssAndPort;
}

- (void)setNetworkRemoteAddresssAndPort:(id)a3
{
}

- (NSString)networkConnectionUuid
{
  return self->_networkConnectionUuid;
}

- (void)setNetworkConnectionUuid:(id)a3
{
}

- (BOOL)networkConnectionReused
{
  return self->_networkConnectionReused;
}

- (NSString)networkInterfaceIdentifier
{
  return self->_networkInterfaceIdentifier;
}

- (void)setNetworkInterfaceIdentifier:(id)a3
{
}

- (NSString)networkProtocolName
{
  return self->_networkProtocolName;
}

- (void)setNetworkProtocolName:(id)a3
{
}

- (unsigned)networkRequestHeaderSize
{
  return self->_networkRequestHeaderSize;
}

- (unint64_t)networkRequestBodyBytesSent
{
  return self->_networkRequestBodyBytesSent;
}

- (unsigned)networkResponseHeaderSize
{
  return self->_networkResponseHeaderSize;
}

- (unint64_t)networkResponseBodyBytesReceived
{
  return self->_networkResponseBodyBytesReceived;
}

- (unsigned)networkPreviousAttemptCount
{
  return self->_networkPreviousAttemptCount;
}

- (SECC2MPError)networkFatalError
{
  return self->_networkFatalError;
}

- (void)setNetworkFatalError:(id)a3
{
}

- (unint64_t)networkStatusCode
{
  return self->_networkStatusCode;
}

- (NSString)networkRequestUri
{
  return self->_networkRequestUri;
}

- (void)setNetworkRequestUri:(id)a3
{
}

- (unint64_t)timestampC2Init
{
  return self->_timestampC2Init;
}

- (unint64_t)timestampC2Start
{
  return self->_timestampC2Start;
}

- (unint64_t)timestampC2Now
{
  return self->_timestampC2Now;
}

- (unint64_t)timestampDnsStart
{
  return self->_timestampDnsStart;
}

- (unint64_t)timestampDnsEnd
{
  return self->_timestampDnsEnd;
}

- (unint64_t)timestampTcpStart
{
  return self->_timestampTcpStart;
}

- (unint64_t)timestampTcpEnd
{
  return self->_timestampTcpEnd;
}

- (unint64_t)timestampSslStart
{
  return self->_timestampSslStart;
}

- (unint64_t)timestampRequestStart
{
  return self->_timestampRequestStart;
}

- (unint64_t)timestampRequestEnd
{
  return self->_timestampRequestEnd;
}

- (unint64_t)timestampResponseStart
{
  return self->_timestampResponseStart;
}

- (unint64_t)timestampResponseEnd
{
  return self->_timestampResponseEnd;
}

- (NSString)optionsQualityOfService
{
  return self->_optionsQualityOfService;
}

- (void)setOptionsQualityOfService:(id)a3
{
}

- (BOOL)optionsOutOfProcess
{
  return self->_optionsOutOfProcess;
}

- (BOOL)optionsOutOfProcessForceDiscretionary
{
  return self->_optionsOutOfProcessForceDiscretionary;
}

- (BOOL)optionsAllowExpensiveAccess
{
  return self->_optionsAllowExpensiveAccess;
}

- (BOOL)optionsAllowPowerNapScheduling
{
  return self->_optionsAllowPowerNapScheduling;
}

- (unsigned)optionsTimeoutIntervalForRequest
{
  return self->_optionsTimeoutIntervalForRequest;
}

- (unsigned)optionsTimeoutIntervalForResource
{
  return self->_optionsTimeoutIntervalForResource;
}

- (NSString)optionsSourceApplicationBundleIdentifier
{
  return self->_optionsSourceApplicationBundleIdentifier;
}

- (void)setOptionsSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSString)optionsSourceApplicationSecondaryIdentifier
{
  return self->_optionsSourceApplicationSecondaryIdentifier;
}

- (void)setOptionsSourceApplicationSecondaryIdentifier:(id)a3
{
}

- (BOOL)optionsAppleIdContext
{
  return self->_optionsAppleIdContext;
}

- (BOOL)optionsTlsPinningRequired
{
  return self->_optionsTlsPinningRequired;
}

- (void).cxx_destruct
{
}

@end