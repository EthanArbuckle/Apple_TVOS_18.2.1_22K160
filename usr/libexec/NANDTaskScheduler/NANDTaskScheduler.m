uint64_t sendTunnelBuffer(char **a1, int a2, uint64_t a3, int a4)
{
  FILE *v4;
  const char *v5;
  size_t v6;
  mach_port_t v10;
  kern_return_t v11;
  uint64_t v12;
  char **v14;
  size_t outputStructCnt;
  _BYTE outputStruct[4];
  uint64_t inputStruct;
  uint64_t v18;
  uint64_t v19;
  inputStruct = 0LL;
  v18 = 0LL;
  v19 = 0LL;
  v14 = 0LL;
  outputStructCnt = 4LL;
  if ((a3 == 0) != (a4 == 0))
  {
    v4 = __stderrp;
    v5 = "Error in inputBuffer or inputBufSize for sendTunnelBuffer\n";
    v6 = 58LL;
LABEL_11:
    fwrite(v5, v6, 1uLL, v4);
    goto LABEL_12;
  }

  if (a1)
  {
    v10 = *((_DWORD *)a1 + 4);
  }

  else if (!findNandExporter_tunnel(&v14) || (a1 = v14) == 0LL || (v10 = *((_DWORD *)v14 + 4)) == 0)
  {
    v4 = __stderrp;
    v5 = "Unable to get nand connection\n";
    v6 = 30LL;
    goto LABEL_11;
  }

  v19 = a3;
  LODWORD(inputStruct) = a2;
  HIDWORD(v18) = a4;
  v11 = IOConnectCallStructMethod(v10, *((_DWORD *)a1 + 7), &inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
  if (v11)
  {
    fprintf(__stderrp, "Failed to send tunnel buffer: 0x%08x\n", v11);
LABEL_12:
    v12 = 0LL;
    goto LABEL_13;
  }

  v12 = 1LL;
LABEL_13:
  if (v14) {
    ReleaseIOInterfaces((uint64_t)v14);
  }
  return v12;
}

void *fetchTunnelBufferWithInVal(char **a1, int a2, int a3, int a4, void *a5, char a6, char a7)
{
  v13 = a1;
  v21 = 0LL;
  *a5 = 0LL;
  if (!a1 && (!findNandExporter_tunnel(&v21) || (v13 = v21) == 0LL || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    v19 = 0LL;
    goto LABEL_14;
  }

  int v14 = a3;
  unsigned int v15 = sub_1000024E0((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }

  uint64_t v16 = v15;
  size_t v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  v18 = valloc(v17);
  v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_1000025A4((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }

    else
    {
      free(v19);
      v19 = 0LL;
      *a5 = 0LL;
    }
  }

  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }

LABEL_14:
  if (v21) {
    ReleaseIOInterfaces((uint64_t)v21);
  }
  return v19;
}

                                            sub_1000193CC(v16, (const char *)&unk_10004223B, v19, v18);
                                          }

uint64_t sub_1000024E0(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;
  v13 = 0;
  v12 = 0LL;
  outputStructCnt = 4LL;
  inputStruct[0] = a2;
  inputStruct[1] = a3 | 1;
  inputStruct[2] = a4;
  v7 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  &outputStruct,  &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0) {
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    }
    return 0LL;
  }

  else
  {
    result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }

  return result;
}

uint64_t sub_1000025A4(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;
  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  v20 = 0;
  v19 = 0LL;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    unsigned int v15 = IOConnectCallStructMethod( *(_DWORD *)(a1 + 16),  *(_DWORD *)(a1 + 28),  inputStruct,  0x18uLL,  outputStruct,  &outputStructCnt);
    if (v15 != -536870211) {
      break;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    if ((a8 & 1) == 0) {
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    }
    uint64_t v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    uint64_t v9 = 1LL;
    if (vm_page_size == v16) {
      return v9;
    }
  }

  if (!v15) {
    return 1LL;
  }
LABEL_10:
  if ((a8 & 1) == 0) {
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  }
  return 0LL;
}

void *fetchTunnelBuffer(char **a1, int a2, int a3, void *a4, char a5, char a6)
{
  return fetchTunnelBufferWithInVal(a1, a2, a3, 0, a4, a5, a6);
}

void *fetchTunnelBuffer_zeroflag(char **a1, int a2, void *a3, char a4, char a5)
{
  return fetchTunnelBufferWithInVal(a1, a2, 0, 0, a3, a4, a5);
}

void *fetchTunnelBuffer_simple(int a1, void *a2)
{
  return fetchTunnelBufferWithInVal(0LL, a1, 0, 0, a2, 0, 0);
}

void *fetchTunnelBufferSkipSizeWrap(char **a1, int a2, void *a3)
{
  v5 = a1;
  v11 = 0LL;
  if (a1 || findNandExporter_tunnel(&v11) && (v5 = v11) != 0LL && *((_DWORD *)v11 + 4))
  {
    uint64_t v6 = *(unsigned int *)a3;
    size_t v7 = (v6 + vm_page_size - 1) / vm_page_size * vm_page_size;
    v8 = valloc(v7);
    uint64_t v9 = v8;
    if (v8)
    {
      bzero(v8, v7);
      if ((sub_1000025A4((uint64_t)v5, a2, 0, 0, v9, v7, 0, 1) & 1) != 0)
      {
        *a3 = v6;
      }

      else
      {
        free(v9);
        uint64_t v9 = 0LL;
        *a3 = 0LL;
      }
    }

    else
    {
      fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
    }
  }

  else
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
    uint64_t v9 = 0LL;
  }

  if (v11) {
    ReleaseIOInterfaces((uint64_t)v11);
  }
  return v9;
}

