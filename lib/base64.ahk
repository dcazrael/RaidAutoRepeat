/**
 * decodes base64 string to binary data
 *
 * @Parameters
 *    @OutData    - [string] name of the variable to hold the binary data
 *    @InData     - [string] base64 data string  without prefixes (no datatypes etc)
 *
 * @Source    - https://autohotkey.com/board/topic/85709-base64enc-base64dec-base64-encoder-decoder/
 * 
 * @Return
 *    int
*/
Base64dec( ByRef OutData, ByRef InData ) {
 DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
        , UInt,StrLen(InData), UInt,1, UInt,0, UIntP,Bytes, Int,0, Int,0, "CDECL Int" )
 VarSetCapacity( OutData, Req := Bytes * ( A_IsUnicode ? 2 : 1 ) )
 DllCall( "Crypt32.dll\CryptStringToBinary" ( A_IsUnicode ? "W" : "A" ), UInt,&InData
        , UInt,StrLen(InData), UInt,1, Str,OutData, UIntP,Req, Int,0, Int,0, "CDECL Int" )
Return Bytes
}


/**
 * NT native compression written by SKAN
 *
 * @Parameters
 *    @Data    - [string] binary data
 *    @DataSize    - [int] size of data to be compressed
 *    @TrgFile    - [string] target filename
 *
 * @Source    - https://autohotkey.com/board/topic/85709-base64enc-base64dec-base64-encoder-decoder/
 *
 * @Return
 *    int
*/
VarZ_Save( ByRef Data, DataSize, TrgFile ) {
 hFile :=  DllCall( "_lcreat", ( A_IsUnicode ? "AStr" : "Str" ),TrgFile, UInt,0 )
 IfLess, hFile, 1, Return "", ErrorLevel := 1
 nBytes := DllCall( "_lwrite", UInt,hFile, UInt,&Data, UInt,DataSize, UInt )
 DllCall( "_lclose", UInt,hFile )
Return nBytes
}
