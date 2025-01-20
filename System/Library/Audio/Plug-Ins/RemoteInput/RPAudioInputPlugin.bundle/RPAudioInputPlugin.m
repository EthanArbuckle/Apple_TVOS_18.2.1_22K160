void sub_4018(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *sub_4084(void *result)
{
  v1 = result;
  if (dword_D090 <= 30)
  {
    if (dword_D090 != -1 || (result = (void *)_LogCategory_Initialize(&dword_D090, 30LL), (_DWORD)result)) {
      result = (void *)LogPrintF(&dword_D090, "-[RPAudioInputPlugin activate]_block_invoke", 30LL, "Activate\n");
    }
  }

  if (!*(void *)(v1[4] + 48LL))
  {
    v2 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport.siri-audio");
    uint64_t v3 = v1[4];
    v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;

    objc_msgSend(*(id *)(v1[4] + 48), "setDelegate:");
    [*(id *)(v1[4] + 48) _setQueue:*(void *)(v1[4] + 8)];
    return [*(id *)(v1[4] + 48) resume];
  }

  return result;
}

id sub_41AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}
}

void sub_44A4(_Unwind_Exception *a1)
{
}

void sub_4580(_Unwind_Exception *a1)
{
}

id sub_48E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _xpcConnectionInvalidated:*(void *)(a1 + 40)];
}

LABEL_17:
    goto LABEL_18;
  }

  if (v8) {
    v8[2](v8, v10);
  }
LABEL_18:
}

LABEL_74:
                      goto LABEL_99;
                    }

                    *(void *)v19 = v26;
                    v19[2] = 0;
                    v19[3] = v24;
                    v19 += 4;
                  }

                  v17 = v37;
                  v40 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
                  if (v40) {
                    continue;
                  }
                  break;
                }
              }

              v27 = v17;
              -[AVAudioCompressedBuffer setPacketCount:](v17, "setPacketCount:", v10);
              v28 = -[AVAudioTime initWithSampleTime:atRate:]( objc_alloc(&OBJC_CLASS___AVAudioTime),  "initWithSampleTime:atRate:",  self->_packetCount,  1.0);
              if (v28)
              {
                Double = CFDictionaryGetDouble(v4, &off_8380, &v47);
                v30 = Double;
                v48 = AVAudioRemoteInputBufferGainKey;
                *(float *)&Double = v30;
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", Double));
                v49 = v31;
                v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));

                if (dword_D090 <= 10 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 10LL))) {
                  LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  10LL,  "Received Siri audio: ST %u, PC %u, %u bytes, gain %f\n",  self->_packetCount,  v10,  v42,  v30);
                }
                v35 = objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice audioInputBlock](self->_inputDevice, "audioInputBlock"));
                v36 = (void *)v35;
                if (v35)
                {
                  (*(void (**)(uint64_t, AVAudioCompressedBuffer *, AVAudioTime *, void *))(v35 + 16))( v35,  v27,  v28,  v32);
                  self->_packetCount += (self->_framesPerPacket * v10);
                }

                else if (dword_D090 <= 90 {
                       && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
                }
                {
                  LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### No audio input block\n");
                }
              }

              else if (dword_D090 <= 90 {
                     && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
              }
              {
                LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Create audio time failed\n");
              }

              v14 = v38;
              v17 = v27;
            }

            else if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
            {
              LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Null packet descriptions array\n");
            }
          }

          else if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
          {
            LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Create audio buffer for receive failed\n");
          }

LABEL_99:
        }
      }

      else if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
      {
        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio without media data: %#m\n");
      }
    }
  }

  else if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
  {
    LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio without packet descriptions: %#m\n");
  }

LABEL_102:
}

void sub_59B4(_Unwind_Exception *a1)
{
}

id objc_msgSend_xpcSiriStopClientRecordingWithDeviceId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcSiriStopClientRecordingWithDeviceId:");
}