uint64_t populateTunnelBuffer(uint64_t a1, void *a2, void *a3, int a4, int a5, int a6, char a7, char a8)
{
  if (!a1)
  {
    v18 = __stderrp;
    v19 = "Err: Need a valid nand exporter here.\n";
    size_t v20 = 38LL;
    goto LABEL_10;
  }

  if (!a2 || !a3)
  {
    v18 = __stderrp;
    v19 = "Err: Need a valid outputbuffer and bufferSize";
    size_t v20 = 45LL;
    goto LABEL_10;
  }

  unsigned int v16 = sub_1000024E0(a1, a4, a5, a6, a8);
  if (!v16)
  {
    uint64_t v21 = 0LL;
    goto LABEL_16;
  }

  unsigned int v17 = v16;
  if (!*a3 || v16 <= *a3)
  {
    size_t v23 = (vm_page_size + v16 - 1) / vm_page_size * vm_page_size;
    bzero(a2, v23);
    if ((sub_1000025A4(a1, a4, a5, a6, a2, v23, a7, a8) & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v21 = v17;
LABEL_16:
    uint64_t result = 1LL;
    goto LABEL_12;
  }

  v18 = __stderrp;
  v19 = "Err: Allocated buffer not large enough for the command.\n";
  size_t v20 = 56LL;
LABEL_10:
  fwrite(v19, v20, 1uLL, v18);
LABEL_11:
  uint64_t v21 = 0LL;
  uint64_t result = 0LL;
LABEL_12:
  *a3 = v21;
  return result;
}

uint64_t populateTunnelOutputBufferWithoutSizeQuery_withFlags( char **a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  unsigned int v17 = 0LL;
  if (a1 || findNandExporter_tunnel(&v17) && (a1 = v17) != 0LL && *((_DWORD *)v17 + 4))
  {
    if ((sub_1000025A4((uint64_t)a1, a2, a3, a4, outputStruct, a6, a7, a8) & 1) != 0)
    {
      uint64_t v15 = 1LL;
      goto LABEL_10;
    }

    fprintf(__stderrp, "Error fetching the tunnel output buffer for opcode [%d]\n", a2);
  }

  else
  {
    fwrite("Err: Finding internal NAND exporter failed.\n", 0x2CuLL, 1uLL, __stderrp);
  }

  uint64_t v15 = 0LL;
LABEL_10:
  if (v17) {
    ReleaseIOInterfaces((uint64_t)v17);
  }
  return v15;
}

uint64_t populateTunnelOutputBufferWithoutSizeQuery( char **a1, int a2, int a3, void *outputStruct, size_t a5, char a6, char a7)
{
  return populateTunnelOutputBufferWithoutSizeQuery_withFlags(a1, a2, 0, a3, outputStruct, a5, a6, a7);
}

uint64_t getTunnelOutputThroughSizeOnlyHandling(char **a1, int a2, int a3, void *outputStruct)
{
  kern_return_t v7;
  uint64_t v8;
  size_t outputStructCnt;
  char **v11;
  _DWORD inputStruct[3];
  uint64_t v13;
  int v14;
  v13 = 0LL;
  int v14 = 0;
  outputStructCnt = 4LL;
  v11 = 0LL;
  inputStruct[0] = a2;
  inputStruct[1] = 1;
  inputStruct[2] = a3;
  if (!outputStruct)
  {
    syslog(3, "Error: must provide valid pointer for output value");
    goto LABEL_11;
  }

  if (a1)
  {
    mach_port_t v6 = *((_DWORD *)a1 + 4);
  }

  else if (!findNandExporter_tunnel(&v11) || (a1 = v11) == 0LL || (mach_port_t v6 = *((_DWORD *)v11 + 4)) == 0)
  {
    fwrite("Err: Finding internal NAND exporter failed.\n", 0x2CuLL, 1uLL, __stderrp);
    goto LABEL_11;
  }

  size_t v7 = IOConnectCallStructMethod(v6, *((_DWORD *)a1 + 8), inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
  if (v7)
  {
    fprintf(__stderrp, "Error fetching the tunnel output buffer for opcode [%d], Result [0x%X]\n", a2, v7);
LABEL_11:
    v8 = 0LL;
    goto LABEL_12;
  }

  v8 = 1LL;
LABEL_12:
  if (v11) {
    ReleaseIOInterfaces((uint64_t)v11);
  }
  return v8;
}

uint64_t ASPParseBufferToCxt(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8) {
    return 0LL;
  }
  unsigned int v6 = a3 >> 3;
  while (2)
  {
    unint64_t v9 = *a2;
    v8 = a2 + 1;
    int v7 = v9;
    unint64_t v10 = HIDWORD(v9);
    unsigned int v11 = v6 - 1;
    if (v9 <= 0x30000000 && v11 >= v10)
    {
      uint64_t v13 = (v7 - 1);
      if (v13 <= 0x47) {
        __asm { BR              X10 }
      }

      uint64_t v17 = (v7 - 73);
      if (v17 <= 0x46) {
        __asm { BR              X10 }
      }

      switch(v7)
      {
        case 144:
          uint64_t v18 = *v8;
          v19 = "numMemExtreme";
          goto LABEL_13;
        case 145:
          uint64_t v18 = *v8;
          v19 = "maxMemExtremeDuration";
          goto LABEL_13;
        case 146:
          uint64_t v18 = *v8;
          v19 = "memExtremeDuration";
          goto LABEL_13;
        case 147:
          uint64_t v18 = *v8;
          v19 = "bandGetsExtreme";
          goto LABEL_13;
        case 148:
          uint64_t v18 = *v8;
          v19 = "bandGetsLow";
          goto LABEL_13;
        case 149:
          uint64_t v18 = *v8;
          v19 = "numHostChoke";
          goto LABEL_13;
        case 152:
          uint64_t v18 = *v8;
          v19 = "AbortSkip_ProgramError";
          goto LABEL_13;
        case 153:
          uint64_t v18 = *v8;
          v19 = "AbortSkip_ReadErrorOpenBand";
          goto LABEL_13;
        case 154:
          uint64_t v18 = *v8;
          v19 = "AbortSkip_FailedRebuildingParity";
          goto LABEL_13;
        case 155:
          uint64_t v18 = *v8;
          v19 = "AbortPad_OpenRefreshBand";
          goto LABEL_13;
        case 156:
          uint64_t v18 = *v8;
          v19 = "AbortPad_CloseBands";
          goto LABEL_13;
        case 157:
          uint64_t v18 = *v8;
          v19 = "AbortPad_SetPhoto";
          goto LABEL_13;
        case 158:
          uint64_t v18 = *v8;
          v19 = "AbortPad_GcNoSource";
          goto LABEL_13;
        case 159:
          uint64_t v18 = *v8;
          v19 = "AbortPad_Format";
          goto LABEL_13;
        case 160:
          uint64_t v18 = *v8;
          v19 = "nandDiscoveryDuration";
          goto LABEL_13;
        case 161:
          uint64_t v18 = *v8;
          v19 = "coreCCEnableDuration";
          goto LABEL_13;
        case 163:
          uint64_t v18 = *v8;
          v19 = "coreOpenDuration";
          goto LABEL_13;
        case 164:
          uint64_t v18 = *v8;
          v19 = "coreWritableDuration";
          goto LABEL_13;
        case 165:
          uint64_t v18 = *v8;
          v19 = "coreClogLoadDuration";
          goto LABEL_13;
        case 167:
          uint64_t v18 = *v8;
          v19 = "bulkPFail";
          goto LABEL_13;
        case 169:
          uint64_t v18 = *v8;
          v19 = "bulkRFail";
          goto LABEL_13;
        case 172:
          uint64_t v18 = *v8;
          v19 = "raidSmartErrors";
          goto LABEL_13;
        case 182:
          uint64_t v18 = *v8;
          v19 = "internalUeccs";
          goto LABEL_13;
        case 183:
          uint64_t v18 = *v8;
          v19 = "e2eFail";
          goto LABEL_13;
        case 184:
          uint64_t v18 = *v8;
          v19 = "TempSensorMax";
          goto LABEL_13;
        case 185:
          uint64_t v18 = *v8;
          v19 = "TempSensorMin";
          goto LABEL_13;
        case 186:
          uint64_t v18 = *v8;
          v19 = "powerUpFromDDR";
          goto LABEL_13;
        case 187:
          uint64_t v18 = *v8;
          v19 = "numMemLow";
          goto LABEL_13;
        case 188:
          uint64_t v18 = *v8;
          v19 = "maxMemLowDuration";
          goto LABEL_13;
        case 189:
          uint64_t v18 = *v8;
          v19 = "memLowDuration";
          goto LABEL_13;
        case 190:
          uint64_t v18 = *v8;
          v19 = "numFences";
          goto LABEL_13;
        case 191:
          uint64_t v18 = *v8;
          v19 = "hostPassiveIO";
          goto LABEL_13;
        case 192:
          uint64_t v18 = *v8;
          v19 = "odtsMax";
          goto LABEL_13;
        case 193:
          uint64_t v18 = *v8;
          v19 = "defragMFromOrphans";
          goto LABEL_13;
        case 194:
          uint64_t v18 = *v8;
          v19 = "defragMFromFragments";
          goto LABEL_13;
        case 195:
          uint64_t v18 = *v8;
          v19 = "defragMTime";
          goto LABEL_13;
        case 196:
          uint64_t v18 = *v8;
          v19 = "defragMMaxTime";
          goto LABEL_13;
        case 197:
          uint64_t v18 = *v8;
          v19 = "raidFailedLbaMismatch";
          goto LABEL_13;
        case 198:
          uint64_t v18 = *v8;
          v19 = "numSyscfgWrites";
          goto LABEL_13;
        case 199:
          uint64_t v18 = *v8;
          v19 = "indmbUnitsXfer";
          goto LABEL_13;
        case 200:
          uint64_t v18 = *v8;
          v19 = "indmbUnitsCache";
          goto LABEL_13;
        case 201:
          uint64_t v18 = *v8;
          v19 = "indmbUnitsInd";
          goto LABEL_13;
        case 202:
          uint64_t v18 = *v8;
          v19 = "wcacheFS_Mbytes";
          goto LABEL_13;
        case 203:
          uint64_t v18 = *v8;
          v19 = "wcacheDS_Mbytes";
          goto LABEL_13;
        case 204:
          uint64_t v18 = *v8;
          v19 = "powerOnSeconds";
          goto LABEL_13;
        case 205:
          uint64_t v18 = *v8;
          v19 = "numUnknownTokenHostRead";
          goto LABEL_13;
        case 206:
          uint64_t v18 = *v8;
          v19 = "numUnmmapedTokenHostRead";
          goto LABEL_13;
        case 207:
          size_t v20 = "numOfThrottlingEntriesPerLevel";
          uint64_t v21 = a1;
          int v22 = 207;
LABEL_85:
          int v14 = v8;
          unsigned int v15 = 16;
          goto LABEL_12;
        case 208:
          uint64_t v18 = *v8;
          v19 = "wcacheFS_MbytesMin";
          goto LABEL_13;
        case 209:
          uint64_t v18 = *v8;
          v19 = "wcacheFS_MbytesMax";
          goto LABEL_13;
        case 210:
          uint64_t v18 = *v8;
          v19 = "prepareForShutdownFailCounter";
          goto LABEL_13;
        case 211:
          uint64_t v18 = *v8;
          v19 = "lpsrEntry";
          goto LABEL_13;
        case 212:
          uint64_t v18 = *v8;
          v19 = "lpsrExit";
          goto LABEL_13;
        case 213:
          size_t v20 = "crcInternalReadFail";
          uint64_t v21 = a1;
          int v22 = 213;
LABEL_23:
          int v14 = v8;
          unsigned int v15 = 8;
          goto LABEL_12;
        case 214:
          uint64_t v18 = *v8;
          v19 = "wcacheFSEvictCnt";
          goto LABEL_13;
        case 215:
          uint64_t v18 = *v8;
          v19 = "wcacheFSEvictSize";
          goto LABEL_13;
        case 216:
          uint64_t v18 = *v8;
          v19 = "wcacheFSWr";
          goto LABEL_13;
        case 217:
          uint64_t v18 = *v8;
          v19 = "wcacheDSWr";
          goto LABEL_13;
        case 218:
          size_t v20 = "wcacheFSEvictSizeLogDist";
          uint64_t v21 = a1;
          int v22 = 218;
LABEL_11:
          int v14 = v8;
          unsigned int v15 = 10;
          goto LABEL_12;
        case 219:
          uint64_t v18 = *v8;
          v19 = "prepareForShutdownTimeoutCounter";
          goto LABEL_13;
        case 220:
          uint64_t v18 = *v8;
          v19 = "prepareForShutdownCancelCounter";
          goto LABEL_13;
        case 221:
          uint64_t v18 = *v8;
          v19 = "RD_openBandCount";
          goto LABEL_13;
        case 222:
          uint64_t v18 = *v8;
          v19 = "RD_openBandNops";
          goto LABEL_13;
        case 223:
          uint64_t v18 = *v8;
          v19 = "RD_closedBandEvictCount";
LABEL_13:
          unsigned int v16 = (void *)a1;
          goto LABEL_14;
        default:
          switch(v7)
          {
            case 224:
              uint64_t v18 = *v8;
              v19 = "RD_closedBandEvictSectors";
              goto LABEL_13;
            case 225:
              uint64_t v18 = *v8;
              v19 = "RD_closedBandFragmentCount";
              goto LABEL_13;
            case 226:
              uint64_t v18 = *v8;
              v19 = "RD_closedBandFragmentSectors";
              goto LABEL_13;
            case 227:
              size_t v20 = "wcacheFSOverWrLogSizeCnts";
              uint64_t v21 = a1;
              int v22 = 227;
              goto LABEL_11;
            case 228:
              size_t v20 = "wcacheFSOverWrSizeByFlow";
              uint64_t v21 = a1;
              int v22 = 228;
              goto LABEL_22;
            case 229:
              size_t v20 = "indmbXferCountTo";
              uint64_t v21 = a1;
              int v22 = 229;
              goto LABEL_20;
            case 230:
              size_t v20 = "indmbAccumulatedTimeBetweenXfers";
              uint64_t v21 = a1;
              int v22 = 230;
LABEL_20:
              int v14 = v8;
              unsigned int v15 = 2;
              goto LABEL_12;
            case 231:
              uint64_t v18 = *v8;
              v19 = "maxGracefulBootTimeMs";
              goto LABEL_13;
            case 232:
              uint64_t v18 = *v8;
              v19 = "maxUngracefulBootTimeMs";
              goto LABEL_13;
            case 233:
              uint64_t v18 = *v8;
              v19 = "averageGracefulBootTimeMs";
              goto LABEL_13;
            case 234:
              uint64_t v18 = *v8;
              v19 = "averageUngracefulBootTimeMs";
              goto LABEL_13;
            case 235:
              size_t v20 = "gracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 235;
              goto LABEL_23;
            case 236:
              size_t v20 = "ungracefulBootTimeLogMs";
              uint64_t v21 = a1;
              int v22 = 236;
              goto LABEL_23;
            case 237:
              size_t v20 = "CalibrationCount";
              uint64_t v21 = a1;
              int v22 = 237;
              goto LABEL_22;
            case 238:
              uint64_t v18 = *v8;
              v19 = "CalibrationLastTmp";
              goto LABEL_13;
            case 239:
              uint64_t v18 = *v8;
              v19 = "CalibrationMaxTmp";
              goto LABEL_13;
            case 240:
              uint64_t v18 = *v8;
              v19 = "CalibrationMinTmp";
              goto LABEL_13;
            case 241:
              uint64_t v18 = *v8;
              v19 = "ungracefulBootWorstIndicator";
              goto LABEL_13;
            case 242:
              uint64_t v18 = *v8;
              v19 = "metaMismatchReread";
              goto LABEL_13;
            case 243:
              uint64_t v18 = *v8;
              v19 = "numS3SleepOps";
              goto LABEL_13;
            case 244:
              uint64_t v18 = *v8;
              v19 = "odtsCurrent";
              goto LABEL_13;
            case 245:
              uint64_t v18 = *v8;
              v19 = "prefetchReads";
              goto LABEL_13;
            case 246:
              uint64_t v18 = *v8;
              v19 = "prefetchHits";
              goto LABEL_13;
            case 247:
              uint64_t v18 = *v8;
              v19 = "prefetchWritesInvalidation";
              goto LABEL_13;
            case 248:
              uint64_t v18 = *v8;
              v19 = "indmbUnitsTotal";
              goto LABEL_13;
            case 249:
              uint64_t v18 = *v8;
              v19 = "selfThrottlingEngage";
              goto LABEL_13;
            case 250:
              uint64_t v18 = *v8;
              v19 = "selfThrottlingDisengage";
              goto LABEL_13;
            case 252:
              uint64_t v18 = *v8;
              v19 = "AbortSkip_WlpMode";
              goto LABEL_13;
            case 253:
              uint64_t v18 = *v8;
              v19 = "hostWritesWlpMode";
              goto LABEL_13;
            case 254:
              uint64_t v18 = *v8;
              v19 = "numClogDoubleUnc";
              goto LABEL_13;
            case 256:
              uint64_t v18 = *v8;
              v19 = "AbortPad_WlpMode";
              goto LABEL_13;
            case 257:
              uint64_t v18 = *v8;
              v19 = "bonfireIntermediateBandErases";
              goto LABEL_13;
            case 258:
              uint64_t v18 = *v8;
              v19 = "bonfireUserBandErases";
              goto LABEL_13;
            case 259:
              uint64_t v18 = *v8;
              v19 = "bonfireIntermediateBandProgs";
              goto LABEL_13;
            case 260:
              uint64_t v18 = *v8;
              v19 = "bonfireUserBandProgs";
              goto LABEL_13;
            case 261:
              uint64_t v18 = *v8;
              v19 = "bonfireIntermediatePageReads";
              goto LABEL_13;
            case 262:
              uint64_t v18 = *v8;
              v19 = "bonfireUserPageReads";
              goto LABEL_13;
            case 263:
              uint64_t v18 = *v8;
              v19 = "refreshUtil00";
              goto LABEL_13;
            case 264:
              uint64_t v18 = *v8;
              v19 = "failToReadUtil00";
              goto LABEL_13;
            case 265:
              size_t v20 = "readCountHisto";
              uint64_t v21 = a1;
              int v22 = 265;
LABEL_19:
              int v14 = v8;
              unsigned int v15 = 5;
              goto LABEL_12;
            case 266:
              size_t v20 = "readAmpHisto";
              uint64_t v21 = a1;
              int v22 = 266;
              goto LABEL_85;
            case 267:
              uint64_t v18 = *v8;
              v19 = "totalReadAmp";
              goto LABEL_13;
            case 268:
              size_t v20 = "nvmeModeSelect";
              uint64_t v21 = a1;
              int v22 = 268;
              goto LABEL_22;
            case 269:
              size_t v20 = "numBootBlockRefreshSuccess";
              uint64_t v21 = a1;
              int v22 = 269;
              goto LABEL_23;
            case 270:
              size_t v20 = "numBootBlockRefreshFail";
              uint64_t v21 = a1;
              int v22 = 270;
              goto LABEL_23;
            case 271:
              uint64_t v18 = *v8;
              v19 = "numUnsupportedAsi";
              goto LABEL_13;
            case 272:
              uint64_t v18 = *v8;
              v19 = "NumTerminatedProgramSegs";
              goto LABEL_13;
            case 273:
              uint64_t v18 = *v8;
              v19 = "indParityPagesDrops";
              goto LABEL_13;
            case 274:
              uint64_t v18 = *v8;
              v19 = "indFlowPrograms";
              goto LABEL_13;
            case 277:
              size_t v20 = "powerBudgetSelect";
              uint64_t v21 = a1;
              int v22 = 277;
LABEL_22:
              int v14 = v8;
              unsigned int v15 = 4;
              goto LABEL_12;
            case 279:
              uint64_t v18 = *v8;
              v19 = "RxBurnNandWrites";
              goto LABEL_13;
            case 280:
              size_t v20 = "E2EDPErrorCounters";
              uint64_t v21 = a1;
              int v22 = 280;
LABEL_153:
              int v14 = v8;
              unsigned int v15 = 12;
              goto LABEL_12;
            case 281:
              uint64_t v18 = *v8;
              v19 = "wcacheSectorsMax";
              goto LABEL_13;
            case 282:
              uint64_t v18 = *v8;
              v19 = "wcacheSectorsMin";
              goto LABEL_13;
            case 283:
              uint64_t v18 = *v8;
              v19 = "wcacheSectorsCur";
              goto LABEL_13;
            case 284:
              uint64_t v18 = *v8;
              v19 = "wcacheDS_SectorsMax";
              goto LABEL_13;
            case 285:
              uint64_t v18 = *v8;
              v19 = "wcacheDS_SectorsMin";
              goto LABEL_13;
            case 286:
              uint64_t v18 = *v8;
              v19 = "wcacheDS_SectorsCur";
              goto LABEL_13;
            case 287:
              uint64_t v18 = *v8;
              v19 = "wcacheFS_Reads";
              goto LABEL_13;
            case 288:
              uint64_t v18 = *v8;
              v19 = "wcacheDS_Reads";
              goto LABEL_13;
            case 289:
              size_t v20 = "mspBootBlockReadFail";
              uint64_t v21 = a1;
              int v22 = 289;
              goto LABEL_155;
            case 290:
              size_t v20 = "mspBootBlockProgFail";
              uint64_t v21 = a1;
              int v22 = 290;
              goto LABEL_155;
            case 291:
              size_t v20 = "mspBootBlockEraseFail";
              uint64_t v21 = a1;
              int v22 = 291;
              goto LABEL_155;
            case 292:
              uint64_t v18 = *v8;
              v19 = "bandsRefreshedOnError";
              goto LABEL_13;
            default:
              switch(v7)
              {
                case 298:
                  size_t v20 = "perHostReads";
                  uint64_t v21 = a1;
                  int v22 = 298;
                  goto LABEL_20;
                case 299:
                  size_t v20 = "perHostReadXacts";
                  uint64_t v21 = a1;
                  int v22 = 299;
                  goto LABEL_20;
                case 300:
                  size_t v20 = "perHostWrites";
                  uint64_t v21 = a1;
                  int v22 = 300;
                  goto LABEL_20;
                case 301:
                  size_t v20 = "perHostWriteXacts";
                  uint64_t v21 = a1;
                  int v22 = 301;
                  goto LABEL_20;
                case 302:
                  size_t v20 = "perHostNumFlushes";
                  uint64_t v21 = a1;
                  int v22 = 302;
                  goto LABEL_20;
                case 303:
                  size_t v20 = "perHostNumFences";
                  uint64_t v21 = a1;
                  int v22 = 303;
                  goto LABEL_20;
                case 304:
                  size_t v20 = "commitPadSectorsPerFlow";
                  uint64_t v21 = a1;
                  int v22 = 304;
                  goto LABEL_11;
                case 305:
                  size_t v20 = "wcacheDSOverWrLogSizeCnts";
                  uint64_t v21 = a1;
                  int v22 = 305;
                  goto LABEL_11;
                case 306:
                  size_t v20 = "wcacheDSOverWrSizeByFlow";
                  uint64_t v21 = a1;
                  int v22 = 306;
                  goto LABEL_22;
                case 307:
                  size_t v20 = "CmdRaisePrioiryEvents";
                  uint64_t v21 = a1;
                  int v22 = 307;
                  goto LABEL_11;
                case 308:
                  uint64_t v18 = *v8;
                  v19 = "utilNumVerification";
                  goto LABEL_13;
                case 309:
                  uint64_t v18 = *v8;
                  v19 = "utilRefreshes";
                  goto LABEL_13;
                case 310:
                  uint64_t v18 = *v8;
                  v19 = "utilBDRErrors";
                  goto LABEL_13;
                case 311:
                  uint64_t v18 = *v8;
                  v19 = "indBandsPerFlow";
                  goto LABEL_13;
                case 312:
                  uint64_t v18 = *v8;
                  v19 = "secsPerIndFlow";
                  goto LABEL_13;
                case 313:
                  uint64_t v18 = *v8;
                  v19 = "indDecodedECC";
                  goto LABEL_13;
                case 314:
                  size_t v20 = "numBootBlockValidateSuccess";
                  uint64_t v21 = a1;
                  int v22 = 314;
                  goto LABEL_23;
                case 315:
                  size_t v20 = "numBootBlockValidateFail";
                  uint64_t v21 = a1;
                  int v22 = 315;
                  goto LABEL_23;
                case 316:
                  size_t v20 = "clogPagesFillingPercentage";
                  uint64_t v21 = a1;
                  int v22 = 316;
                  goto LABEL_22;
                case 317:
                  uint64_t v18 = *v8;
                  v19 = "bdrCalTimeAccFactor";
                  goto LABEL_13;
                case 318:
                  uint64_t v18 = *v8;
                  v19 = "bootChainRdError";
                  goto LABEL_13;
                case 319:
                  uint64_t v18 = *v8;
                  v19 = "bootChainBlankError";
                  goto LABEL_13;
                case 320:
                  uint64_t v18 = *v8;
                  v19 = "bootChainRefreshError";
                  goto LABEL_13;
                case 321:
                  uint64_t v18 = *v8;
                  v19 = "bootChainVersionError";
                  goto LABEL_13;
                case 322:
                  uint64_t v18 = *v8;
                  v19 = "mspBootBlockMismatch";
                  goto LABEL_13;
                case 323:
                  uint64_t v18 = *v8;
                  v19 = "mspBootBlockMismatchErr";
                  goto LABEL_13;
                case 324:
                  size_t v20 = "bitflipAddr";
                  uint64_t v21 = a1;
                  int v22 = 324;
                  goto LABEL_19;
                case 325:
                  size_t v20 = "bitflipCount";
                  uint64_t v21 = a1;
                  int v22 = 325;
                  goto LABEL_19;
                case 326:
                  size_t v20 = "bitflipDupes";
                  uint64_t v21 = a1;
                  int v22 = 326;
                  goto LABEL_19;
                case 327:
                  size_t v20 = "bandsMaxTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 327;
                  goto LABEL_196;
                case 328:
                  size_t v20 = "bandsMinTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 328;
                  goto LABEL_196;
                case 329:
                  size_t v20 = "bandsLifeTimeTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 329;
LABEL_196:
                  int v14 = v8;
                  unsigned int v15 = 30;
                  goto LABEL_12;
                case 330:
                  size_t v20 = "bandsDeltaTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 330;
                  int v14 = v8;
                  unsigned int v15 = 22;
                  goto LABEL_12;
                case 331:
                  size_t v20 = "bandsCrossTempHisto";
                  uint64_t v21 = a1;
                  int v22 = 331;
                  int v14 = v8;
                  unsigned int v15 = 45;
                  goto LABEL_12;
                case 332:
                  size_t v20 = "wcacheWaitLogMs";
                  uint64_t v21 = a1;
                  int v22 = 332;
                  goto LABEL_11;
                case 333:
                  size_t v20 = "wcacheDS_segsSortedLogSize";
                  uint64_t v21 = a1;
                  int v22 = 333;
                  goto LABEL_11;
                case 334:
                  uint64_t v18 = *v8;
                  v19 = "numFirmwareWrites";
                  goto LABEL_13;
                case 335:
                  uint64_t v18 = *v8;
                  v19 = "numBisWrites";
                  goto LABEL_13;
                case 336:
                  uint64_t v18 = *v8;
                  v19 = "numBootChainUpdates";
                  goto LABEL_13;
                case 337:
                  uint64_t v18 = *v8;
                  v19 = "cntCalTimeWentBackWard";
                  goto LABEL_13;
                case 338:
                  uint64_t v18 = *v8;
                  v19 = "indBoRecoveries";
                  goto LABEL_13;
                case 340:
                  uint64_t v18 = *v8;
                  v19 = "numCrossTempUecc";
                  goto LABEL_13;
                case 341:
                  uint64_t v18 = *v8;
                  v19 = "latencyMonitorError";
                  goto LABEL_13;
                case 343:
                  uint64_t v18 = *v8;
                  v19 = "utilUeccReads";
                  goto LABEL_13;
                case 344:
                  uint64_t v18 = *v8;
                  v19 = "numOfAvoidedGCDueToTemp";
                  goto LABEL_13;
                case 345:
                  uint64_t v18 = *v8;
                  v19 = "forceShutdowns";
                  goto LABEL_13;
                case 346:
                  uint64_t v18 = *v8;
                  v19 = "gcSlcDestinations";
                  goto LABEL_13;
                case 347:
                  uint64_t v18 = *v8;
                  v19 = "indReplayExtUsed";
                  goto LABEL_13;
                case 348:
                  uint64_t v18 = *v8;
                  v19 = "defectsPerPackageOverflow";
                  goto LABEL_13;
                case 349:
                  uint64_t v18 = *v8;
                  v19 = "RxBurnIntBandsProgrammed";
                  goto LABEL_13;
                case 350:
                  uint64_t v18 = *v8;
                  v19 = "RxBurnUsrBandsProgrammed";
                  goto LABEL_13;
                case 351:
                  uint64_t v18 = *v8;
                  v19 = "RxBurnIntNandWrites";
                  goto LABEL_13;
                case 352:
                  uint64_t v18 = *v8;
                  v19 = "RxBurnUsrNandWrites";
                  goto LABEL_13;
                case 353:
                  uint64_t v18 = *v8;
                  v19 = "clogLastStripeUeccs";
                  goto LABEL_13;
                case 354:
                  uint64_t v18 = *v8;
                  v19 = "GC_MidDestSrcSwitchSLC2TLC";
                  goto LABEL_13;
                case 355:
                  uint64_t v18 = *v8;
                  v19 = "GC_MidDestSrcSwitchTLC2SLC";
                  goto LABEL_13;
                case 356:
                  uint64_t v18 = *v8;
                  v19 = "nvme_stats_shutdown_count_host0_normal";
                  goto LABEL_13;
                case 357:
                  uint64_t v18 = *v8;
                  v19 = "nvme_stats_shutdown_count_host1_normal";
                  goto LABEL_13;
                case 358:
                  uint64_t v18 = *v8;
                  v19 = "nvme_stats_shutdown_count_host0_s2r";
                  goto LABEL_13;
                case 359:
                  uint64_t v18 = *v8;
                  v19 = "nvme_stats_shutdown_count_host1_s2r";
                  goto LABEL_13;
                case 360:
                  size_t v20 = "gcPDusterIntrSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 360;
                  goto LABEL_85;
                case 361:
                  size_t v20 = "gcPDusterUserSrcValidityHisto";
                  uint64_t v21 = a1;
                  int v22 = 361;
                  goto LABEL_85;
                case 362:
                  uint64_t v18 = *v8;
                  v19 = "raidFailedReadParity";
                  goto LABEL_13;
                case 364:
                  uint64_t v18 = *v8;
                  v19 = "lhotNumSkipes";
                  goto LABEL_13;
                default:
                  switch(v7)
                  {
                    case 365:
                      uint64_t v18 = *v8;
                      v19 = "lhotNumIsHotCalls";
                      goto LABEL_13;
                    case 366:
                      uint64_t v18 = *v8;
                      v19 = "lhotFullLap";
                      goto LABEL_13;
                    case 367:
                      uint64_t v18 = *v8;
                      v19 = "lhotSkipPrecent";
                      goto LABEL_13;
                    case 368:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendEvents";
                      goto LABEL_13;
                    case 369:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendedStatuses";
                      goto LABEL_13;
                    case 370:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendedBands";
                      goto LABEL_13;
                    case 371:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendSituationsBelowThreshold";
                      goto LABEL_13;
                    case 372:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendSituationsAboveThreshold";
                      goto LABEL_13;
                    case 373:
                      uint64_t v18 = *v8;
                      v19 = "eraseSuspendReadChainsProcessed";
                      goto LABEL_13;
                    case 374:
                      uint64_t v18 = *v8;
                      v19 = "bdrLastDoneHr";
                      goto LABEL_13;
                    case 375:
                      uint64_t v18 = *v8;
                      v19 = "bdrBackupThreshHrs";
                      goto LABEL_13;
                    case 376:
                      uint64_t v18 = *v8;
                      v19 = "clogPortableProgBufs";
                      goto LABEL_13;
                    case 377:
                      uint64_t v18 = *v8;
                      v19 = "clogPortableDropBufs";
                      goto LABEL_13;
                    case 378:
                      uint64_t v18 = *v8;
                      v19 = "clogPortablePadSectors";
                      goto LABEL_13;
                    case 379:
                      uint64_t v18 = *v8;
                      v19 = "numRetiredBlocks";
                      goto LABEL_13;
                    case 381:
                      uint64_t v18 = *v8;
                      v19 = "numRefreshOnErrNandRefreshPerf";
                      goto LABEL_13;
                    case 382:
                      uint64_t v18 = *v8;
                      v19 = "raidReconstructReads";
                      goto LABEL_13;
                    case 383:
                      uint64_t v18 = *v8;
                      v19 = "gcReadsNoBlog";
                      goto LABEL_13;
                    case 384:
                      uint64_t v18 = *v8;
                      v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                      goto LABEL_13;
                    case 385:
                      uint64_t v18 = *v8;
                      v19 = "openBandReadFail";
                      goto LABEL_13;
                    case 386:
                      uint64_t v18 = *v8;
                      v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                      goto LABEL_13;
                    case 387:
                      uint64_t v18 = *v8;
                      v19 = "AbortSkip_MBPXFailedRebuildingParity";
                      goto LABEL_13;
                    case 388:
                      uint64_t v18 = *v8;
                      v19 = "raidSuccessfulPMXReconstructionInternal";
                      goto LABEL_13;
                    case 389:
                      uint64_t v18 = *v8;
                      v19 = "raidSuccessfulPMXReconstructionHost";
                      goto LABEL_13;
                    case 390:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedPMXReconstructionInternal";
                      goto LABEL_13;
                    case 391:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedPMXReconstructionHost";
                      goto LABEL_13;
                    case 392:
                      uint64_t v18 = *v8;
                      v19 = "raidSuccessfulRMXReconstructionInternal";
                      goto LABEL_13;
                    case 393:
                      uint64_t v18 = *v8;
                      v19 = "raidSuccessfulRMXReconstructionHost";
                      goto LABEL_13;
                    case 394:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedRMXReconstructionInternal";
                      goto LABEL_13;
                    case 395:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedRMXReconstructionHost";
                      goto LABEL_13;
                    case 396:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadParityInternal";
                      goto LABEL_13;
                    case 397:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadQParityInternal";
                      goto LABEL_13;
                    case 398:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadQParity";
                      goto LABEL_13;
                    case 399:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadQCopy";
                      goto LABEL_13;
                    case 400:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReconstructionQParity";
                      goto LABEL_13;
                    case 401:
                      uint64_t v18 = *v8;
                      v19 = "offlineBlocksCnt";
                      goto LABEL_13;
                    case 402:
                      uint64_t v18 = *v8;
                      v19 = "bork0Revectors";
                      goto LABEL_13;
                    case 403:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadBlog";
                      goto LABEL_13;
                    case 404:
                      uint64_t v18 = *v8;
                      v19 = "numReliabilityRefreshes";
                      goto LABEL_13;
                    case 405:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedReadQCopyInternal";
                      goto LABEL_13;
                    case 406:
                      size_t v20 = "raidReconstructSuccessFlow";
                      uint64_t v21 = a1;
                      int v22 = 406;
                      goto LABEL_19;
                    case 407:
                      size_t v20 = "raidReconstructFailFlow";
                      uint64_t v21 = a1;
                      int v22 = 407;
                      goto LABEL_19;
                    case 408:
                      uint64_t v18 = *v8;
                      v19 = "raidReconstructFailP";
                      goto LABEL_13;
                    case 409:
                      uint64_t v18 = *v8;
                      v19 = "raidReconstructFailQ";
                      goto LABEL_13;
                    case 410:
                      uint64_t v18 = *v8;
                      v19 = "raidReconstructFailUECC";
                      goto LABEL_13;
                    case 411:
                      uint64_t v18 = *v8;
                      v19 = "raidReconstructFailUnsupp";
                      goto LABEL_13;
                    case 412:
                      uint64_t v18 = *v8;
                      v19 = "raidUECCOpenBand";
                      goto LABEL_13;
                    case 414:
                      uint64_t v18 = *v8;
                      v19 = "ueccReads";
                      goto LABEL_13;
                    case 416:
                      uint64_t v18 = *v8;
                      v19 = "raidSuccessfulVerify";
                      goto LABEL_13;
                    case 417:
                      uint64_t v18 = *v8;
                      v19 = "raidFailedVerify";
                      goto LABEL_13;
                    case 418:
                      uint64_t v18 = *v8;
                      v19 = "numBandsVerified";
                      goto LABEL_13;
                    case 419:
                      uint64_t v18 = *v8;
                      v19 = "cache_heads";
                      goto LABEL_13;
                    case 420:
                      uint64_t v18 = *v8;
                      v19 = "AbortSkip_RMXtoMPBX";
                      goto LABEL_13;
                    case 421:
                      uint64_t v18 = *v8;
                      v19 = "s3eFwVer";
                      goto LABEL_13;
                    case 422:
                      uint64_t v18 = *v8;
                      v19 = "readVerifyNative";
                      goto LABEL_13;
                    case 423:
                      uint64_t v18 = *v8;
                      v19 = "reducedReadVerifyNative";
                      goto LABEL_13;
                    case 424:
                      uint64_t v18 = *v8;
                      v19 = "readVerifySlc";
                      goto LABEL_13;
                    case 425:
                      uint64_t v18 = *v8;
                      v19 = "reducedReadVerifySlc";
                      goto LABEL_13;
                    case 426:
                      uint64_t v18 = *v8;
                      v19 = "RxBurnEvictions";
                      goto LABEL_13;
                    case 427:
                      uint64_t v18 = *v8;
                      v19 = "directToTLCBands";
                      goto LABEL_13;
                    case 428:
                      uint64_t v18 = *v8;
                      v19 = "nandDesc";
                      goto LABEL_13;
                    case 429:
                      uint64_t v18 = *v8;
                      v19 = "fwUpdatesPercentUsed";
                      goto LABEL_13;
                    case 430:
                      uint64_t v18 = *v8;
                      v19 = "slcPercentUsed";
                      goto LABEL_13;
                    case 431:
                      uint64_t v18 = *v8;
                      v19 = "percentUsed";
                      goto LABEL_13;
                    default:
                      switch(v7)
                      {
                        case 432:
                          uint64_t v18 = *v8;
                          v19 = "hostAutoWrites";
                          goto LABEL_13;
                        case 433:
                          uint64_t v18 = *v8;
                          v19 = "hostAutoWriteXacts";
                          goto LABEL_13;
                        case 434:
                          uint64_t v18 = *v8;
                          v19 = "gcDestDynamic";
                          goto LABEL_13;
                        case 435:
                          uint64_t v18 = *v8;
                          v19 = "gcDestStatic";
                          goto LABEL_13;
                        case 436:
                          uint64_t v18 = *v8;
                          v19 = "gcDestWearlevel";
                          goto LABEL_13;
                        case 437:
                          uint64_t v18 = *v8;
                          v19 = "gcDestParity";
                          goto LABEL_13;
                        case 438:
                          uint64_t v18 = *v8;
                          v19 = "AbortSkip_Format";
                          goto LABEL_13;
                        case 440:
                          uint64_t v18 = *v8;
                          v19 = "raidSLCPadding";
                          goto LABEL_13;
                        case 441:
                          uint64_t v18 = *v8;
                          v19 = "raidGCBands";
                          goto LABEL_13;
                        case 442:
                          uint64_t v18 = *v8;
                          v19 = "raidGCSectors";
                          goto LABEL_13;
                        case 443:
                          uint64_t v18 = *v8;
                          v19 = "raidGCPadding";
                          goto LABEL_13;
                        case 444:
                          uint64_t v18 = *v8;
                          v19 = "raidSLCBandsPerHostFlow";
                          goto LABEL_13;
                        case 445:
                          uint64_t v18 = *v8;
                          v19 = "raidSLCSecsPerHostFlow";
                          goto LABEL_13;
                        case 446:
                          uint64_t v18 = *v8;
                          v19 = "rxBurnMinCycleRuns";
                          goto LABEL_13;
                        case 447:
                          uint64_t v18 = *v8;
                          v19 = "clogNumFastCxt";
                          goto LABEL_13;
                        case 448:
                          uint64_t v18 = *v8;
                          v19 = "clogNumRapidReboots";
                          goto LABEL_13;
                        case 449:
                          uint64_t v18 = *v8;
                          v19 = "clogFastCxtAbvThr";
                          goto LABEL_13;
                        case 450:
                          uint64_t v18 = *v8;
                          v19 = "rxBurnDiffModeRuns";
                          goto LABEL_13;
                        case 452:
                          uint64_t v18 = *v8;
                          v19 = "indReadVerifyFail";
                          goto LABEL_13;
                        case 453:
                          size_t v20 = "numOfThrottlingEntriesPerReadLevel";
                          uint64_t v21 = a1;
                          int v22 = 453;
                          goto LABEL_85;
                        case 454:
                          size_t v20 = "numOfThrottlingEntriesPerWriteLevel";
                          uint64_t v21 = a1;
                          int v22 = 454;
                          goto LABEL_85;
                        case 456:
                          size_t v20 = "slcFifoDepth";
                          uint64_t v21 = a1;
                          int v22 = 456;
                          goto LABEL_11;
                        case 457:
                          uint64_t v18 = *v8;
                          v19 = "wcacheSectorsDirtyIdle";
                          goto LABEL_13;
                        case 458:
                          uint64_t v18 = *v8;
                          v19 = "wcacheDS_SectorsDirtyIdle";
                          goto LABEL_13;
                        case 459:
                          uint64_t v18 = *v8;
                          v19 = "wcacheFS_MbytesDirtyIdle";
                          goto LABEL_13;
                        case 460:
                          size_t v20 = "CacheDepthVsThroughput";
                          uint64_t v21 = a1;
                          int v22 = 460;
                          int v14 = v8;
                          unsigned int v15 = 256;
                          goto LABEL_12;
                        case 461:
                          uint64_t v18 = *v8;
                          v19 = "directToTLCSectors";
                          goto LABEL_13;
                        case 462:
                          uint64_t v18 = *v8;
                          v19 = "fallbackToWaterfall";
                          goto LABEL_13;
                        case 463:
                          size_t v20 = "balanceProportionBucketsHistogram";
                          uint64_t v21 = a1;
                          int v22 = 463;
LABEL_320:
                          int v14 = v8;
                          unsigned int v15 = 11;
                          goto LABEL_12;
                        case 464:
                          uint64_t v18 = *v8;
                          v19 = "lockToTlc";
                          goto LABEL_13;
                        case 465:
                          size_t v20 = "burstSizeHistogram";
                          uint64_t v21 = a1;
                          int v22 = 465;
                          goto LABEL_11;
                        case 466:
                          size_t v20 = "qosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 466;
                          goto LABEL_342;
                        case 467:
                          size_t v20 = "maxQosDirectToTLC";
                          uint64_t v21 = a1;
                          int v22 = 467;
                          goto LABEL_22;
                        case 468:
                          size_t v20 = "wcacheDirtyAtFlush";
                          uint64_t v21 = a1;
                          int v22 = 468;
                          goto LABEL_85;
                        case 469:
                          size_t v20 = "raidReconstructSuccessPartition";
                          uint64_t v21 = a1;
                          int v22 = 469;
                          goto LABEL_20;
                        case 470:
                          size_t v20 = "raidReconstructFailPartition";
                          uint64_t v21 = a1;
                          int v22 = 470;
                          goto LABEL_20;
                        case 471:
                          uint64_t v18 = *v8;
                          v19 = "raidUncleanBootBandFail";
                          goto LABEL_13;
                        case 472:
                          uint64_t v18 = *v8;
                          v19 = "raidReconstructFailBandFlowHost";
                          goto LABEL_13;
                        case 473:
                          uint64_t v18 = *v8;
                          v19 = "raidReconstructFailBandFlowGC";
                          goto LABEL_13;
                        case 476:
                          size_t v20 = "raidSuccessfulRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 476;
                          goto LABEL_20;
                        case 477:
                          size_t v20 = "raidFailedRecoLbaRange";
                          uint64_t v21 = a1;
                          int v22 = 477;
                          goto LABEL_20;
                        case 481:
                          size_t v20 = "skinnyBandErases_481";
                          uint64_t v21 = a1;
                          int v22 = 481;
                          goto LABEL_155;
                        case 483:
                          uint64_t v18 = *v8;
                          v19 = "tlcOverHeatWaterfall";
                          goto LABEL_13;
                        case 484:
                          uint64_t v18 = *v8;
                          v19 = "skinnyCyclesConvert";
                          goto LABEL_13;
                        case 485:
                          uint64_t v18 = *v8;
                          v19 = "non_proportional_directToTLCSectors";
                          goto LABEL_13;
                        case 486:
                          uint64_t v18 = *v8;
                          v19 = "maxFailedFastCxtSync";
                          goto LABEL_13;
                        case 487:
                          uint64_t v18 = *v8;
                          v19 = "numFormatUserArea";
                          goto LABEL_13;
                        case 488:
                          uint64_t v18 = *v8;
                          v19 = "clogFastCxtSyncAborted";
                          goto LABEL_13;
                        case 489:
                          size_t v20 = "clogOccupationSectors";
                          uint64_t v21 = a1;
                          int v22 = 489;
                          goto LABEL_19;
                        case 490:
                          size_t v20 = "bdrTmpHist";
                          uint64_t v21 = a1;
                          int v22 = 490;
LABEL_342:
                          int v14 = v8;
                          unsigned int v15 = 64;
                          goto LABEL_12;
                        case 491:
                          uint64_t v18 = *v8;
                          v19 = "numFWUpdates";
                          goto LABEL_13;
                        case 492:
                          uint64_t v18 = *v8;
                          v19 = "numClogLoadFails";
                          goto LABEL_13;
                        case 493:
                          uint64_t v18 = *v8;
                          v19 = "rxBurnNumForcedDiffMode";
                          goto LABEL_13;
                        case 494:
                          uint64_t v18 = *v8;
                          v19 = "RD_numSaves";
                          goto LABEL_13;
                        case 495:
                          uint64_t v18 = *v8;
                          v19 = "eanCompressWrites";
                          goto LABEL_13;
                        case 496:
                          uint64_t v18 = *v8;
                          v19 = "eanHostWrites";
                          goto LABEL_13;
                        case 497:
                          uint64_t v18 = *v8;
                          v19 = "bandPreErases";
                          goto LABEL_13;
                        case 498:
                          uint64_t v18 = *v8;
                          v19 = "eanHostUnmaps";
                          goto LABEL_13;
                        case 499:
                          uint64_t v18 = *v8;
                          v19 = "eanHostFlushes";
                          goto LABEL_13;
                        case 500:
                          uint64_t v18 = *v8;
                          v19 = "eanFastWrites";
                          goto LABEL_13;
                        case 501:
                          uint64_t v18 = *v8;
                          v19 = "autowriteDS2FSCollisions";
                          goto LABEL_13;
                        case 502:
                          uint64_t v18 = *v8;
                          v19 = "autowriteWaitTransferTaskBlocks";
                          goto LABEL_13;
                        case 503:
                          size_t v20 = "avgCycle";
                          uint64_t v21 = a1;
                          int v22 = 503;
                          goto LABEL_20;
                        case 504:
                          uint64_t v18 = *v8;
                          v19 = "RD_DeferredClearsOverflowCnt";
                          goto LABEL_13;
                        default:
                          switch(v7)
                          {
                            case 505:
                              uint64_t v18 = *v8;
                              v19 = "maxVerticsInBand";
                              goto LABEL_13;
                            case 506:
                              uint64_t v18 = *v8;
                              v19 = "numVertics";
                              goto LABEL_13;
                            case 507:
                              uint64_t v18 = *v8;
                              v19 = "exceededCVertics";
                              goto LABEL_13;
                            case 510:
                              uint64_t v18 = *v8;
                              v19 = "raidReconstructFailMismatch";
                              goto LABEL_13;
                            case 511:
                              size_t v20 = "mspbootBlockRefreshCnt";
                              uint64_t v21 = a1;
                              int v22 = 511;
                              goto LABEL_155;
                            case 516:
                              size_t v20 = "mspBootBlockRefreshTime";
                              uint64_t v21 = a1;
                              int v22 = 516;
                              goto LABEL_155;
                            case 517:
                              uint64_t v18 = *v8;
                              v19 = "mspBootBlockCountPerMsp";
                              goto LABEL_13;
                            case 518:
                              uint64_t v18 = *v8;
                              v19 = "skinnyRevectorSLC";
                              goto LABEL_13;
                            case 519:
                              uint64_t v18 = *v8;
                              v19 = "skinnyRevectorTLC";
                              goto LABEL_13;
                            case 520:
                              uint64_t v18 = *v8;
                              v19 = "perfSetupAttempts";
                              goto LABEL_13;
                            case 521:
                              uint64_t v18 = *v8;
                              v19 = "perfSetupSuccesses";
                              goto LABEL_13;
                            case 522:
                              uint64_t v18 = *v8;
                              v19 = "perfWriteAttempts";
                              goto LABEL_13;
                            case 523:
                              uint64_t v18 = *v8;
                              v19 = "perfWriteSuccesses";
                              goto LABEL_13;
                            case 524:
                              uint64_t v18 = *v8;
                              v19 = "perfReadAttempts";
                              goto LABEL_13;
                            case 525:
                              uint64_t v18 = *v8;
                              v19 = "perfReadSuccesses";
                              goto LABEL_13;
                            case 526:
                              uint64_t v18 = *v8;
                              v19 = "perfCleanupAttempts";
                              goto LABEL_13;
                            case 527:
                              uint64_t v18 = *v8;
                              v19 = "perfCleanupSuccesses";
                              goto LABEL_13;
                            case 530:
                              uint64_t v18 = *v8;
                              v19 = "firstFailedDieId";
                              goto LABEL_13;
                            case 531:
                              uint64_t v18 = *v8;
                              v19 = "numDieFailures";
                              goto LABEL_13;
                            case 532:
                              uint64_t v18 = *v8;
                              v19 = "spareAvailablePercent";
                              goto LABEL_13;
                            case 533:
                              uint64_t v18 = *v8;
                              v19 = "dataFabricErr";
                              goto LABEL_13;
                            case 534:
                              uint64_t v18 = *v8;
                              v19 = "downlinkFabricErr";
                              goto LABEL_13;
                            case 535:
                              uint64_t v18 = *v8;
                              v19 = "prpAccTimeoutErr";
                              goto LABEL_13;
                            case 537:
                              uint64_t v18 = *v8;
                              v19 = "uplinkFabricErr";
                              goto LABEL_13;
                            case 538:
                              uint64_t v18 = *v8;
                              v19 = "skinnyBandsGBB";
                              goto LABEL_13;
                            case 539:
                              uint64_t v18 = *v8;
                              v19 = "AbortPad_GcMustPadBand";
                              goto LABEL_13;
                            case 540:
                              uint64_t v18 = *v8;
                              v19 = "AbortPad_GcMustPadSkinny";
                              goto LABEL_13;
                            case 541:
                              uint64_t v18 = *v8;
                              v19 = "bdrHostPingInitial";
                              goto LABEL_13;
                            case 542:
                              uint64_t v18 = *v8;
                              v19 = "bdrHostPingMoreNeeded";
                              goto LABEL_13;
                            case 543:
                              uint64_t v18 = *v8;
                              v19 = "bandParityAllocationFailed";
                              goto LABEL_13;
                            case 544:
                              uint64_t v18 = *v8;
                              v19 = "fastHwBurstToSlc";
                              goto LABEL_13;
                            case 545:
                              uint64_t v18 = *v8;
                              v19 = "slowHwToTlc";
                              goto LABEL_13;
                            case 546:
                              size_t v20 = "slcDemandBurstSizeDetected";
                              uint64_t v21 = a1;
                              int v22 = 546;
                              goto LABEL_11;
                            case 547:
                              size_t v20 = "slcDemandBurstDur";
                              uint64_t v21 = a1;
                              int v22 = 547;
                              goto LABEL_11;
                            case 548:
                              uint64_t v18 = *v8;
                              v19 = "fastHwToTlcBurst";
                              goto LABEL_13;
                            case 549:
                              size_t v20 = "slcDemandBurstSizeSlc";
                              uint64_t v21 = a1;
                              int v22 = 549;
                              goto LABEL_11;
                            case 551:
                              size_t v20 = "balanceProportionBucketsHistogramTlc";
                              uint64_t v21 = a1;
                              int v22 = 551;
                              goto LABEL_320;
                            case 553:
                              uint64_t v18 = *v8;
                              v19 = "slowHwFlushToSlc";
                              goto LABEL_13;
                            case 557:
                              uint64_t v18 = *v8;
                              v19 = "slowHwToSlc";
                              goto LABEL_13;
                            case 558:
                              uint64_t v18 = *v8;
                              v19 = "flushNwToSlc";
                              goto LABEL_13;
                            case 559:
                              uint64_t v18 = *v8;
                              v19 = "flushNwToTlc";
                              goto LABEL_13;
                            case 560:
                              uint64_t v18 = *v8;
                              v19 = "oslcHw";
                              goto LABEL_13;
                            case 561:
                              uint64_t v18 = *v8;
                              v19 = "oslcTransitions";
                              goto LABEL_13;
                            case 563:
                              uint64_t v18 = *v8;
                              v19 = "slcDemandFlushCount";
                              goto LABEL_13;
                            case 564:
                              uint64_t v18 = *v8;
                              v19 = "slcDemandBurstCount";
                              goto LABEL_13;
                            case 565:
                              uint64_t v18 = *v8;
                              v19 = "oslcBaseAvgPE";
                              goto LABEL_13;
                            case 566:
                              uint64_t v18 = *v8;
                              v19 = "raidReconstructFailNoSPBX";
                              goto LABEL_13;
                            case 567:
                              uint64_t v18 = *v8;
                              v19 = "raidReconstructFailDouble";
                              goto LABEL_13;
                            case 568:
                              uint64_t v18 = *v8;
                              v19 = "oslcFastWAmpUOnOff";
                              goto LABEL_13;
                            case 569:
                              uint64_t v18 = *v8;
                              v19 = "oslcSlowWAmpUOnOff";
                              goto LABEL_13;
                            case 570:
                              uint64_t v18 = *v8;
                              v19 = "raidReconstructFailInvalid";
                              goto LABEL_13;
                            case 572:
                              uint64_t v18 = *v8;
                              v19 = "oslcLastWAmpUx10";
                              goto LABEL_13;
                            case 573:
                              uint64_t v18 = *v8;
                              v19 = "raidFailedReadNoBlog";
                              goto LABEL_13;
                            case 574:
                              uint64_t v18 = *v8;
                              v19 = "raidReconstructFailBlank";
                              goto LABEL_13;
                            case 575:
                              uint64_t v18 = *v8;
                              v19 = "oslcHotTLCOnOff";
                              goto LABEL_13;
                            case 576:
                              uint64_t v18 = *v8;
                              v19 = "gcVPackDestinations";
                              goto LABEL_13;
                            case 581:
                              uint64_t v18 = *v8;
                              v19 = "averageTLCPECycles";
                              goto LABEL_13;
                            case 582:
                              uint64_t v18 = *v8;
                              v19 = "averageSLCPECycles";
                              goto LABEL_13;
                            case 583:
                              uint64_t v18 = *v8;
                              v19 = "numAtomicBoots";
                              goto LABEL_13;
                            case 584:
                              uint64_t v18 = *v8;
                              v19 = "clogMinorMismatch";
                              goto LABEL_13;
                            case 586:
                              uint64_t v18 = *v8;
                              v19 = "raidExpectedFailRMXReconstructionInternal";
                              goto LABEL_13;
                            case 587:
                              uint64_t v18 = *v8;
                              v19 = "raidExpectedFailRMXReconstructionHost";
                              goto LABEL_13;
                            case 588:
                              uint64_t v18 = *v8;
                              v19 = "oslcGCinvalidations";
                              goto LABEL_13;
                            case 589:
                              uint64_t v18 = *v8;
                              v19 = "oslcGCActivateReason";
                              goto LABEL_13;
                            default:
                              switch(v7)
                              {
                                case 590:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcLowCleanBandsUOnOff";
                                  goto LABEL_13;
                                case 591:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcTooManyGCMustOnOff";
                                  goto LABEL_13;
                                case 592:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcBaseHostWrites";
                                  goto LABEL_13;
                                case 593:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcBaseBandErases";
                                  goto LABEL_13;
                                case 594:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcBdrBands";
                                  goto LABEL_13;
                                case 595:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcBdrValid";
                                  goto LABEL_13;
                                case 596:
                                  uint64_t v18 = *v8;
                                  v19 = "unexpectedBlanksInternal";
                                  goto LABEL_13;
                                case 597:
                                  uint64_t v18 = *v8;
                                  v19 = "unexpectedBlanksOnRV";
                                  goto LABEL_13;
                                case 601:
                                  uint64_t v18 = *v8;
                                  v19 = "waterfallLockSectors";
                                  goto LABEL_13;
                                case 602:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcGCActiveWrites";
                                  goto LABEL_13;
                                case 603:
                                  uint64_t v18 = *v8;
                                  v19 = "chipIdTemperatureSample";
                                  goto LABEL_13;
                                case 604:
                                  uint64_t v18 = *v8;
                                  v19 = "gcVPackWrites";
                                  goto LABEL_13;
                                case 605:
                                  size_t v20 = "gcActiveReasons";
                                  uint64_t v21 = a1;
                                  int v22 = 605;
                                  goto LABEL_11;
                                case 606:
                                  uint64_t v18 = *v8;
                                  v19 = "eanMaxInitTimeMs";
                                  goto LABEL_13;
                                case 607:
                                  uint64_t v18 = *v8;
                                  v19 = "eanMinToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 608:
                                  uint64_t v18 = *v8;
                                  v19 = "skinnyAPGMRetire";
                                  goto LABEL_13;
                                case 609:
                                  uint64_t v18 = *v8;
                                  v19 = "unexpectedBlanksHost";
                                  goto LABEL_13;
                                case 610:
                                  size_t v20 = "pcieAerCounters";
                                  uint64_t v21 = a1;
                                  int v22 = 610;
                                  goto LABEL_342;
                                case 611:
                                  uint64_t v18 = *v8;
                                  v19 = "fastHwToTlcBalance";
                                  goto LABEL_13;
                                case 612:
                                  uint64_t v18 = *v8;
                                  v19 = "perfOSLCRuns";
                                  goto LABEL_13;
                                case 613:
                                  uint64_t v18 = *v8;
                                  v19 = "slcDemandBurstWritesInGC";
                                  goto LABEL_13;
                                case 614:
                                  uint64_t v18 = *v8;
                                  v19 = "slcDemandBurstWritesInTT";
                                  goto LABEL_13;
                                case 615:
                                  uint64_t v18 = *v8;
                                  v19 = "slcDemandBurstWritesInNRP";
                                  goto LABEL_13;
                                case 616:
                                  uint64_t v18 = *v8;
                                  v19 = "perfTotalDmaMb";
                                  goto LABEL_13;
                                case 617:
                                  uint64_t v18 = *v8;
                                  v19 = "eanAvgInitTimeMs";
                                  goto LABEL_13;
                                case 618:
                                  uint64_t v18 = *v8;
                                  v19 = "eanAvgToFirstReadTimeMs";
                                  goto LABEL_13;
                                case 619:
                                  uint64_t v18 = *v8;
                                  v19 = "eanMaxBootReadTimeMs";
                                  goto LABEL_13;
                                case 620:
                                  uint64_t v18 = *v8;
                                  v19 = "eanAvgBootReadTimeMs";
                                  goto LABEL_13;
                                case 621:
                                  size_t v20 = "eanBootReadsHist";
                                  uint64_t v21 = a1;
                                  int v22 = 621;
                                  goto LABEL_11;
                                case 622:
                                  uint64_t v18 = *v8;
                                  v19 = "maxBgInitTimeMs";
                                  goto LABEL_13;
                                case 623:
                                  uint64_t v18 = *v8;
                                  v19 = "avgBgInitTimeMs";
                                  goto LABEL_13;
                                case 624:
                                  size_t v20 = "clogFailReason";
                                  uint64_t v21 = a1;
                                  int v22 = 624;
                                  goto LABEL_85;
                                case 625:
                                  uint64_t v18 = *v8;
                                  v19 = "eanMinBootReadMBPerSec";
                                  goto LABEL_13;
                                case 626:
                                  uint64_t v18 = *v8;
                                  v19 = "eanAvgBootReadMBPerSec";
                                  goto LABEL_13;
                                case 627:
                                  uint64_t v18 = *v8;
                                  v19 = "minSkinnyPECycles";
                                  goto LABEL_13;
                                case 628:
                                  uint64_t v18 = *v8;
                                  v19 = "maxSkinnyPECycles";
                                  goto LABEL_13;
                                case 629:
                                  uint64_t v18 = *v8;
                                  v19 = "averageSkinnyPECycles";
                                  goto LABEL_13;
                                case 630:
                                  size_t v20 = "raidSuccessfulRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 630;
                                  goto LABEL_463;
                                case 631:
                                  size_t v20 = "raidFailedRecoEAN";
                                  uint64_t v21 = a1;
                                  int v22 = 631;
                                  goto LABEL_463;
                                case 632:
                                  size_t v20 = "eanFirstReadMode";
                                  uint64_t v21 = a1;
                                  int v22 = 632;
LABEL_463:
                                  int v14 = v8;
                                  unsigned int v15 = 6;
                                  goto LABEL_12;
                                case 635:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcHwGC";
                                  goto LABEL_13;
                                case 636:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcHwTT";
                                  goto LABEL_13;
                                case 637:
                                  uint64_t v18 = *v8;
                                  v19 = "oslcHwNRP";
                                  goto LABEL_13;
                                case 638:
                                  size_t v20 = "oslcDemandBurstSize";
                                  uint64_t v21 = a1;
                                  int v22 = 638;
                                  goto LABEL_11;
                                case 639:
                                  uint64_t v18 = *v8;
                                  v19 = "raidReconstructSuccessBandFlowOslc";
                                  goto LABEL_13;
                                case 640:
                                  uint64_t v18 = *v8;
                                  v19 = "raidReconstructFailBandFlowOslc";
                                  goto LABEL_13;
                                case 641:
                                  uint64_t v18 = *v8;
                                  v19 = "raidFailSectors";
                                  goto LABEL_13;
                                case 642:
                                  uint64_t v18 = *v8;
                                  v19 = "eanFailSectors";
                                  goto LABEL_13;
                                case 643:
                                  uint64_t v18 = *v8;
                                  v19 = "bdrTimeMode";
                                  goto LABEL_13;
                                case 644:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityNotSavedP";
                                  goto LABEL_13;
                                case 645:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityNotSavedQ";
                                  goto LABEL_13;
                                case 646:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityInvalid";
                                  goto LABEL_13;
                                case 647:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityUnknown";
                                  goto LABEL_13;
                                case 648:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityUnmapped";
                                  goto LABEL_13;
                                case 649:
                                  uint64_t v18 = *v8;
                                  v19 = "raidParityGCUnc";
                                  goto LABEL_13;
                                case 657:
                                  uint64_t v18 = *v8;
                                  v19 = "AbortSkip_MPBXProbational";
                                  goto LABEL_13;
                                case 659:
                                  uint64_t v18 = *v8;
                                  v19 = "raidVerificationReads";
                                  goto LABEL_13;
                                case 666:
                                  uint64_t v18 = *v8;
                                  v19 = "nofDies";
                                  goto LABEL_13;
                                case 671:
                                  uint64_t v18 = *v8;
                                  v19 = "skinnyBandsNum";
                                  goto LABEL_13;
                                case 672:
                                  uint64_t v18 = *v8;
                                  v19 = "skinnyBandsNumDips";
                                  goto LABEL_13;
                                case 674:
                                  size_t v20 = "oslcNoVotesHw";
                                  uint64_t v21 = a1;
                                  int v22 = 674;
                                  goto LABEL_23;
                                case 675:
                                  uint64_t v18 = *v8;
                                  v19 = "totalLbas";
                                  goto LABEL_13;
                                case 676:
                                  uint64_t v18 = *v8;
                                  v19 = "bdrHostPingExtra";
                                  goto LABEL_13;
                                case 677:
                                  uint64_t v18 = *v8;
                                  v19 = "magazineInstanceMeta";
                                  goto LABEL_13;
                                default:
                                  switch(v7)
                                  {
                                    case 680:
                                      size_t v20 = "magazineFWVersion";
                                      uint64_t v21 = a1;
                                      int v22 = 680;
                                      goto LABEL_21;
                                    case 681:
                                      uint64_t v18 = *v8;
                                      v19 = "raidReconstructFailPMXUnsup";
                                      goto LABEL_13;
                                    case 682:
                                      uint64_t v18 = *v8;
                                      v19 = "raidReconstructFailBMXUnsup";
                                      goto LABEL_13;
                                    case 683:
                                      uint64_t v18 = *v8;
                                      v19 = "iBootNANDResets";
                                      goto LABEL_13;
                                    case 684:
                                      uint64_t v18 = *v8;
                                      v19 = "pcieClkreqHighTimeout";
                                      goto LABEL_13;
                                    case 687:
                                      size_t v20 = "cbdrInitSent";
                                      uint64_t v21 = a1;
                                      int v22 = 687;
LABEL_21:
                                      int v14 = v8;
                                      unsigned int v15 = 3;
                                      goto LABEL_12;
                                    case 688:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrPauseSent";
                                      goto LABEL_13;
                                    case 689:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrResumeSent";
                                      goto LABEL_13;
                                    case 690:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrGetResultSent";
                                      goto LABEL_13;
                                    case 691:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrEarlyExits";
                                      goto LABEL_13;
                                    case 694:
                                      size_t v20 = "cbdrRefreshGrades";
                                      uint64_t v21 = a1;
                                      int v22 = 694;
                                      goto LABEL_11;
                                    case 695:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrNotEnoughReads";
                                      goto LABEL_13;
                                    case 696:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrAborts";
                                      goto LABEL_13;
                                    case 697:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidHostClassifications";
                                      goto LABEL_13;
                                    case 698:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidInternalClassifications";
                                      goto LABEL_13;
                                    case 699:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrFullyDone";
                                      goto LABEL_13;
                                    case 702:
                                      size_t v20 = "vcurve";
                                      uint64_t v21 = a1;
                                      int v22 = 702;
                                      goto LABEL_155;
                                    case 703:
                                      size_t v20 = "injDepth";
                                      uint64_t v21 = a1;
                                      int v22 = 703;
                                      goto LABEL_153;
                                    case 704:
                                      uint64_t v18 = *v8;
                                      v19 = "logical_disk_occupied_promiles";
                                      goto LABEL_13;
                                    case 711:
                                      uint64_t v18 = *v8;
                                      v19 = "raidPrevFailedReconstructSkip";
                                      goto LABEL_13;
                                    case 712:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidSuccessfulHostAuxReads";
                                      goto LABEL_13;
                                    case 713:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidSuccessfulInternalAuxReads";
                                      goto LABEL_13;
                                    case 714:
                                      uint64_t v18 = *v8;
                                      v19 = "turboRaidClassificationReliabilityHost";
                                      goto LABEL_13;
                                    case 715:
                                      uint64_t v18 = *v8;
                                      v19 = "turboRaidClassificationReliabilityInternal";
                                      goto LABEL_13;
                                    case 716:
                                      uint64_t v18 = *v8;
                                      v19 = "turboRaidClassificationQualityHost";
                                      goto LABEL_13;
                                    case 717:
                                      uint64_t v18 = *v8;
                                      v19 = "turboRaidClassificationQualityInternal";
                                      goto LABEL_13;
                                    case 719:
                                      uint64_t v18 = *v8;
                                      v19 = "skinnyBandErases";
                                      goto LABEL_13;
                                    case 721:
                                      uint64_t v18 = *v8;
                                      v19 = "gcPDusterDestinations";
                                      goto LABEL_13;
                                    case 722:
                                      uint64_t v18 = *v8;
                                      v19 = "gcPDusterWrites";
                                      goto LABEL_13;
                                    case 730:
                                      uint64_t v18 = *v8;
                                      v19 = "rvFails";
                                      goto LABEL_13;
                                    case 737:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidFailedHostAuxReads";
                                      goto LABEL_13;
                                    case 738:
                                      uint64_t v18 = *v8;
                                      v19 = "TurboRaidFailedInternalAuxReads";
                                      goto LABEL_13;
                                    case 741:
                                      uint64_t v18 = *v8;
                                      v19 = "autoSkipTriggers";
                                      goto LABEL_13;
                                    case 742:
                                      uint64_t v18 = *v8;
                                      v19 = "autoSkipPlanes";
                                      goto LABEL_13;
                                    case 744:
                                      size_t v20 = "raidReconstructDurationHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 744;
                                      goto LABEL_23;
                                    case 745:
                                      size_t v20 = "failsOnReconstructHisto";
                                      uint64_t v21 = a1;
                                      int v22 = 745;
                                      goto LABEL_23;
                                    case 746:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_userFlattenExcessive";
                                      goto LABEL_13;
                                    case 747:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_IntFlattenExcessive";
                                      goto LABEL_13;
                                    case 748:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_userFlattenBalance";
                                      goto LABEL_13;
                                    case 749:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_intFlattenBalance";
                                      goto LABEL_13;
                                    case 750:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_formatVertExcessive";
                                      goto LABEL_13;
                                    case 751:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_formatVertBalance";
                                      goto LABEL_13;
                                    case 753:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrNumSlowRefreshes";
                                      goto LABEL_13;
                                    case 754:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrNumFastRefreshes";
                                      goto LABEL_13;
                                    case 755:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrTotalRefreshValidity";
                                      goto LABEL_13;
                                    case 756:
                                      size_t v20 = "cbdrRefreshedAges";
                                      uint64_t v21 = a1;
                                      int v22 = 756;
                                      goto LABEL_545;
                                    case 758:
                                      uint64_t v18 = *v8;
                                      v19 = "cbdrSkippedBlocks";
                                      goto LABEL_13;
                                    case 759:
                                      size_t v20 = "cbdrScanPct";
                                      uint64_t v21 = a1;
                                      int v22 = 759;
                                      goto LABEL_19;
                                    case 760:
                                      uint64_t v18 = *v8;
                                      v19 = "raidSuccessfulBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 761:
                                      uint64_t v18 = *v8;
                                      v19 = "raidSuccessfulBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 762:
                                      uint64_t v18 = *v8;
                                      v19 = "raidFailedBMXReconstructionInternal";
                                      goto LABEL_13;
                                    case 763:
                                      uint64_t v18 = *v8;
                                      v19 = "raidFailedBMXReconstructionHost";
                                      goto LABEL_13;
                                    case 764:
                                      uint64_t v18 = *v8;
                                      v19 = "ricSPRVFail";
                                      goto LABEL_13;
                                    case 765:
                                      uint64_t v18 = *v8;
                                      v19 = "ricMPRVFail";
                                      goto LABEL_13;
                                    case 767:
                                      size_t v20 = "cbdrRefreshGradesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 767;
                                      goto LABEL_11;
                                    case 768:
                                      size_t v20 = "cbdrRefreshedAgesSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 768;
LABEL_545:
                                      int v14 = v8;
                                      unsigned int v15 = 9;
                                      goto LABEL_12;
                                    case 769:
                                      size_t v20 = "cbdrScanPctSLC";
                                      uint64_t v21 = a1;
                                      int v22 = 769;
                                      goto LABEL_19;
                                    case 770:
                                      size_t v20 = "cpuBurstLength";
                                      uint64_t v21 = a1;
                                      int v22 = 770;
                                      goto LABEL_23;
                                    case 771:
                                      uint64_t v18 = *v8;
                                      v19 = "autoSkipRaidRecoFail";
                                      goto LABEL_13;
                                    case 772:
                                      size_t v20 = "dmReasonsSlc";
                                      uint64_t v21 = a1;
                                      int v22 = 772;
                                      goto LABEL_155;
                                    case 773:
                                      size_t v20 = "dmReasonsTlc";
                                      uint64_t v21 = a1;
                                      int v22 = 773;
                                      goto LABEL_155;
                                    case 774:
                                      uint64_t v18 = *v8;
                                      v19 = "raidReconstructFailBMXAbort";
                                      goto LABEL_13;
                                    case 775:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_fatBindingNoBlocks";
                                      goto LABEL_13;
                                    case 776:
                                      uint64_t v18 = *v8;
                                      v19 = "bandKill_fatBindingFewBlocks";
                                      goto LABEL_13;
                                    default:
                                      switch(v7)
                                      {
                                        case 777:
                                          uint64_t v18 = *v8;
                                          v19 = "numBadBootBlocks";
                                          goto LABEL_13;
                                        case 778:
                                          uint64_t v18 = *v8;
                                          v19 = "snapshotCPUHigh";
                                          goto LABEL_13;
                                        case 779:
                                          uint64_t v18 = *v8;
                                          v19 = "snapshotCPULow";
                                          goto LABEL_13;
                                        case 780:
                                          uint64_t v18 = *v8;
                                          v19 = "gcWithoutBMs";
                                          goto LABEL_13;
                                        case 781:
                                          size_t v20 = "gcSearchTimeHistory";
                                          uint64_t v21 = a1;
                                          int v22 = 781;
                                          goto LABEL_11;
                                        case 785:
                                          size_t v20 = "gcSearchPortion";
                                          uint64_t v21 = a1;
                                          int v22 = 785;
                                          goto LABEL_85;
                                        case 786:
                                          uint64_t v18 = *v8;
                                          v19 = "raidReconstructFailBmxMp";
                                          goto LABEL_13;
                                        case 787:
                                          uint64_t v18 = *v8;
                                          v19 = "raidReconstructFailBmx";
                                          goto LABEL_13;
                                        case 788:
                                          uint64_t v18 = *v8;
                                          v19 = "raidReconstructFailBMXUECC";
                                          goto LABEL_13;
                                        case 789:
                                          uint64_t v18 = *v8;
                                          v19 = "raidReconstructFailBMXBlank";
                                          goto LABEL_13;
                                        case 790:
                                          uint64_t v18 = *v8;
                                          v19 = "raidPrevFailedReconstructBmxMpSkip";
                                          goto LABEL_13;
                                        case 792:
                                          uint64_t v18 = *v8;
                                          v19 = "numTLCFatBands";
                                          goto LABEL_13;
                                        case 793:
                                          uint64_t v18 = *v8;
                                          v19 = "fatValidity";
                                          goto LABEL_13;
                                        case 794:
                                          uint64_t v18 = *v8;
                                          v19 = "fatTotal";
                                          goto LABEL_13;
                                        case 798:
                                          size_t v20 = "raidBMXFailP";
                                          uint64_t v21 = a1;
                                          int v22 = 798;
                                          goto LABEL_22;
                                        case 799:
                                          size_t v20 = "raidBMXFailUECC";
                                          uint64_t v21 = a1;
                                          int v22 = 799;
                                          goto LABEL_22;
                                        case 804:
                                          size_t v20 = "raidBMXFailNoSPBX";
                                          uint64_t v21 = a1;
                                          int v22 = 804;
                                          goto LABEL_22;
                                        case 806:
                                          size_t v20 = "raidBMXFailBlank";
                                          uint64_t v21 = a1;
                                          int v22 = 806;
                                          goto LABEL_22;
                                        case 809:
                                          size_t v20 = "raidBMXFailUnsup";
                                          uint64_t v21 = a1;
                                          int v22 = 809;
                                          goto LABEL_22;
                                        case 811:
                                          size_t v20 = "raidBMXFailMpSkip";
                                          uint64_t v21 = a1;
                                          int v22 = 811;
                                          goto LABEL_22;
                                        case 812:
                                          size_t v20 = "raidBMXFailAbort";
                                          uint64_t v21 = a1;
                                          int v22 = 812;
                                          goto LABEL_22;
                                        case 813:
                                          uint64_t v18 = *v8;
                                          v19 = "TurboRaidIsEnabled";
                                          goto LABEL_13;
                                        case 814:
                                          size_t v20 = "raidBMXFailOther";
                                          uint64_t v21 = a1;
                                          int v22 = 814;
                                          goto LABEL_22;
                                        case 815:
                                          size_t v20 = "raidBMXSuccess";
                                          uint64_t v21 = a1;
                                          int v22 = 815;
                                          goto LABEL_22;
                                        case 816:
                                          uint64_t v18 = *v8;
                                          v19 = "skinnyBandsExtraDip";
                                          goto LABEL_13;
                                        case 821:
                                          uint64_t v18 = *v8;
                                          v19 = "writeAmp";
                                          goto LABEL_13;
                                        case 822:
                                          uint64_t v18 = *v8;
                                          v19 = "ricMaxClogOnlyPages";
                                          goto LABEL_13;
                                        case 823:
                                          size_t v20 = "readClassifyStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 823;
                                          goto LABEL_21;
                                        case 824:
                                          size_t v20 = "readWithAuxStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 824;
                                          goto LABEL_11;
                                        case 825:
                                          size_t v20 = "readReconstructStatusesHisto";
                                          uint64_t v21 = a1;
                                          int v22 = 825;
                                          goto LABEL_11;
                                        case 826:
                                          uint64_t v18 = *v8;
                                          v19 = "bdrBackupChecks";
                                          goto LABEL_13;
                                        case 827:
                                          uint64_t v18 = *v8;
                                          v19 = "ricExceedClogOnlyPagesTH";
                                          goto LABEL_13;
                                        case 828:
                                          uint64_t v18 = *v8;
                                          v19 = "numDipFailures";
                                          goto LABEL_13;
                                        case 831:
                                          uint64_t v18 = *v8;
                                          v19 = "prefetchNextRange";
                                          goto LABEL_13;
                                        case 862:
                                          uint64_t v18 = *v8;
                                          v19 = "raidSuccessfulSkip";
                                          goto LABEL_13;
                                        case 863:
                                          uint64_t v18 = *v8;
                                          v19 = "raidFailedSkip";
                                          goto LABEL_13;
                                        case 864:
                                          uint64_t v18 = *v8;
                                          v19 = "raidSkipAttempts";
                                          goto LABEL_13;
                                        case 865:
                                          size_t v20 = "timeOfThrottlingPerLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 865;
                                          goto LABEL_85;
                                        case 866:
                                          size_t v20 = "timeOfThrottlingPerReadLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 866;
                                          goto LABEL_85;
                                        case 867:
                                          size_t v20 = "timeOfThrottlingPerWriteLevel";
                                          uint64_t v21 = a1;
                                          int v22 = 867;
                                          goto LABEL_85;
                                        case 868:
                                          size_t v20 = "dmReasonsSlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 868;
                                          goto LABEL_155;
                                        case 869:
                                          size_t v20 = "dmReasonsTlc_1bc";
                                          uint64_t v21 = a1;
                                          int v22 = 869;
                                          goto LABEL_155;
                                        case 870:
                                          size_t v20 = "dmReasonsSlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 870;
                                          goto LABEL_155;
                                        case 871:
                                          size_t v20 = "dmReasonsTlc_1bc_he";
                                          uint64_t v21 = a1;
                                          int v22 = 871;
                                          goto LABEL_155;
                                        case 876:
                                          size_t v20 = "dmReasonsSlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 876;
                                          goto LABEL_155;
                                        case 877:
                                          size_t v20 = "dmReasonsTlc_mbc";
                                          uint64_t v21 = a1;
                                          int v22 = 877;
                                          goto LABEL_155;
                                        case 883:
                                          uint64_t v18 = *v8;
                                          v19 = "clogEmptyProgramms";
                                          goto LABEL_13;
                                        case 884:
                                          uint64_t v18 = *v8;
                                          v19 = "oslcHwCloseBand";
                                          goto LABEL_13;
                                        case 891:
                                          size_t v20 = "turboRaidSuccessAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 891;
                                          goto LABEL_20;
                                        case 892:
                                          size_t v20 = "turboRaidFailAuxPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 892;
                                          goto LABEL_20;
                                        case 893:
                                          size_t v20 = "turboRaidClassifyQualPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 893;
                                          goto LABEL_20;
                                        case 894:
                                          size_t v20 = "turboRaidClassifyRelPartition";
                                          uint64_t v21 = a1;
                                          int v22 = 894;
                                          goto LABEL_20;
                                        case 895:
                                          uint64_t v18 = *v8;
                                          v19 = "IND_pool_freeMinSilo";
                                          goto LABEL_13;
                                        case 896:
                                          uint64_t v18 = *v8;
                                          v19 = "autoSweepBlocks";
                                          goto LABEL_13;
                                        case 897:
                                          size_t v20 = "wcWrFragSizes";
                                          uint64_t v21 = a1;
                                          int v22 = 897;
                                          goto LABEL_85;
                                        case 898:
                                          size_t v20 = "indStateAcrossGcDidNoL";
                                          uint64_t v21 = a1;
                                          int v22 = 898;
                                          goto LABEL_85;
                                        case 899:
                                          size_t v20 = "indStateAcrossGcDidL";
                                          uint64_t v21 = a1;
                                          int v22 = 899;
                                          goto LABEL_85;
                                        case 900:
                                          uint64_t v18 = *v8;
                                          v19 = "turboRaidNoClassifyDueToWasRetire";
                                          goto LABEL_13;
                                        case 901:
                                          uint64_t v18 = *v8;
                                          v19 = "turboRaidNoClassifyDueToOpenBand";
                                          goto LABEL_13;
                                        case 902:
                                          uint64_t v18 = *v8;
                                          v19 = "turboRaidNoClassifyDueToQualityBlock";
                                          goto LABEL_13;
                                        case 903:
                                          uint64_t v18 = *v8;
                                          v19 = "turboRaidGbbOpenBand";
                                          goto LABEL_13;
                                        case 904:
                                          uint64_t v18 = *v8;
                                          v19 = "turboRaidGbbShouldRetireOnRefresh";
                                          goto LABEL_13;
                                        case 905:
                                          size_t v20 = "turboRaidRelPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 905;
                                          goto LABEL_85;
                                        case 906:
                                          size_t v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                          uint64_t v21 = a1;
                                          int v22 = 906;
                                          goto LABEL_85;
                                        default:
                                          if (v7 <= 1039)
                                          {
                                            switch(v7)
                                            {
                                              case 907:
                                                size_t v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 907;
                                                goto LABEL_85;
                                              case 908:
                                                size_t v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 908;
                                                goto LABEL_85;
                                              case 909:
                                              case 910:
                                              case 911:
                                              case 912:
                                              case 913:
                                              case 914:
                                              case 915:
                                              case 916:
                                              case 917:
                                              case 924:
                                              case 925:
                                              case 926:
                                              case 927:
                                              case 928:
                                              case 929:
                                              case 936:
                                              case 941:
                                              case 945:
                                              case 946:
                                              case 947:
                                              case 949:
                                              case 950:
                                              case 952:
                                              case 954:
                                              case 955:
                                              case 956:
                                              case 957:
                                              case 958:
                                              case 959:
                                              case 960:
                                              case 963:
                                              case 964:
                                              case 965:
                                              case 966:
                                              case 968:
                                              case 969:
                                              case 970:
                                                goto LABEL_696;
                                              case 918:
                                                size_t v20 = "turboRaidMaxCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 918;
                                                goto LABEL_85;
                                              case 919:
                                                size_t v20 = "turboRaidMinCyclesBetweenRel";
                                                uint64_t v21 = a1;
                                                int v22 = 919;
                                                goto LABEL_85;
                                              case 920:
                                                size_t v20 = "turboRaidAuxPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 920;
                                                goto LABEL_85;
                                              case 921:
                                                size_t v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                                uint64_t v21 = a1;
                                                int v22 = 921;
                                                goto LABEL_85;
                                              case 922:
                                                uint64_t v18 = *v8;
                                                v19 = "turboRaidRelLockMark";
                                                goto LABEL_13;
                                              case 923:
                                                uint64_t v18 = *v8;
                                                v19 = "turboRaidAuxLockMark";
                                                goto LABEL_13;
                                              case 930:
                                                size_t v20 = "turboRaidMaxCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 930;
                                                goto LABEL_85;
                                              case 931:
                                                size_t v20 = "turboRaidMinCyclesBetweenAux";
                                                uint64_t v21 = a1;
                                                int v22 = 931;
                                                goto LABEL_85;
                                              case 932:
                                                size_t v20 = "turboRaidLastRelPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 932;
                                                goto LABEL_85;
                                              case 933:
                                                size_t v20 = "turboRaidRelQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 933;
                                                goto LABEL_85;
                                              case 934:
                                                size_t v20 = "turboRaidLastAuxPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 934;
                                                goto LABEL_85;
                                              case 935:
                                                size_t v20 = "turboRaidAuxQualPECycles";
                                                uint64_t v21 = a1;
                                                int v22 = 935;
                                                goto LABEL_85;
                                              case 937:
                                                uint64_t v18 = *v8;
                                                v19 = "turboRaidPEFailAfterRel";
                                                goto LABEL_13;
                                              case 938:
                                                uint64_t v18 = *v8;
                                                v19 = "turboRaidPEFailAfterAux";
                                                goto LABEL_13;
                                              case 939:
                                                uint64_t v18 = *v8;
                                                v19 = "dvfmVotesCPU";
                                                goto LABEL_13;
                                              case 940:
                                                uint64_t v18 = *v8;
                                                v19 = "dvfmVotesBandwidth";
                                                goto LABEL_13;
                                              case 942:
                                                uint64_t v18 = *v8;
                                                v19 = "maxSLCEndurance";
                                                goto LABEL_13;
                                              case 943:
                                                uint64_t v18 = *v8;
                                                v19 = "maxMixedEndurance";
                                                goto LABEL_13;
                                              case 944:
                                                uint64_t v18 = *v8;
                                                v19 = "maxNativeEndurance";
                                                goto LABEL_13;
                                              case 948:
                                                size_t v20 = "assertHistory";
                                                uint64_t v21 = a1;
                                                int v22 = 948;
                                                int v14 = v8;
                                                unsigned int v15 = 40;
                                                goto LABEL_12;
                                              case 951:
                                                uint64_t v18 = *v8;
                                                v19 = "asp3Support";
                                                goto LABEL_13;
                                              case 953:
                                                uint64_t v18 = *v8;
                                                v19 = "numCrossTempRaidUecc";
                                                goto LABEL_13;
                                              case 961:
                                                uint64_t v18 = *v8;
                                                v19 = "osBuildStr";
                                                goto LABEL_13;
                                              case 962:
                                                uint64_t v18 = *v8;
                                                v19 = "raidConfig";
                                                goto LABEL_13;
                                              case 967:
                                                size_t v20 = "indTrimFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 967;
                                                goto LABEL_153;
                                              case 971:
                                                size_t v20 = "indUsedFrags";
                                                uint64_t v21 = a1;
                                                int v22 = 971;
                                                goto LABEL_153;
                                              default:
                                                switch(v7)
                                                {
                                                  case 996:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogFindFail";
                                                    goto LABEL_14;
                                                  case 997:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogFindBlank";
                                                    goto LABEL_14;
                                                  case 998:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogFindUnc";
                                                    goto LABEL_14;
                                                  case 999:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogFindUnexpected";
                                                    goto LABEL_14;
                                                  case 1001:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1001;
                                                    size_t v20 = "clogReplayFailReason";
                                                    goto LABEL_23;
                                                  case 1002:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogReplayTransientError";
                                                    goto LABEL_14;
                                                  case 1003:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "clogReplaySpfError";
                                                    goto LABEL_14;
                                                  case 1015:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1015;
                                                    size_t v20 = "eanEarlyBootUeccPage";
                                                    goto LABEL_22;
                                                  case 1016:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "eanEarlyBootNumUeccPages";
                                                    goto LABEL_14;
                                                  case 1017:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "eanEarlyBootUeccMultiplane";
                                                    goto LABEL_14;
                                                  default:
                                                    goto LABEL_696;
                                                }
                                            }
                                          }

                                          if (v7 <= 1137)
                                          {
                                            if (v7 > 1104)
                                            {
                                              if (v7 > 1115)
                                              {
                                                if (v7 == 1116)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1116;
                                                  size_t v20 = "gcwamp";
LABEL_155:
                                                  int v14 = v8;
                                                  unsigned int v15 = 32;
                                                  goto LABEL_12;
                                                }

                                                if (v7 == 1137)
                                                {
                                                  uint64_t v18 = *v8;
                                                  unsigned int v16 = (void *)a1;
                                                  v19 = "numOfToUnhappySwitches";
                                                  goto LABEL_14;
                                                }
                                              }

                                              else
                                              {
                                                if (v7 == 1105)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1105;
                                                  size_t v20 = "hostReadSequential";
                                                  goto LABEL_703;
                                                }

                                                if (v7 == 1106)
                                                {
                                                  uint64_t v21 = a1;
                                                  int v22 = 1106;
                                                  size_t v20 = "GCReadSequential";
LABEL_703:
                                                  int v14 = v8;
                                                  unsigned int v15 = 14;
                                                  goto LABEL_12;
                                                }
                                              }
                                            }

                                            else
                                            {
                                              if (v7 <= 1041)
                                              {
                                                uint64_t v21 = a1;
                                                if (v7 == 1040)
                                                {
                                                  int v22 = 1040;
                                                  size_t v20 = "bandsAgeBinsV2";
                                                }

                                                else
                                                {
                                                  int v22 = 1041;
                                                  size_t v20 = "bandsAgeBinsSnapshot";
                                                }

                                                int v14 = v8;
                                                unsigned int v15 = 31;
                                                goto LABEL_12;
                                              }

                                              if (v7 == 1042)
                                              {
                                                uint64_t v21 = a1;
                                                int v22 = 1042;
                                                size_t v20 = "bandsAgeBinsReadSectors";
                                                int v14 = v8;
                                                unsigned int v15 = 15;
LABEL_12:
                                                sub_10000773C(v21, v22, v20, v14, v15);
                                                goto LABEL_15;
                                              }

                                              if (v7 == 1080)
                                              {
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "raidForceClogLoad";
                                                goto LABEL_14;
                                              }
                                            }

LABEL_696:
                                            switch(v7)
                                            {
                                              case 1196:
                                                uint64_t v21 = a1;
                                                int v22 = 1196;
                                                size_t v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              case 1197:
                                                uint64_t v21 = a1;
                                                int v22 = 1197;
                                                size_t v20 = "poDetectGBBedAge";
                                                goto LABEL_11;
                                              case 1198:
                                                uint64_t v21 = a1;
                                                int v22 = 1198;
                                                size_t v20 = "poDetectPERemovalMostSevereCost";
                                                goto LABEL_21;
                                              case 1199:
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "poDetectCurrentSize";
                                                goto LABEL_14;
                                              case 1200:
                                              case 1203:
                                              case 1204:
                                              case 1205:
                                              case 1206:
                                              case 1207:
                                              case 1208:
                                              case 1209:
                                              case 1210:
                                              case 1212:
                                              case 1213:
                                              case 1214:
                                              case 1219:
                                              case 1220:
                                              case 1221:
                                              case 1222:
                                              case 1223:
                                                break;
                                              case 1201:
                                                uint64_t v21 = a1;
                                                int v22 = 1201;
                                                size_t v20 = "gcVerticalSuccssfulAlignments";
                                                goto LABEL_22;
                                              case 1202:
                                                uint64_t v21 = a1;
                                                int v22 = 1202;
                                                size_t v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                                goto LABEL_22;
                                              case 1211:
                                                uint64_t v21 = a1;
                                                int v22 = 1211;
                                                size_t v20 = "forcedAllocationSmallEraseQ";
                                                goto LABEL_716;
                                              case 1215:
                                                uint64_t v21 = a1;
                                                int v22 = 1215;
                                                size_t v20 = "hostWritesPerThrottleZone";
                                                goto LABEL_19;
                                              case 1216:
                                                uint64_t v21 = a1;
                                                int v22 = 1216;
                                                size_t v20 = "tlcWLPerDipAvgPEC";
                                                goto LABEL_716;
                                              case 1217:
                                                uint64_t v21 = a1;
                                                int v22 = 1217;
                                                size_t v20 = "tlcWLPerDipMaxPEC";
                                                goto LABEL_716;
                                              case 1218:
                                                uint64_t v21 = a1;
                                                int v22 = 1218;
                                                size_t v20 = "tlcWLPerDipMinPEC";
                                                goto LABEL_716;
                                              case 1224:
                                                uint64_t v21 = a1;
                                                int v22 = 1224;
                                                size_t v20 = "apfsValidLbaOvershoot";
                                                int v14 = v8;
                                                unsigned int v15 = 20;
                                                goto LABEL_12;
                                              default:
                                                switch(v7)
                                                {
                                                  case 1232:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "eanFastSize";
                                                    goto LABEL_14;
                                                  case 1233:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "eanNumSlcEvictions";
                                                    goto LABEL_14;
                                                  case 1234:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "eanNumForcedCompress";
                                                    goto LABEL_14;
                                                  case 1235:
                                                  case 1236:
                                                  case 1237:
                                                  case 1238:
                                                  case 1239:
                                                  case 1240:
                                                  case 1242:
                                                  case 1243:
                                                  case 1245:
                                                    goto LABEL_15;
                                                  case 1241:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1241;
                                                    size_t v20 = "s2rTimeHisto";
                                                    goto LABEL_11;
                                                  case 1244:
                                                    uint64_t v18 = *v8;
                                                    unsigned int v16 = (void *)a1;
                                                    v19 = "calendarTimeWentBackward";
                                                    goto LABEL_14;
                                                  case 1246:
                                                    uint64_t v21 = a1;
                                                    int v22 = 1246;
                                                    size_t v20 = "bandsUeccCrossTempHisto";
                                                    goto LABEL_23;
                                                  default:
                                                    if (v7 != 1190) {
                                                      goto LABEL_15;
                                                    }
                                                    uint64_t v21 = a1;
                                                    int v22 = 1190;
                                                    size_t v20 = "powerDownTime";
                                                    break;
                                                }

                                                goto LABEL_153;
                                            }
                                          }

                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1147:
                                                uint64_t v21 = a1;
                                                int v22 = 1147;
                                                size_t v20 = "gc_concurrent_dw_gc12";
                                                goto LABEL_716;
                                              case 1148:
                                                uint64_t v21 = a1;
                                                int v22 = 1148;
                                                size_t v20 = "gc_concurrent_dw_gc1";
                                                goto LABEL_716;
                                              case 1149:
                                                uint64_t v21 = a1;
                                                int v22 = 1149;
                                                size_t v20 = "gc_concurrent_dw_gc2";
LABEL_716:
                                                int v14 = v8;
                                                unsigned int v15 = 24;
                                                goto LABEL_12;
                                              case 1150:
                                              case 1151:
                                              case 1152:
                                              case 1153:
                                              case 1154:
                                              case 1155:
                                              case 1156:
                                              case 1159:
                                              case 1160:
                                              case 1161:
                                              case 1162:
                                              case 1163:
                                              case 1164:
                                              case 1165:
                                              case 1166:
                                              case 1167:
                                              case 1170:
                                              case 1173:
                                              case 1174:
                                              case 1175:
                                              case 1176:
                                              case 1177:
                                              case 1178:
                                                goto LABEL_696;
                                              case 1157:
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "eanMaxForceROTimeMs";
                                                break;
                                              case 1158:
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "eanMaxForceRORecoTimeMs";
                                                break;
                                              case 1168:
                                                uint64_t v21 = a1;
                                                int v22 = 1168;
                                                size_t v20 = "poDetectPERemovalTotalCost";
                                                goto LABEL_20;
                                              case 1169:
                                                uint64_t v21 = a1;
                                                int v22 = 1169;
                                                size_t v20 = "poDetectEmptySpotRemovalTotalCost";
                                                goto LABEL_20;
                                              case 1171:
                                                uint64_t v21 = a1;
                                                int v22 = 1171;
                                                size_t v20 = "poDetectEmptySpotRemovalAge";
                                                goto LABEL_11;
                                              case 1172:
                                                uint64_t v21 = a1;
                                                int v22 = 1172;
                                                size_t v20 = "poDetectGBBedMostSevereCost";
                                                goto LABEL_21;
                                              case 1179:
                                                uint64_t v21 = a1;
                                                int v22 = 1179;
                                                size_t v20 = "gc_cur_dw_gc1";
                                                goto LABEL_22;
                                              case 1180:
                                                uint64_t v21 = a1;
                                                int v22 = 1180;
                                                size_t v20 = "gc_cur_dw_gc2";
                                                goto LABEL_22;
                                              case 1181:
                                                uint64_t v21 = a1;
                                                int v22 = 1181;
                                                size_t v20 = "gc_cur_dw_gc3";
                                                goto LABEL_22;
                                              case 1182:
                                                uint64_t v21 = a1;
                                                int v22 = 1182;
                                                size_t v20 = "gc_tot_dw_gc1";
                                                goto LABEL_22;
                                              case 1183:
                                                uint64_t v21 = a1;
                                                int v22 = 1183;
                                                size_t v20 = "gc_tot_dw_gc2";
                                                goto LABEL_22;
                                              case 1184:
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "unhappy_state";
                                                break;
                                              case 1185:
                                                uint64_t v18 = *v8;
                                                unsigned int v16 = (void *)a1;
                                                v19 = "unhappy_level";
                                                break;
                                              default:
                                                if (v7 == 1138)
                                                {
                                                  uint64_t v18 = *v8;
                                                  unsigned int v16 = (void *)a1;
                                                  v19 = "numOfToHappySwitches";
                                                }

                                                else
                                                {
                                                  if (v7 != 1189) {
                                                    goto LABEL_696;
                                                  }
                                                  uint64_t v18 = *v8;
                                                  unsigned int v16 = (void *)a1;
                                                  v19 = "lastLbaFormatTime";
                                                }

                                                break;
                                            }

LABEL_15:
                                          a2 = &v8[v10];
                                          unsigned int v6 = v11 - v10;
                                          if (v11 != (_DWORD)v10) {
                                            continue;
                                          }
                                          uint64_t result = 1LL;
                                          break;
                                      }

                                      break;
                                  }

                                  break;
                              }

                              break;
                          }

                          break;
                      }

                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = 0;
    }

    return result;
  }

                                        SetAPIErrorMessage(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                        goto LABEL_16;
                                      }

                                      if (v12 <= 1104)
                                      {
                                        if (v12 <= 1041)
                                        {
                                          if (v12 == 1040)
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              size_t v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "bandsAgeBinsV2_",  (uint64_t)v8,  8u,  v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          else
                                          {
                                            if ((_DWORD)v14 != 31) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              size_t v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "bandsAgeBinsSnapshot_",  (uint64_t)v8,  8u,  v20) & 1) == 0)
                                            {
                                              int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 el"
                                                    "ements to context";
                                              goto LABEL_2247;
                                            }
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1042)
                                        {
                                          if ((_DWORD)v14 != 15) {
                                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            size_t v20 = v14;
                                          }
                                          if ((AddMultipleFieldsToGenericContext( a1,  "bandsAgeBinsReadSectors_",  (uint64_t)v8,  8u,  v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1080)
                                        {
                                          if ((AddMultipleFieldsToGenericContext( a1,  "raidForceClogLoad",  (uint64_t)v8,  8u,  1u) & 1) == 0)
                                          {
                                            v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
                                            goto LABEL_15;
                                          }
}

uint64_t sub_10000773C(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  int v7 = (void *)result;
  uint64_t v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(void *)(result + 72) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(void *)(result + 64) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 12:
        *(void *)(result + 144) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 13:
        *(void *)(result + 152) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 17:
        *(void *)(result + 88) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 18:
        *(void *)(result + 104) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 19:
        *(void *)(result + 96) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      case 20:
        *(void *)(result + 112) = v8;
        if (a5) {
          goto LABEL_42;
        }
        return result;
      default:
        if (a2 != 28) {
          goto LABEL_41;
        }
        *(void *)(result + 168) = v8;
        if (!a5) {
          return result;
        }
        goto LABEL_42;
    }
  }

  switch(a2)
  {
    case '-':
      *(void *)(result + 176) = v8;
      if (a5) {
        goto LABEL_42;
      }
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(void *)(result + 80) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 48) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(void *)(result + 160) = v8;
      if (!a5) {
        return result;
      }
      goto LABEL_42;
    default:
      if (a2 != 265) {
        goto LABEL_41;
      }
      if (a5)
      {
        uint64_t v9 = a5;
        unint64_t v10 = (void *)(result + 184);
        unsigned int v11 = a4;
        do
        {
          uint64_t v12 = *v11++;
          *v10++ = v12;
          --v9;
        }

        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_1000193CC((void *)result, (const char *)&unk_10004223B, a3, v8);
          }

          else
          {
            uint64_t v13 = 0LL;
            uint64_t v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              uint64_t result = sub_1000193CC(v7, a3, __str, a4[v13++]);
            }

            while (v14 != v13);
          }
        }
      }

      return result;
  }

double ASPReleaseContext(uint64_t a1)
{
  v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      v3 = (void *)v2[14];
      free(v2);
      v2 = v3;
    }

    while (v3);
  }

  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    do
    {
      v5 = (void *)v4[14];
      free(v4);
      v4 = v5;
    }

    while (v5);
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t ASPFTLParseBufferToCxt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (unint64_t *)a2;
  uint64_t v10 = 0LL;
  unsigned int v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v25 = 0u;
  do
  {
LABEL_2:
    if (!v11) {
      return v10;
    }
    unint64_t v13 = *v8++;
    int v12 = v13;
    unint64_t v14 = HIDWORD(v13);
    --v11;
  }

  while (!HIDWORD(v13));
  uint64_t v17 = (v12 - 1);
  if (v17 <= 0x47) {
    __asm { BR              X9 }
  }

  uint64_t v18 = (v12 - 73);
  if (v18 <= 0x46) {
    __asm { BR              X9 }
  }

  switch(v12)
  {
    case 144:
      v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16) {
        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2247;
    case 208:
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8) {
        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2247;
    case 214:
      v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10) {
        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
      }
      else {
        unsigned int v20 = v14;
      }
      int v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2247;
    case 219:
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2247;
        case 228:
          if ((_DWORD)v14 != 4) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 229:
          if ((_DWORD)v14 != 2) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 230:
          if ((_DWORD)v14 != 2) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2247;
        case 231:
          v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 236:
          if ((_DWORD)v14 != 8) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 237:
          if ((_DWORD)v14 != 4) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 238:
          v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2247;
        case 266:
          if ((_DWORD)v14 != 16) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2247;
        case 267:
          v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 269:
          if ((_DWORD)v14 != 8) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 270:
          if ((_DWORD)v14 != 8) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2247;
        case 271:
          v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2247;
        case 279:
          v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2247;
        case 281:
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 290:
          if ((_DWORD)v14 != 32) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 291:
          if ((_DWORD)v14 != 32) {
            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
          }
          else {
            unsigned int v20 = v14;
          }
          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2247;
        case 292:
          v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 299:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 300:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 301:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 302:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 303:
              if ((_DWORD)v14 != 2) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2247;
            case 304:
              if ((_DWORD)v14 != 10) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 305:
              if ((_DWORD)v14 != 10) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 306:
              if ((_DWORD)v14 != 4) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 307:
              if ((_DWORD)v14 != 10) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 308:
              v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 315:
              if ((_DWORD)v14 != 8) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2247;
            case 316:
              if ((_DWORD)v14 != 4) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2247;
            case 317:
              v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 325:
              if ((_DWORD)v14 != 5) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 326:
              if ((_DWORD)v14 != 5) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2247;
            case 327:
              if ((_DWORD)v14 != 30) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 328:
              if ((_DWORD)v14 != 30) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 329:
              if ((_DWORD)v14 != 30) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2247;
            case 330:
              if ((_DWORD)v14 != 22) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2247;
            case 331:
              if ((_DWORD)v14 != 45) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2247;
            case 332:
              if ((_DWORD)v14 != 10) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 333:
              if ((_DWORD)v14 != 10) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2247;
            case 334:
              v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 361:
              if ((_DWORD)v14 != 16) {
                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
              }
              else {
                unsigned int v20 = v14;
              }
              int v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2247;
            case 362:
              v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  if ((AddMultipleFieldsToGenericContext( a1,  "eraseSuspendSituationsBelowThreshold",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  if ((AddMultipleFieldsToGenericContext( a1,  "eraseSuspendSituationsAboveThreshold",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  if ((AddMultipleFieldsToGenericContext( a1,  "AbortSkip_MBPXFailedRebuildingParity",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulPMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulPMXReconstructionHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidFailedPMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulRMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulRMXReconstructionHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  if ((AddMultipleFieldsToGenericContext( a1,  "raidFailedRMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                    goto LABEL_16;
                  }
                  v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5) {
                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 407:
                  if ((_DWORD)v14 != 5) {
                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                  }
                  else {
                    unsigned int v20 = v14;
                  }
                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2247;
                case 408:
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      if ((AddMultipleFieldsToGenericContext( a1,  "numOfThrottlingEntriesPerReadLevel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                        goto LABEL_14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 454:
                      if ((_DWORD)v14 != 16) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      if ((AddMultipleFieldsToGenericContext( a1,  "numOfThrottlingEntriesPerWriteLevel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                        goto LABEL_14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 456:
                      if ((_DWORD)v14 != 10) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 457:
                      v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2247;
                    case 461:
                      v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      if ((AddMultipleFieldsToGenericContext( a1,  "balanceProportionBucketsHistogram_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                        goto LABEL_14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2247;
                    case 464:
                      v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2247;
                    case 466:
                      if ((_DWORD)v14 != 64) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 467:
                      if ((_DWORD)v14 != 4) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2247;
                    case 468:
                      if ((_DWORD)v14 != 16) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2247;
                    case 469:
                      if ((_DWORD)v14 != 2) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructSuccessPartition_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                        goto LABEL_14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 470:
                      if ((_DWORD)v14 != 2) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 471:
                      v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBandFlowHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                        goto LABEL_16;
                      }
                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 477:
                      if ((_DWORD)v14 != 2) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 481:
                      if ((_DWORD)v14 != 32) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2247;
                    case 483:
                      v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      if ((AddMultipleFieldsToGenericContext( a1,  "non_proportional_directToTLCSectors",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                        goto LABEL_16;
                      }
                      v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2247;
                    case 490:
                      if ((_DWORD)v14 != 64) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2247;
                    case 491:
                      v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      if ((AddMultipleFieldsToGenericContext( a1,  "autowriteWaitTransferTaskBlocks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                        goto LABEL_16;
                      }
                      v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2) {
                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                      }
                      else {
                        unsigned int v20 = v14;
                      }
                      int v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2247;
                    case 504:
                      v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailMismatch",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                            goto LABEL_16;
                          }
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 516:
                          if ((_DWORD)v14 != 32) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2247;
                        case 517:
                          v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          if ((AddMultipleFieldsToGenericContext( a1,  "slcDemandBurstSizeDetected_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                            goto LABEL_14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 547:
                          if ((_DWORD)v14 != 10) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 548:
                          v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2247;
                        case 551:
                          if ((_DWORD)v14 != 11) {
                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                          }
                          else {
                            unsigned int v20 = v14;
                          }
                          if ((AddMultipleFieldsToGenericContext( a1,  "balanceProportionBucketsHistogramTlc_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                            goto LABEL_14;
                          }
                          int v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2247;
                        case 553:
                          v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          if ((AddMultipleFieldsToGenericContext( a1,  "raidExpectedFailRMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                            goto LABEL_16;
                          }
                          v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          if ((AddMultipleFieldsToGenericContext( a1,  "raidExpectedFailRMXReconstructionHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                            goto LABEL_16;
                          }
                          v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              if ((AddMultipleFieldsToGenericContext( a1,  "oslcLowCleanBandsUOnOff",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              if ((AddMultipleFieldsToGenericContext( a1,  "unexpectedBlanksInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksInternal(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              if ((AddMultipleFieldsToGenericContext( a1,  "chipIdTemperatureSample",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 606:
                              v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              if ((AddMultipleFieldsToGenericContext( a1,  "eanMinToFirstReadTimeMs",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2247;
                            case 611:
                              v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              if ((AddMultipleFieldsToGenericContext( a1,  "slcDemandBurstWritesInGC",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              if ((AddMultipleFieldsToGenericContext( a1,  "slcDemandBurstWritesInTT",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              if ((AddMultipleFieldsToGenericContext( a1,  "slcDemandBurstWritesInNRP",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              if ((AddMultipleFieldsToGenericContext( a1,  "eanAvgToFirstReadTimeMs",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 622:
                              v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2247;
                            case 625:
                              v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulRecoEAN_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                goto LABEL_14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 631:
                              if ((_DWORD)v14 != 6) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 632:
                              if ((_DWORD)v14 != 6) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2247;
                            case 635:
                              v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2247;
                            case 639:
                              if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructSuccessBandFlowOslc",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBandFlowOslc",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              if ((AddMultipleFieldsToGenericContext( a1,  "AbortSkip_MPBXProbational",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                goto LABEL_16;
                              }
                              v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8) {
                                SetAPIErrorMessage( "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                              }
                              else {
                                unsigned int v20 = v14;
                              }
                              int v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2247;
                            case 675:
                              v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "magazineFWVersion_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 681:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailPMXUnsup",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBMXUnsup",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "pcieClkreqHighTimeout",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2247;
                                case 688:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrRefreshGrades_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 695:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidHostClassifications",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidInternalClassifications",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 703:
                                  if ((_DWORD)v14 != 12) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2247;
                                case 704:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "logical_disk_occupied_promiles",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidPrevFailedReconstructSkip",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidSuccessfulHostAuxReads",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidSuccessfulInternalAuxReads",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassificationReliabilityHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassificationReliabilityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassificationQualityHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassificationQualityInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "gcPDusterDestinations",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidFailedHostAuxReads",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidFailedInternalAuxReads",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructDurationHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 745:
                                  if ((_DWORD)v14 != 8) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "failsOnReconstructHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 746:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_userFlattenExcessive",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_IntFlattenExcessive",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_userFlattenBalance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_intFlattenBalance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_formatVertExcessive",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_formatVertBalance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrNumSlowRefreshes",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrNumFastRefreshes",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrTotalRefreshValidity",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrRefreshedAges_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 758:
                                  v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 760:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulBMXReconstructionHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidFailedBMXReconstructionInternal",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidFailedBMXReconstructionHost",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 767:
                                  if ((_DWORD)v14 != 10) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrRefreshGradesSLC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGradesSLC(767): Cannot add 10 elements to context";
                                  goto LABEL_2247;
                                case 768:
                                  if ((_DWORD)v14 != 9) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  if ((AddMultipleFieldsToGenericContext( a1,  "cbdrRefreshedAgesSLC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                    goto LABEL_14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2247;
                                case 769:
                                  if ((_DWORD)v14 != 5) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cbdrScanPctSLC(769): Cannot add 5 elements to context";
                                  goto LABEL_2247;
                                case 770:
                                  if ((_DWORD)v14 != 8) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2247;
                                case 771:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "autoSkipRaidRecoFail",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 773:
                                  if ((_DWORD)v14 != 32) {
                                    SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                  }
                                  else {
                                    unsigned int v20 = v14;
                                  }
                                  int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2247;
                                case 774:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBMXAbort",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_fatBindingNoBlocks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  if ((AddMultipleFieldsToGenericContext( a1,  "bandKill_fatBindingFewBlocks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                    goto LABEL_16;
                                  }
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 777:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "numBadBootBlocks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 778:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "snapshotCPUHigh",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 779:
                                      v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "gcSearchTimeHistory_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 785:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "gcSearchPortion_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 786:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBmxMp",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBmx",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBMXUECC",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidReconstructFailBMXBlank",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidPrevFailedReconstructBmxMpSkip",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 799:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailUECC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 804:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailNoSPBX_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 806:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailBlank_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 809:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailUnsup_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 811:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailMpSkip_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 812:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailAbort_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 813:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "TurboRaidIsEnabled",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXFailOther_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 815:
                                      if ((_DWORD)v14 != 4) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidBMXSuccess_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2247;
                                    case 816:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "skinnyBandsExtraDip",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "ricMaxClogOnlyPages",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "readClassifyStatusesHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2247;
                                    case 824:
                                      if ((_DWORD)v14 != 10) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "readWithAuxStatusesHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2247;
                                    case 825:
                                      if ((_DWORD)v14 != 10) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "readReconstructStatusesHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 826:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "bdrBackupChecks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "ricExceedClogOnlyPagesTH",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 831:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "prefetchNextRange",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: prefetchNextRange(831) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidSuccessfulSkip",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "raidSkipAttempts",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "timeOfThrottlingPerLevel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 866:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "timeOfThrottlingPerReadLevel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 867:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "timeOfThrottlingPerWriteLevel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 868:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsSlc_1bc_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 869:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsTlc_1bc_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 870:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsSlc_1bc_he_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 871:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsTlc_1bc_he_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 876:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsSlc_mbc_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 877:
                                      if ((_DWORD)v14 != 32) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "dmReasonsTlc_mbc_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2247;
                                    case 883:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "clogEmptyProgramms",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "oslcHwCloseBand",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidSuccessAuxPartition_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 892:
                                      if ((_DWORD)v14 != 2) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidFailAuxPartition_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2247;
                                    case 893:
                                      if ((_DWORD)v14 != 2) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassifyQualPartition_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2247;
                                    case 894:
                                      if ((_DWORD)v14 != 2) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidClassifyRelPartition_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2247;
                                    case 895:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "IND_pool_freeMinSilo",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "autoSweepBlocks",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "wcWrFragSizes_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 898:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "indStateAcrossGcDidNoL_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 899:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "indStateAcrossGcDidL_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 900:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidNoClassifyDueToWasRetire",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidNoClassifyDueToOpenBand",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidNoClassifyDueToQualityBlock",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidGbbOpenBand",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidGbbShouldRetireOnRefresh",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                        goto LABEL_16;
                                      }
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidRelPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2247;
                                    case 906:
                                      if ((_DWORD)v14 != 16) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg e lements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                        goto LABEL_14;
                                      }
                                      int v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2247;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 907:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMaxRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 908:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (# 16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMinRelBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): "
                                                  "Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 909:
                                          case 910:
                                          case 911:
                                          case 912:
                                          case 913:
                                          case 914:
                                          case 915:
                                          case 916:
                                          case 917:
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2110;
                                          case 918:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMaxCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 919:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMinCyclesBetweenRel_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 920:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidAuxPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2247;
                                          case 921:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidAuxBetweenRefreshesPerBlock_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2247;
                                          case 922:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidRelLockMark",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidAuxLockMark",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 930:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMaxCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 931:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidMinCyclesBetweenAux_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2247;
                                          case 932:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidLastRelPECycles_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 933:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidRelQualPECycles_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 934:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidLastAuxPECycles_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 935:
                                            if ((_DWORD)v14 != 16) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidAuxQualPECycles_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2247;
                                          case 937:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidPEFailAfterRel",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "turboRaidPEFailAfterAux",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "dvfmVotesCPU",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "dvfmVotesBandwidth",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "maxSLCEndurance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "maxMixedEndurance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "maxNativeEndurance",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "assertHistory_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2247;
                                          case 951:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "asp3Support",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "numCrossTempRaidUecc",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "osBuildStr",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "raidConfig",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "indTrimFrags_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          case 971:
                                            if ((_DWORD)v14 != 12) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "indUsedFrags_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogFindFail",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogFindBlank",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogFindUnc",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogFindUnexpected",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8) {
                                                  SetAPIErrorMessage( "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogReplayFailReason_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1002:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogReplayTransientError",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "clogReplaySpfError",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4) {
                                                  SetAPIErrorMessage( "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg element s != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanEarlyBootUeccPage_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2247;
                                              case 1016:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanEarlyBootNumUeccPages",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanEarlyBootUeccMultiplane",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2110;
                                            }
                                        }
                                      }

                                      if (v12 > 1137)
                                      {
                                        switch(v12)
                                        {
                                          case 1147:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_concurrent_dw_gc12_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1148:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_concurrent_dw_gc1_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1149:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements ! = (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_concurrent_dw_gc2_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1150:
                                          case 1151:
                                          case 1152:
                                          case 1153:
                                          case 1154:
                                          case 1155:
                                          case 1156:
                                          case 1159:
                                          case 1160:
                                          case 1161:
                                          case 1162:
                                          case 1163:
                                          case 1164:
                                          case 1165:
                                          case 1166:
                                          case 1167:
                                          case 1170:
                                          case 1173:
                                          case 1174:
                                          case 1175:
                                          case 1176:
                                          case 1177:
                                          case 1178:
                                            goto LABEL_2110;
                                          case 1157:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "eanMaxForceROTimeMs",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                            break;
                                          case 1158:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "eanMaxForceRORecoTimeMs",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                            break;
                                          case 1168:
                                            if ((_DWORD)v14 != 2) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg eleme nts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectPERemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2"
                                                  " elements to context";
                                            goto LABEL_2247;
                                          case 1169:
                                            if ((_DWORD)v14 != 2) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cf g elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectEmptySpotRemovalTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Canno"
                                                  "t add 2 elements to context";
                                            goto LABEL_2247;
                                          case 1171:
                                            if ((_DWORD)v14 != 10) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectEmptySpotRemovalAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add "
                                                  "10 elements to context";
                                            goto LABEL_2247;
                                          case 1172:
                                            if ((_DWORD)v14 != 3) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectGBBedMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add "
                                                  "3 elements to context";
                                            goto LABEL_2247;
                                          case 1179:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_cur_dw_gc1_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1180:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_cur_dw_gc2_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1181:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_cur_dw_gc3_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1182:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_tot_dw_gc1_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1183:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gc_tot_dw_gc2_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1184:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "unhappy_state",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                            break;
                                          case 1185:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "unhappy_level",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                            break;
                                          default:
                                            if (v12 != 1138)
                                            {
                                              if (v12 != 1189) {
                                                goto LABEL_2110;
                                              }
                                              if ((AddMultipleFieldsToGenericContext( a1,  "lastLbaFormatTime",  (uint64_t)v8,  8u,  1u) & 1) == 0)
                                              {
                                                v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                                break;
                                              }

                                              goto LABEL_16;
                                            }

                                            if ((AddMultipleFieldsToGenericContext( a1,  "numOfToHappySwitches",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 element to context";
                                            break;
                                        }

LABEL_16:
                                          uint64_t v10 = (v10 + 1);
                                          goto LABEL_17;
                                        }

                                        goto LABEL_2110;
                                      }

                                      if (v12 > 1115)
                                      {
                                        if (v12 == 1116)
                                        {
                                          if ((_DWORD)v14 != 32) {
                                            SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                          }
                                          else {
                                            unsigned int v20 = v14;
                                          }
                                          if ((AddMultipleFieldsToGenericContext(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                          {
                                            int v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                            goto LABEL_2247;
                                          }

                                          goto LABEL_14;
                                        }

                                        if (v12 == 1137)
                                        {
                                          if ((AddMultipleFieldsToGenericContext( a1,  "numOfToUnhappySwitches",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                            goto LABEL_16;
                                          }
                                          v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 element to context";
                                          goto LABEL_15;
                                        }

LABEL_2110:
                                        switch(v12)
                                        {
                                          case 1196:
                                            if ((_DWORD)v14 != 5) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectGBBedTotalCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          case 1197:
                                            if ((_DWORD)v14 != 10) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectGBBedAge_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                            goto LABEL_2247;
                                          case 1198:
                                            if ((_DWORD)v14 != 3) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectPERemovalMostSevereCost_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Cannot "
                                                  "add 3 elements to context";
                                            goto LABEL_2247;
                                          case 1199:
                                            if ((AddMultipleFieldsToGenericContext( a1,  "poDetectCurrentSize",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                              goto LABEL_16;
                                            }
                                            v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1200:
                                          case 1203:
                                          case 1204:
                                          case 1205:
                                          case 1206:
                                          case 1207:
                                          case 1208:
                                          case 1209:
                                          case 1210:
                                          case 1212:
                                          case 1213:
                                          case 1214:
                                          case 1219:
                                          case 1220:
                                          case 1221:
                                          case 1222:
                                          case 1223:
LABEL_2242:
                                            else {
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            }
                                            if ((AddMultipleFieldsToGenericContext(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v12);
                                              return v10;
                                            }

                                            uint64_t v10 = (v10 + v14);
                                            break;
                                          case 1201:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg el ements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gcVerticalSuccssfulAlignments_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot ad"
                                                  "d 4 elements to context";
                                            goto LABEL_2247;
                                          case 1202:
                                            if ((_DWORD)v14 != 4) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "gcVerticalNoAlignmentDueToMissingSegs_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): C"
                                                  "annot add 4 elements to context";
                                            goto LABEL_2247;
                                          case 1211:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg ele ments != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "forcedAllocationSmallEraseQ_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Cannot add "
                                                  "24 elements to context";
                                            goto LABEL_2247;
                                          case 1215:
                                            if ((_DWORD)v14 != 5) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): (#5) cfg elemen ts != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "hostWritesPerThrottleZone_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: hostWritesPerThrottleZone(1215): Cannot add 5 "
                                                  "elements to context";
                                            goto LABEL_2247;
                                          case 1216:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "tlcWLPerDipAvgPEC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1217:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "tlcWLPerDipMaxPEC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1218:
                                            if ((_DWORD)v14 != 24) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "tlcWLPerDipMinPEC_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 elements to context";
                                            goto LABEL_2247;
                                          case 1224:
                                            if ((_DWORD)v14 != 20) {
                                              SetAPIErrorMessage( "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                            }
                                            else {
                                              unsigned int v20 = v14;
                                            }
                                            if ((AddMultipleFieldsToGenericContext( a1,  "apfsValidLbaOvershoot_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                              goto LABEL_14;
                                            }
                                            int v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add 20 ele"
                                                  "ments to context";
                                            goto LABEL_2247;
                                          default:
                                            switch(v12)
                                            {
                                              case 1232:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanFastSize",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1233:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanNumSlcEvictions",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1234:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "eanNumForcedCompress",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              case 1235:
                                              case 1236:
                                              case 1237:
                                              case 1238:
                                              case 1239:
                                              case 1240:
                                              case 1242:
                                              case 1243:
                                              case 1245:
                                                goto LABEL_2242;
                                              case 1241:
                                                if ((_DWORD)v14 != 10) {
                                                  SetAPIErrorMessage( "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (% d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext( a1,  "s2rTimeHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                                goto LABEL_2247;
                                              case 1244:
                                                if ((AddMultipleFieldsToGenericContext( a1,  "calendarTimeWentBackward",  (uint64_t)v8,  8u,  1u) & 1) != 0) {
                                                  goto LABEL_16;
                                                }
                                                v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1246:
                                                if ((_DWORD)v14 != 8) {
                                                  SetAPIErrorMessage( "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elem ents != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext( a1,  "bandsUeccCrossTempHisto_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add "
                                                      "8 elements to context";
                                                goto LABEL_2247;
                                              default:
                                                if (v12 != 1190) {
                                                  goto LABEL_2242;
                                                }
                                                if ((_DWORD)v14 != 12) {
                                                  SetAPIErrorMessage( "ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements !=(%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                                }
                                                else {
                                                  unsigned int v20 = v14;
                                                }
                                                if ((AddMultipleFieldsToGenericContext( a1,  "powerDownTime_",  (uint64_t)v8,  8u,  v20) & 1) != 0) {
                                                  goto LABEL_14;
                                                }
                                                int v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                                break;
                                            }

                                            goto LABEL_2247;
                                        }

LABEL_17:
                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }

                                      if (v12 == 1105)
                                      {
                                        if ((_DWORD)v14 != 14) {
                                          SetAPIErrorMessage( "ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                        }
                                        else {
                                          unsigned int v20 = v14;
                                        }
                                        if ((AddMultipleFieldsToGenericContext( a1,  "hostReadSequential_",  (uint64_t)v8,  8u,  v20) & 1) == 0)
                                        {
                                          int v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                          goto LABEL_2247;
                                        }

                                        goto LABEL_14;
                                      }

                                      if (v12 != 1106) {
                                        goto LABEL_2110;
                                      }
                                      if ((_DWORD)v14 != 14) {
                                        SetAPIErrorMessage( "ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  v14);
                                      }
                                      else {
                                        unsigned int v20 = v14;
                                      }
                                      if ((AddMultipleFieldsToGenericContext( a1,  "GCReadSequential_",  (uint64_t)v8,  8u,  v20) & 1) != 0)
                                      {
LABEL_14:
                                        uint64_t v10 = v20 + v10;
                                        goto LABEL_17;
                                      }

                                      int v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
LABEL_2247:
                                      SetAPIErrorMessage(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                      return v10;
                                  }
                              }
                          }
                      }
                  }
              }
          }
      }
  }

uint64_t AddMultipleFieldsToGenericContext( uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v14 = 0LL;
  uint64_t v5 = 1LL;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8LL);
        return AddSingleValueToGenericContext(a1, (const char *)&unk_10004223B, a2, v14);
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        uint64_t v14 = 0LL;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8LL);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          uint64_t v5 = AddSingleValueToGenericContext(a1, a2, __str, v14) & v5;
        }

        else
        {
          uint64_t v5 = 0LL;
        }

        int v11 = (unsigned __int16)++v12;
      }

      while ((unsigned __int16)v12 < a5);
    }
  }

  return v5;
}

uint64_t ASPFTLParseStatKeyBufferToCxt(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5 = 0LL;
  unsigned int v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  __int128 v22 = 0u;
LABEL_2:
  int v7 = -v6;
  while (v7)
  {
    unint64_t v9 = *a2++;
    unsigned int v8 = v9;
    unint64_t v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        else {
          snprintf(__str, 0x20uLL, "Stat_%d_");
        }
        if ((AddMultipleFieldsToGenericContext(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          uint64_t v5 = (v5 + v10);
          a2 += v10;
          unsigned int v6 = -v7 - v10;
          goto LABEL_2;
        }

        SetAPIErrorMessage( "ASPFTLParseBufferToCxt %d: Cannot add %d elements to context",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v8);
      }

      return v5;
    }
  }

  return v5;
}

uint64_t ASPMSPParseBufferToCxt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2) {
    goto LABEL_1981;
  }
  unsigned int v10 = a3;
  if (!(_DWORD)a3) {
    goto LABEL_1981;
  }
  uint64_t v11 = a2;
  uint64_t v8 = 0LL;
  uint64_t v13 = &jpt_100016BB8;
  uint64_t v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10) {
        return v8;
      }
      uint64_t v15 = (unsigned __int16 *)v11;
      uint64_t v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4LL;
      v10 -= 4;
    }

    while (!(_DWORD)v16);
    int v17 = *v15;
    if (v17 != 12286) {
      break;
    }
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }

  switch(v17)
  {
    case 4096:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 16) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
      }
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (AddMultipleFieldsToGenericContext( a1,  "slipTrackingAfterFs1ForceFailChangedVthInTicksHist",  v11,  4u,  v21)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 40) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 44) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 20) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 12) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
      }
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (AddMultipleFieldsToGenericContext( a1,  "readAlgoPassedThroughSyndSumAcquisition_DSP",  v11,  4u,  v21)) {
        goto LABEL_460;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      uint64_t v19 = v14;
      unsigned int v20 = v13;
      if ((_DWORD)v16 != 4) {
        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
      }
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      else {
        unsigned int v21 = v16 >> 2;
      }
      if (AddMultipleFieldsToGenericContext(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        uint64_t v8 = v8 + v21;
        uint64_t v13 = v20;
        uint64_t v14 = v19;
        goto LABEL_461;
      }

      unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      SetAPIErrorMessage(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 256) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 16) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 80) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 4) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          uint64_t v19 = v14;
          unsigned int v20 = v13;
          if ((_DWORD)v16 != 40) {
            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          }
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          else {
            unsigned int v21 = v16 >> 2;
          }
          unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8) {
                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
              }
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              else {
                unsigned int v22 = v16 >> 3;
              }
              unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4) {
                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                  }
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  else {
                    unsigned int v22 = v16 >> 2;
                  }
                  unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4) {
                        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                      }
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      if (AddMultipleFieldsToGenericContext( a1,  "syndSumAcqConvergedToStaticWalls",  v11,  4u,  v22)) {
                        goto LABEL_1372;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60) {
                        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80) {
                        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60) {
                        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80) {
                        SetAPIErrorMessage( "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      }
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      else {
                        unsigned int v22 = v16 >> 2;
                      }
                      unint64_t v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "lower_die_temperature",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "higher_die_temperature",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_sram_flips",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_reset_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_throttling_events",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "link_speed_recoveries",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "maintenance_backup_to_main",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "maintenance_main_to_backup",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_erase_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                            }
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_program_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_read_verify_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_read_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_convert_to_main",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_block_read_source_changed",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "random_read_hit_ratio_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "rd_retraining_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "wr_retraining_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_dcc_pass_after_retry",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_dcc_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "max_size_open_blocks_list",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "gps_max_num_of_failures",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "gps_num_of_failures_max_overflow",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                            }
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "num_auto_program_cache_terminations",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                            }
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "number_of_read_cache_auto_terminations",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "external_etags_usage_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                            }
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "internal_etags_usage_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "rom_num_hard_resets",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                            }
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "lower_die_temperature",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "higher_die_temperature",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                            }
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "random_read_hit_ratio_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "msp_number_sram_flips",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                            }
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_time_normal_power",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "boot_time_low_power",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                            }
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "active_time_bw_pg_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "active_time_bw_pg_min",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                            }
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "active_time_bw_pg_max",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                            }
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "mdll_relative_offset",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                            }
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                            }
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "spi_image_overall_duration_acc",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                            }
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "spi_image_cw_fetch_duration_acc",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20) {
                              SetAPIErrorMessage( "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                            }
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            else {
                              unsigned int v22 = v16 >> 2;
                            }
                            if (AddMultipleFieldsToGenericContext( a1,  "spi_image_cw_fetch_duration_hist",  v11,  4u,  v22)) {
                              goto LABEL_1372;
                            }
                            unint64_t v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                }
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext( a1,  "fs1_4b_fast_fail_",  v11,  4u,  v22)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext( a1,  "dyce_decoded_bit_flips_",  v11,  4u,  v22)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                }
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                }
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext( a1,  "tr_aux_bfs_percent_",  v11,  4u,  v22)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                }
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext( a1,  "tr_reconstruct_pass_step_",  v11,  4u,  v22)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4) {
                                  SetAPIErrorMessage( "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                }
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                else {
                                  unsigned int v22 = v16 >> 2;
                                }
                                if (AddMultipleFieldsToGenericContext( a1,  "tr_reconstruct_num",  v11,  4u,  v22)) {
                                  goto LABEL_1372;
                                }
                                unint64_t v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }

                            goto LABEL_1981;
                        }

                        goto LABEL_1981;
                      }

                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8) {
                            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!AddMultipleFieldsToGenericContext( a1,  "initialReadStageParameter2",  v11,  8u,  v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8) {
                            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                          }
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!AddMultipleFieldsToGenericContext( a1,  "initialReadStageParameter1",  v11,  8u,  v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8) {
                            SetAPIErrorMessage( "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                          }
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          else {
                            unsigned int v22 = v16 >> 3;
                          }
                          if (!AddMultipleFieldsToGenericContext( a1,  "dspExceptionParameter144",  v11,  8u,  v22))
                          {
                            unint64_t v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }

                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                              }
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "e2e_error_count_tmode",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                              }
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "extended_rd_window_diff_dist",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "rd_retraining_failures_v2",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                              }
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "lower_die_temperature",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "higher_die_temperature",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                              }
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "rd_window_dist_single_die",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "parallel_slip_drops_hist",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                              }
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "sys_halt_max_latency",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                              }
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "sys_halt_max_latency_opcode",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                              }
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "channel_halt_max_latency",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8) {
                                SetAPIErrorMessage( "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                              }
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              else {
                                unsigned int v22 = v16 >> 2;
                              }
                              if (AddMultipleFieldsToGenericContext( a1,  "max_heap_usage_v2",  v11,  4u,  v22)) {
                                goto LABEL_1372;
                              }
                              unint64_t v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "fw_version_identifier",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                  }
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "random_read_size_ratio",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                  }
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "number_gracefull_read_terminations",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "active_time_bw_pg_acc",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                  }
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "num_pg_events",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                  }
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "algo_queue_depth",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                  }
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "parallel_slip_hist",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                  }
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "sys_halt_latency_hist",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                  }
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "channel_halt_latency_hist",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8) {
                                    SetAPIErrorMessage( "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                  }
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  else {
                                    unsigned int v22 = v16 >> 3;
                                  }
                                  if (AddMultipleFieldsToGenericContext( a1,  "num_idle_die_read_cache_terminate",  v11,  8u,  v22)) {
                                    goto LABEL_1372;
                                  }
                                  unint64_t v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }

                              goto LABEL_1981;
                          }

                          goto LABEL_1981;
                      }

LABEL_1372:
                      uint64_t v8 = v8 + v22;
LABEL_1373:
                      uint64_t v13 = &jpt_100016BB8;
                      break;
                  }

                  break;
              }

              break;
          }

          break;
      }

      goto LABEL_461;
  }

uint64_t AddSingleValueToGenericContext(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  if (result)
  {
    int v7 = (void *)result;
    uint64_t v8 = (char *)calloc(1uLL, 0x78uLL);
    unint64_t v9 = calloc(1uLL, 0x78uLL);
    unsigned int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = v7[1];
      if (v11 && (uint64_t v12 = v7[3]) != 0)
      {
        *(void *)(v11 + 112) = v9;
        uint64_t v13 = (char **)(v12 + 112);
      }

      else
      {
        *int v7 = v9;
        uint64_t v13 = (char **)(v7 + 2);
      }

      *uint64_t v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((void *)v8 + 14) = 0LL;
      *((void *)v9 + 14) = 0LL;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((void *)v8 + 13) = a4;
      return 1LL;
    }

    else
    {
      if (v8) {
        free(v8);
      }
      if (v10) {
        free(v10);
      }
      return 0LL;
    }
  }

  return result;
}

double ReleaseGenericParserCxt(uint64_t a1)
{
  if (a1)
  {
    v2 = *(void **)a1;
    if (v2)
    {
      do
      {
        v3 = (void *)v2[14];
        free(v2);
        v2 = v3;
      }

      while (v3);
    }

    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)v4[14];
        free(v4);
        v4 = v5;
      }

      while (v5);
    }

    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

  return result;
}

uint64_t sub_1000193CC(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(0x78uLL);
  unint64_t v9 = malloc(0x78uLL);
  unsigned int v10 = v9;
  uint64_t v11 = a1[1];
  if (v11 && (uint64_t v12 = a1[3]) != 0)
  {
    *(void *)(v11 + 112) = v9;
    uint64_t v13 = (char **)(v12 + 112);
  }

  else
  {
    *a1 = v9;
    uint64_t v13 = (char **)(a1 + 2);
  }

  *uint64_t v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((void *)v8 + 14) = 0LL;
  v9[14] = 0LL;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  uint64_t result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((void *)v8 + 13) = a4;
  return result;
}

void SetAPIErrorMessage( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!GlobalAPIErrorMessage)
  {
    GlobalAPIErrorMessage = (uint64_t)calloc(0x400uLL, 1uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)GlobalAPIErrorMessage, 0x400uLL, "%s", __str);
  }

const char *GetAPIErrorMessage()
{
  if (GlobalAPIErrorMessage) {
    return (const char *)GlobalAPIErrorMessage;
  }
  else {
    return "NA";
  }
}

unint64_t roundSig(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a1;
  if (a1)
  {
    double v4 = log10((double)a1) + 1.0;
    unint64_t v5 = (unint64_t)v4 - a2;
    if ((unint64_t)v4 > a2)
    {
      if (v5 > 0x12)
      {
        return 0LL;
      }

      else
      {
        unint64_t v6 = qword_100043838[v5];
        unint64_t v7 = v2 / v6;
        if (v2 % v6 >= v6 >> 1) {
          ++v7;
        }
        return v7 * v6;
      }
    }
  }

  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "start nand_task_scheduler",  v3,  2u);
  }

  sub_100019634();
  dispatch_main();
}

void sub_100019634()
{
}

void sub_100019654(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state != 2) {
    goto LABEL_41;
  }
  int outputStruct = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "running nand_task_scheduler",  buf,  2u);
  }

  int v4 = 1;
LABEL_5:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "iter# %u - BEGIN",  buf,  8u);
  }

  int v5 = populateTunnelOutputBufferWithoutSizeQuery_withFlags(0LL, 39, 1025, 0, &outputStruct, 4uLL, 0, 0);
  if (v5)
  {
    int v6 = outputStruct;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error: BDR tunnel cmd failed",  buf,  2u);
    }

    int v6 = 0;
    int outputStruct = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    unint64_t v7 = "fail";
    if (v5) {
      unint64_t v7 = "pass";
    }
    int v15 = v4;
    uint64_t v8 = "NO";
    if (!v6) {
      uint64_t v8 = "YES";
    }
    __int16 v16 = 2080;
    *(void *)int v17 = v7;
    *(_WORD *)&v17[8] = 2080;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "iter# %u - ASP status %s - is BDR done: %s (%u)",  buf,  0x22u);
    int v6 = outputStruct;
  }

  if (v6)
  {
    int v9 = 0;
    while (1)
    {
      BOOL should_defer = xpc_activity_should_defer(a2);
      BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (should_defer) {
        break;
      }
      ++v9;
      if (v11)
      {
        *(_DWORD *)buf = 67109632;
        int v15 = v9;
        __int16 v16 = 1024;
        *(_DWORD *)int v17 = 6;
        *(_WORD *)&v17[4] = 1024;
        *(_DWORD *)&v17[6] = 5;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "  - defer chck %u/%u - sleeping for %us",  buf,  0x14u);
      }

      sleep(5u);
      if (v9 == 6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v15 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "iter# %u - DONE sleeping - more BDR",  buf,  8u);
        }

        ++v4;
        goto LABEL_5;
      }
    }

    if (v11)
    {
      *(_DWORD *)buf = 67109376;
      int v15 = v9 + 1;
      __int16 v16 = 1024;
      *(_DWORD *)int v17 = 6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "  - defer chck %u/%u - deferring!!!!",  buf,  0xEu);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = v4;
      uint64_t v12 = "iter# %u - DONE for now - more BDR";
      goto LABEL_31;
    }
  }

  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 67109120;
    int v15 = v4;
    uint64_t v12 = "iter# %u - DONE - no more BDR";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
  }

  if (outputStruct && xpc_activity_should_defer(a2))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "deferring nand_task_scheduler daemon\n",  buf,  2u);
    }

    xpc_activity_state_t state = xpc_activity_set_state(a2, 3LL);
    goto LABEL_41;
  }

LABEL_39:
  xpc_activity_state_t state = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)state)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "stopping nand_task_scheduler daemon\n",  buf,  2u);
  }

LABEL_41:
  xpc_transaction_exit_clean(state);
}

void *sub_100019AD0()
{
  return &statsSelector;
}

void *sub_100019ADC()
{
  return &readStatsSelector;
}

void *sub_100019AE8()
{
  return &mspStatsSelector;
}

void *sub_100019AF4()
{
  return &defectsListSelector;
}

void *sub_100019B00()
{
  return &telemetryListSelectors;
}

void *sub_100019B0C()
{
  return &taskSchedulerSelectors;
}

void *sub_100019B18()
{
  return &snapshotSelectors;
}

void *sub_100019B24()
{
  return &snapshotHeaderSelectors;
}

void *sub_100019B30()
{
  return &bandStatsSelector;
}

void *sub_100019B3C()
{
  return &geomErrPayloadSelectors;
}

uint64_t FindServiceUsingIterator(const char *a1)
{
  io_iterator_t iterator = 0;
  io_registry_entry_t RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
  if (!RootEntry) {
    return 0LL;
  }
  io_object_t v3 = RootEntry;
  if (IORegistryEntryCreateIterator(RootEntry, "IOService", 1u, &iterator))
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    while (1)
    {
      uint64_t v5 = IOIteratorNext(iterator);
      uint64_t v4 = v5;
      if (!(_DWORD)v5 || IOObjectConformsTo(v5, a1)) {
        break;
      }
      IOObjectRelease(v4);
    }
  }

  if (iterator)
  {
    IOObjectRelease(iterator);
    io_iterator_t iterator = 0;
  }

  IOObjectRelease(v3);
  return v4;
}

uint64_t findNandExporter(char ***a1)
{
  unint64_t v2 = nand_exporters_tunnel;
  if (nand_exporters_tunnel)
  {
    io_object_t v3 = &nand_exporters_tunnel;
    uint64_t v4 = "NANDInfo: findNandExporter: Controller found: %s\n";
    do
    {
      uint64_t v5 = IOServiceMatching(v2);
      if (v5)
      {
        uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
        if ((_DWORD)MatchingService) {
          goto LABEL_11;
        }
      }

      unint64_t v7 = v3[21];
      v3 += 21;
      unint64_t v2 = v7;
    }

    while (v7);
  }

  io_object_t v3 = &nand_exporters_tunnel;
  fwrite( "Failed to find matching service with IOServiceGetMatchingService, trying iterator...\n",  0x55uLL,  1uLL,  __stderrp);
  uint64_t v8 = nand_exporters_tunnel;
  if (nand_exporters_tunnel)
  {
    uint64_t v4 = "Find service for class %s\n";
    while (1)
    {
      uint64_t MatchingService = FindServiceUsingIterator(v8);
      if ((_DWORD)MatchingService) {
        break;
      }
      int v9 = v3[21];
      v3 += 21;
      uint64_t v8 = v9;
      if (!v9) {
        goto LABEL_10;
      }
    }

LABEL_11:
    uint64_t v10 = MatchingService;
    syslog(5, v4, *v3);
    goto LABEL_12;
  }

LABEL_10:
  uint64_t v10 = 0LL;
LABEL_12:
  *a1 = v3;
  return v10;
}

char *findNandExporter_tunnel(char ***a1)
{
  io_connect_t connect = 0;
  *a1 = 0LL;
  int v2 = pthread_mutex_trylock(&serializeAccess);
  if (v2)
  {
    if (v2 != 16
      || (syslog(4, "Warning: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&serializeAccess)))
    {
      io_object_t v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0LL;
    }
  }

  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  uint64_t v5 = &nand_exporters_tunnel;
  uint64_t result = nand_exporters_tunnel;
  if (!nand_exporters_tunnel)
  {
LABEL_11:
    io_object_t v8 = 0;
    goto LABEL_12;
  }

  while (1)
  {
    int v6 = IOServiceMatching(result);
    if (!v6) {
      goto LABEL_10;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService) {
      goto LABEL_10;
    }
    io_object_t v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect)) {
      break;
    }
    IOServiceClose(connect);
    io_connect_t connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    int v9 = v5[21];
    v5 += 21;
    uint64_t result = (char *)v9;
    if (!v9) {
      goto LABEL_11;
    }
  }

  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  uint64_t result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t ReleaseIOInterfaces(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }

  io_object_t v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }

  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&serializeAccess);
}